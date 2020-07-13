<template>
  <!-- Goal of add user experience is: 
    1. Give visual feedback to the user that the data was added.
    2. Visual feedback should come close to where the user eyes are. The visual feedback should not be on top right corner.
    3. Immediately allow the user to add one more.
    4. User should be able to add 1 more without taking another action with their mouse.
    -->

  <div>
    <el-form>
      <el-form-item v-for="id in daRemID" :key="id">
        <!-- Prop explaination 
          Read prop explanation for span=4 on line 18
           -->
        <el-col :span="20">
          <el-input
            type="textarea"
            :class="mfGetDirtyClassName(id)"
            :autosize="{ minRows: 2, maxRows: 10 }"
            placeholder="Please enter the reminder .."
            :value="getDesc(id)"
            @input="setDesc($event, id)"
          ></el-input>
        </el-col>

        <!-- Prop explaination 
            Goal: Show the remove button on the right hand side of the input area. Since element.io divides it into 24 columns. we are giving 
            20 columns to input and 4 columns to remove button
           -->
        <el-col :span="4">
          <el-button
            plain
            type="warning"
            @click="removeSingleRemInAddForm(id)"
            style="float: right;"
            >Remove</el-button
          >
        </el-col>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" plain @click="sendDataToServer">Submit</el-button>
        <el-button type="primary" plain @click="addEmptyRemToUI">Add more</el-button>
        <el-button type="warning" plain @click="resetForm">Reset form</el-button>
      </el-form-item>
    </el-form>
    <!-- In a for loop show all reminders that have orm.RowStateOfClientSession = 3.4.1 
          The table reminders added this session only comes if there is atleast a single row

          The row color will be orange if the number is 3.4
          the row color will be white if the number is 3.4.1

          As soon submit is pressed  RowStateOfClientSession = 3.4
          when the api succeed RowStateOfClientSession = 3.4.1
              Why not set RowStateOfClientSession = 1 when api succeds?
                For the end user it is a matter of comfort to see the previous data in the table.
      -->
    Reminders added this session:
  </div>
