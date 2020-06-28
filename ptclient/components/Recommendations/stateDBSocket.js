import { RECOMMENDATION_API_URL } from "@/const/others.js";
import ormRecommendation from "./vuex-orm-models/recommendation";
let TOKEN = localStorage.getItem("token");
export default {
  state: {
    // KT: Cannot be changed directly. Can only be changed through mutation

    yourRecommendationsList: [], // TODO: This should be stored with the key of timeOfStateSelectedInHeader. When timeOfStateSelectedInHeader is null that indicates current state.
    // This needs to be a 2 dimensional array. Right now it is a one dimensional array
    // How to do it? Use object-path-immutable Ref: https://stackoverflow.com/questions/52747205/multidimensional-arrays-vuex-mutations
    // Only addendums need to be reactive the remaining old data does not need to be reactive.
    othersList: [],
    tableList: [], // TODO: Needs better name. I have no idea what tableList means or does.
    multiStateYourRecommendationsList: {}, // Suppose there are 10 historical appointments. When Doctor uses slider to go from appt A to B and then goes back to A the data of A is not in cache.
    multiStateOtherRecommendationsList: [],
    yourRecsEvalAtEachRowEnd: {},
    othersRecsEvalAtEachRowEnd: {},
  },

  data: {
    oneQueryIsRunningGate: false,
  },
  // More info
  // It should be noted that properties in data are only reactive if they existed when the instance was created. Ref: https://vuejs.org/v2/guide/instance.html

  mutations: {
    setRecommendationList(state, data) {
      state.yourRecommendationsList = data;
    },
    addNewRecommendation(state, newList) {
      newList.forEach((item) => {
        state.yourRecommendationsList.push(item);
      });
    },
    removeNewRecommendation(state) {
      state.yourRecommendationsList.pop();
    },
    setOthersList(state, value) {
      state.othersList = value;
    },
    setRecommendationTableList(state, value) {
      // TODO: Not clear from name what this does.
      state.tableList = value;
    },
    setMultiStateYourRecommendationList(state, value) {
      /* This needs to use object-path-immutable Ref: https://stackoverflow.com/questions/52747205/multidimensional-arrays-vuex-mutations
      psuedo code will be:
            state.multiStateYourRecommendationsList = immutable.push(state.multiStateYourRecommendationsList, '0.children.0.children', { id, name, parent_id });
      */
      const { data, timeOfStateSelectedInHeader } = value;
      state.multiStateYourRecommendationsList[
        timeOfStateSelectedInHeader
      ] = data;
    },
    setMultiStateOtherRecommendationList(state, value) {
      state.multiStateOtherRecommendationsList = value;
    },

    /**
      Socket Listeners: Uses library: https://github.com/MetinSeylan/Vue-Socket.io
      main.js has:
      Vue.use(new VueSocketIO({
        debug: true,
        connection: SocketIO(SOCKET_API_URL, {}),
        vuex: {
          store,
          actionPrefix: "SOCKET_",
          mutationPrefix: "SOCKET_"
        }
      })
      );     
     */

    // -------- Socket event type 1/3
    // QUESTION:? Should multiple add be handled like multiple discontinue? As per VK yes.
    SOCKET_ADD_RECOMMENDATION(state, newDataList) {
      // Msg recd from node-server/routes/recommendation.route.js:26  io.to(`room-${patientId}-Doctor`).emit("ADD_RECOMMENDATION", newRecommendation)
      // The message emitted on the server is ADD_RECOMMENDATION. The library vue-socket.io adds the word SOCKET_ to the event name and sends the event here

      // Say 10 clients are connection. Client 9 when it added the data its data-table showed the data added immediately. Now when the socket message comes back from the server. we need to find out client 9 and not insert the same row in the list maintained by client 9
      if (state.yourRecommendationsList.length > 0) {
        const lastData =
          state.yourRecommendationsList[
            state.yourRecommendationsList.length - 1
          ];
        // TODO: How will this work if there are multiple recommendations being added?
        // Is it a better idea to emit seperate messages for each add being done?
        if (lastData.uuid == newDataList[newDataList.length - 1].uuid) {
          return; // This return statement skips client 9, where this data was added by the user.
        }
      }

      // If only one data could be inserted then call -> state.yourRecommendationsList.push(newData)
      // The add form can be used to insert multiple data points.
      newDataList.forEach((item) => {
        state.yourRecommendationsList.push(item);
      });
    },

    // -------- Socket event type 2/3
    SOCKET_UPDATE_RECOMMENDATION(state, updateData) {
      // This should be called CHANGE. Since the 3 actions are Add / Change (update query) / Discontinue (Delete query)
      let newList = [];
      state.yourRecommendationsList.forEach((item) => {
        if (item.uuid != updateData.uuid) {
          newList.push(item);
        } else {
          newList.push(updateData);
        }
      });
      state.yourRecommendationsList = newList;
    },

    // ------------ Socket event type 3/3
    SOCKET_DISCONTINUE_RECOMMENDATION(state, dispatchId) {
      // For multiple discontinue each discontinue gets a different socket message. For 4 discontinue 4 api calls are made.
      console.log("SOCKET_DISCONTINUE_RECOMMENDATION");
      console.log(dispatchId);
      console.log(state.yourRecommendationsList);

      // The filter() method creates an array filled with all array elements that pass a test (provided as a function).
      const newList = state.yourRecommendationsList.filter((item) => {
        return item.uuid != dispatchId;
      });
      state.yourRecommendationsList = newList;
      console.log(state.yourRecommendationsList);
    },
  },
  actions: {
    // Category 1/2: Functions to get data
    async dbGetMyRecommendationsInSM({ commit }, json) {
      const { patientId, notify, userId, date } = json;

      console.log(commit);
      if (TOKEN == null) {
        TOKEN = localStorage.getItem("token");
      }
      try {
        if (!this.oneQueryIsRunningGate) {
          this.oneQueryIsRunningGate = true;
          let countRex = await ormRecommendation.query().count();

          console.log("Number of recs before query =>", countRex);
          if (countRex == 0) {
            await ormRecommendation
              .api()
              .post(RECOMMENDATION_API_URL + "/getMyRecommendations", {
                headers: {
                  Authorization: "Bearer " + TOKEN,
                  "Content-Type": "application/json;charset=utf-8",
                },
                patientId: patientId,
                userId: userId,
                date: date,
              });
            console.log(
              "Number of rex in model =>",
              ormRecommendation.query().count()
            );
          }
          this.oneQueryIsRunningGate = false;
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error",
        });
      }
    },
    async dbGetOtherRecommendationsInSM({ commit }, json) {
      const { patientId, notify, userId, date } = json;
      if (TOKEN == null) {
        TOKEN = localStorage.getItem("token");
      }
      try {
        const response = await fetch(
          `${RECOMMENDATION_API_URL}/getOthersRecommendations`,
          {
            headers: {
              Authorization: "Bearer " + TOKEN,
              "Content-Type": "application/json;charset=utf-8",
            },
            method: "POST",
            body: JSON.stringify({
              patientId: patientId,
              userId: userId,
              date: date,
            }),
          }
        );
        if (response.ok) {
          let json = await response.json();
          commit("setOthersList", json);
        } else {
          notify({
            title: "Error",
            message: "Failed to get other's recommendation data",
          });
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error",
        });
      }
    },
    async dbGetMultiStateMyRecommendationsInSM({ commit, rootState }, params) {
      const { date, patientId, userId } = params;
      console.log(date);
      const response = await fetch(`${RECOMMENDATION_API_URL}/getByDate`, {
        headers: {
          Authorization: "Bearer " + TOKEN,
          "Content-Type": "application/json;charset=utf-8",
        },
        method: "POST",
        body: JSON.stringify({
          patientId: patientId,
          userId: userId,
          date: date,
        }),
      });
      if (response.ok) {
        const json = await response.json();
        const timeOfStateSelectedInHeader = rootState.multiStateDisplayArea.timeOfStateSelectedInHeader.split(
          " "
        )[0];
        const params = {
          timeOfStateSelectedInHeader: timeOfStateSelectedInHeader,
          data: json,
        };
        commit("setMultiStateYourRecommendationList", params);
      }
    },

    async dbGetMultiStateOtherRecommendationsInSM({ commit }, json) {
      const { patientId, notify, userId, date } = json;
      if (TOKEN == null) {
        TOKEN = localStorage.getItem("token");
      }
      try {
        const response = await fetch(
          `${RECOMMENDATION_API_URL}/getOthersRecommendations`,
          {
            headers: {
              Authorization: "Bearer " + TOKEN,
              "Content-Type": "application/json;charset=utf-8",
            },
            method: "POST",
            body: JSON.stringify({
              patientId: patientId,
              userId: userId,
              date: date,
            }),
          }
        );
        if (response.ok) {
          let json = await response.json();
          commit("setMultiStateOtherRecommendationList", json);
        } else {
          notify({
            title: "Error",
            message: "Failed to get other's recommendation data",
          });
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error",
        });
      }
    },

    // Category 2/2: Functions to change data
    async dbAddRecommendationInSM({ state, commit }, json) {
      const { data, notify, patientId } = json;
      const originList = state.yourRecommendationsList;

      commit("addNewRecommendation", data);

      try {
        const response = await fetch(RECOMMENDATION_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            Authorization: "Bearer " + TOKEN,
          },
          body: JSON.stringify({ data: data, patientId: patientId }),
        });
        if (!response.ok) {
          notify({
            title: "Error",
            message: "Failed to add recommendation data",
          });

          commit("setRecommendationList", originList);
        } else {
          notify({
            title: "Success",
            message: "Saved!",
          });
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error",
        });
        commit("setRecommendationList", originList);
      }
    },

    async dbUpdateRecommendationInSM({ state, commit }, json) {
      const { data, notify } = json;
      const originList = state.yourRecommendationsList;
      let newList = [];
      originList.forEach((item) => {
        if (item.uuid == data.uuid) {
          newList.push(data);
        } else {
          newList.push(item);
        }
      });
      console.log(newList);
      commit("setRecommendationList", newList);
      try {
        const response = await fetch(`${RECOMMENDATION_API_URL}`, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            Authorization: "Bearer " + TOKEN,
          },
          body: JSON.stringify(data),
        });
        if (!response.ok) {
          notify({
            title: "Error",
            message: "Failed to update recommendation data",
          });

          commit("setRecommendationList", originList);
        } else {
          notify({
            title: "Title",
            message: "Updated!",
          });
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error",
        });
        commit("setRecommendationList", originList);
      }
    },

    async dbDiscontinueRecommendationInSM({ state, commit }, json) {
      const { data, notify } = json;
      const originList = state.yourRecommendationsList;
      const newList = originList.filter((item) => {
        return item.uuid != data.uuid;
      });

      commit("setRecommendationList", newList);
      try {
        const response = await fetch(`${RECOMMENDATION_API_URL}/${data.uuid}`, {
          method: "DELETE", // Temporal DB!! The row is still there. Just the end time is set.
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            Authorization: "Bearer " + TOKEN,
          },
          body: JSON.stringify(data),
        });
        if (!response.ok) {
          notify({
            title: "Error",
            message: "Failed to discontinue recommendation data",
          });
          commit("setRecommendationList", originList);
        } else {
          notify({
            title: "Title",
            message: "Deleted",
          });
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error",
        });

        commit("setRecommendationList", originList);
      }
    },

    async dbMultiDiscontinueRecommendationsInSM({ state, commit }, json) {
      const { selectedIds, notify, selectedDatas } = json;
      const originList = state.yourRecommendationsList;
      const newList = originList.filter((item) => {
        return !selectedIds.includes(item.uuid);
      });

      commit("setRecommendationList", newList);

      console.log("inside");
      console.log(selectedDatas);

      selectedDatas.forEach(async (item) => {
        try {
          item["discontinue"] = true;
          await fetch(`${RECOMMENDATION_API_URL}/${item.uuid}`, {
            method: "DELETE", // Temporal DB!! The row is still there. Just the end time is set.
            headers: {
              "Content-Type": "application/json;charset=utf-8",
              Authorization: "Bearer " + TOKEN,
            },
            body: JSON.stringify(item),
          });
        } catch (ex) {
          notify({
            title: "Error",
            message: "Server connection error",
          });
          commit("setRecommendationList", originList);
        }
      });
    },
  },
  getters: {
    recommendations(state) {
      return state.yourRecommendationsList.filter((item) => {
        return item.discontinue != true;
      });
    },
  },
};