</template>
<script>
import { REMINDER_API_URL } from '../const.js'
import ormRem from '@/cts/pis/rem/vuex-orm/model.js'
export default {
  data() {
    return {
      daRemID: [],
    }
  },
  computed: {},
  mounted() {
    /* Should data be loaded from localstorage or state?
      There are 2 possibilities
        Possibility 1: There is no unsaved data
        Possibility 2: There is unsaved data on the client browser
                      2A: Unsaved data is in state / vuex
                      2B: Unsaved data is in Indexed DB
      When there is unsaved data we need to load the unsaved data

      The query to load data from vuex is:
      const arResultsFromORM = ormRem.query().where('$isNew', true).get()

      The permanence of data is:
      Least permanane: data (local variable) of ct    -> Does not survive Ct remounting
      Less permanance: State                          -> Survives previous. Does not survive browser refresh
      Middle permancne: Index DB                      -> Survives previous. Does not survice clean cache or using from diff browser
      Most permanent: Mysql                           -> Survives all previous scenarios

      When Ct is mounted the data should come from:
        Step1: Mysql to get permanent data
        IndexDB: to get unsaved data in the client browser

      Why IndexDB and not state?
        When control comes here there are 2 possibilities:
          1. This is page refresh
          2. This is just Ct being remounted or mounted for the first time
          In both the above cases IndexDB will have the correct data
          State will have the correct data only when the Ct is being remounted.
      Should IndexDB be used?
        +Ves:
          Scenario 1: When browser is refreshed the first load of data will be very fast.
          Scenario 2: If there is some data edited and browser is refreshed that data is still there.
          Scenario 3: If there is some data edited and browser/laptop is rebooted that data is still there.
          Scenario 4: When user is not online then also the user can load the patient file.
        -ves:
          Scenario 1: Suppose doctor has added 1 rem but that is only on indexDB since doctor did not hit submit
                      Suppose doctor closes laptop for 2 days
                      when they come back after 2 days there are 3 new rems on the server
                      When doctor starts the browser, in the code I will have to:
                        1. Get data from mysql server.
                        2. Find data from indexDB where the isDirty or isNew flag is true
                        3. Then the data that is found to be different (unsaved data) needs to be inserted into the array that came back from mysql server
                        4. This array needs to be inserted into vuex
                        5. The new vuex needs to be synced with the storage.
        Decision on 8th July 2020 by VK/AG/TJ/SS/RR: Not to use indexDB
      */
    // When there is unsaved data we load the unsaved data
    const arResultsFromORM = ormRem.query().where('rowStateOfClientSession', 23).get()
    if (arResultsFromORM.length) {
      console.log('unsaved data found', arResultsFromORM, arResultsFromORM[0].$id)
      for (let i = 0; i < arResultsFromORM.length; i++) {
        this.daRemID.push(arResultsFromORM[i].$id)
      }
    } else {
      // When there is no unsaved data then we add an empty data to the state inside vuex
      console.log('No Unsaved data')
      this.addEmptyRemToUI()
    }
  },
  methods: {
    // Initially tried to write v-model and this was computed function
    // But vmodel+computed the Desc id cannot be sent to computed fn
    getDesc(pRemIDGivenByORM) {
      console.log(pRemIDGivenByORM)
      const arResultsFromORM = ormRem.find(pRemIDGivenByORM)
      if (arResultsFromORM) {
        console.log(arResultsFromORM)
        return arResultsFromORM.remDesc
      } else {
        return ''
      }
    },
    setDesc(pEvent, pRemIDGivenByORM) {
      console.log('set called for', pRemIDGivenByORM, pEvent)
      const arResultsFromORM = ormRem.update({
        where: pRemIDGivenByORM,
        data: {
          remDesc: pEvent,
          rowStateOfClientSession: 23,
        },
      })
      console.log(arResultsFromORM)
    },
    mfGetDirtyClassName(pRemIDGivenByORM) {
      console.log(pRemIDGivenByORM)
      const arResultsFromORM = ormRem.find(pRemIDGivenByORM)
      if (arResultsFromORM.rowStateOfClientSession === 23) {
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    addEmptyRemToUI() {
      console.log('Add rem called')
      const arResultsFromORM = ormRem
        .insert({
          data: {
            remDesc: '',
            priority: 1,
            isAutoRem: 0,
            rowStateOfClientSession: 2, // For meaning of diff values read rem/vuex-orm/models.js:71
            ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
            ROW_END: 2147483647.999999, // this is unix_timestamp value from mariaDB for ROW_END when a record is created new in MariaDB system versioned table.
            $isNew: true,
          },
        })
        .then((entities) => {
          console.log(entities)
          this.daRemID.push(entities.rem[0].$id)
          console.log(this.daRemID)
        })
      console.log(arResultsFromORM)
    },
    async sendDataToServer(formName) {
      const arResultsFromORM = ormRem.query().where('rowStateOfClientSession', 23).get()
      if (arResultsFromORM.length) {
        console.log('unsaved data found', arResultsFromORM, arResultsFromORM[0].uuid)
        const arRemsToCreateInDB = []
        for (let i = 0; i < arResultsFromORM.length; i++) {
          console.log('call API', arResultsFromORM[i].uuid)
          arRemsToCreateInDB.push({
            uuid: arResultsFromORM[i].uuid,
            remDesc: arResultsFromORM[i].remDesc,
            priority: arResultsFromORM[i].priority,
            isAutoRem: arResultsFromORM[i].isAutoRem,
            uuidOfRemMadeFor: 'bfe041fa-073b-4223-8c69-0540ee678ff8',
            recordChangedByUUID: 'bfe041fa-073b-4223-8c69-0540ee678ff8',
          })
          // Once server returns true then: set isNew and IsDirty to false
        }
        console.log('Data to send in api', arRemsToCreateInDB)

        try {
          const response = await fetch(REMINDER_API_URL, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json;charset=utf-8',
              // Authorization: 'Bearer ' + TOKEN,
            },
            body: JSON.stringify({
              data: arRemsToCreateInDB,
              patientUUID: 'bfe041fa-073b-4223-8c69-0540ee678ff8',
            }),
          })
          console.log('response=> ', response)
          if (!response.ok) {
          } else {
            arRemsToCreateInDB.forEach((item) => {
              /* Method 1: Update exisitng record when vuex-orm change flag plugin is used
                    In this method in July 2020 we were not able to set isDirty to false
                    Posted bug at: https://github.com/vuex-orm/plugin-change-flags/issues/12 on slack the programmer accepted it as a bug
                    ormRem.update({
                        where: item.uuid,
                        data: { 
                          $isNew: false,
                          },
                      })

                      console.log("trying to set isdirty false")
                      ormRem.update({
                        data: { 
                          uuid: item.uuid,
                          '$isDirty': false, 
                        },
                        preventDirtyFlag: true
                      }).then(result => {
                        console.log('update result: ', result)
                      })
               */

              /* Method 2: Delete existing and insert from item 
                  console.log(item.$id)
                  ormRem.delete(item.$id).then((result) => {
                    console.log('update result: ', result)
                  })
                  console.log('item is')
                  console.log(item)

                  ormRem.insert({
                    data: {
                      uuid: item.uuid,
                      uuidOfRemMadeFor: item.uuidOfRemMadeFor,
                      remDesc: item.remDesc,
                      priority: item.priority,
                      isAutoRem: item.isAutoRem,
                      rowStateOfClientSession: '2.3.1',
                      ROW_START: item.ROW_START,
                      ROW_END: item.ROW_END,
                    },
                  })

                */

              // Method 3: State is maintained by rowStateOfClientSession

              ormRem.update({
                where: item.$id,
                data: {
                  rowStateOfClientSession: 231,
                },
              })
            })
          }
        } catch (ex) {}
      } else {
        console.log('No Unsaved data')
      }
    },
    resetForm(formName) {
      const arResultsFromORM = ormRem.query().where('$isNew', true).get()
      if (arResultsFromORM.length) {
        console.log('unsaved data found', arResultsFromORM)
        for (let i = 0; i < arResultsFromORM.length; i++) {
          console.log('Deleting data from ORM')
          ormRem.delete(arResultsFromORM[i].$id)
        }
      } else {
        console.log('No Unsaved data')
      }
      this.daRemID = []
      this.addEmptyRemToUI()
    },
    removeSingleRemInAddForm(pRemIDGivenByORM) {
      ormRem.delete(pRemIDGivenByORM)
      const positionFound = this.daRemID.indexOf(pRemIDGivenByORM)
      this.daRemID.splice(positionFound, 1)
    },
  },
}
</script>

<style>
.unsaved-data textarea {
  border-color: #e6a23c;
}
</style>
