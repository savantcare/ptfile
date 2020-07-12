<template>
  <el-form label-width="120px">
    <el-form-item v-for="id in daRemID" :key="id">
      <el-input
        type="textarea"
        style="width: 800px;"
        :class="mfGetDirtyClassName(id)"
        :autosize="{ minRows: 2, maxRows: 10 }"
        placeholder="Please enter the reminder .."
        :value="getDescription(id)"
        @input="setDescription($event, id)"
      ></el-input>
      <el-button plain type="warning" @click="removeRexFromForm(id)">Remove</el-button>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" plain @click="sendDataToServer">Submit</el-button>
      <el-button type="primary" plain @click="addRemToUI">Add more</el-button>
      <el-button type="warning" plain @click="resetForm">Reset form</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
import { REMINDER_API_URL } from '../const.js'
import ormRem from '@/cts/rem/vuex-orm/model.js'
export default {
  data() {
    return {
      daRemID: [],
    }
  },
  computed: {},
  mounted() {
    /*
      Should data be loaded from localstorage or state
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
    const arResultsFromORM = ormRem.query().where('$isNew', true).get()
    if (arResultsFromORM.length) {
      console.log('unsaved data found', arResultsFromORM, arResultsFromORM[0].$id)
      for (let i = 0; i < arResultsFromORM.length; i++) {
        this.daRemID.push(arResultsFromORM[i].$id)
      }
    } else {
      // When there is no unsaved data then we add an empty data to the state inside vuex
      console.log('No Unsaved data')
      this.addRemToUI()
    }
  },
  methods: {
    // Initially tried to write v-model and this was computed function
    // But vmodel+computed the description id cannot be sent to computed fn
    getDescription(pRemID) {
      // TODO: change this to pRemUUID
      console.log(pRemID)
      const arResultsFromORM = ormRem.find(pRemID)
      if (arResultsFromORM) {
        console.log(arResultsFromORM)
        // ['remDescription']
        console.log(arResultsFromORM.uuid)
        return arResultsFromORM.remDescription
      } else {
        return ''
      }
    },
    setDescription(pEvent, pRemID) {
      console.log('set called for', pRemID, pEvent)
      const arResultsFromORM = ormRem.update({
        where: pRemID,
        data: {
          remDescription: pEvent,
        },
      })
      console.log(arResultsFromORM)
    },
    mfGetDirtyClassName(pRemID) {
      console.log(pRemID)
      const arResultsFromORM = ormRem.find(pRemID)
      if (arResultsFromORM.$isDirty) {
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    addRemToUI() {
      console.log('Add rem called')
      const arResultsFromORM = ormRem
        .insert({
          data: {
            remDescription: '',
            priority: 1,
            isAutoRem: 1,
            ROW_START: new Date().getTime(),
            ROW_END: '2038-01-19 03:14:07.999999',
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
      const arResultsFromORM = ormRem.query().where('$isNew', true).get()
      if (arResultsFromORM.length) {
        console.log('unsaved data found', arResultsFromORM, arResultsFromORM[0].uuid)
        const arRemsToCreateInDB = []
        for (let i = 0; i < arResultsFromORM.length; i++) {
          console.log('call API', arResultsFromORM[i].uuid)
          arRemsToCreateInDB.push({
            uuid: arResultsFromORM[i].uuid,
            remDescription: arResultsFromORM[i].remDescription,
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
              /* Method 1: Update exisitng record
            In this method in July 2020 we were not able to set isDirty to false
            Posted bug at: https://github.com/vuex-orm/plugin-change-flags/issues/12     
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

              /* Method2: Delete existing and insert from item */
              console.log(item.uuid)
              ormRem.delete(item.uuid).then((result) => {
                console.log('update result: ', result)
              })
              console.log('item is')
              console.log(item)

              /*              item.$isDirty = false;
              item.$isNew = false;
              console.log(item)
              */
              ormRem.insert({
                data: {
                  uuid: item.uuid,
                  uuidOfRemMadeFor: item.uuidOfRemMadeFor,
                  remDescription: item.remDescription,
                  priority: item.priority,
                  isAutoRem: item.isAutoRem,
                  ROW_START: item.ROW_START,
                  ROW_END: item.ROW_END,
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
        console.log('unsaved data found', arResultsFromORM, arResultsFromORM[0].uuid)
        for (let i = 0; i < arResultsFromORM.length; i++) {
          console.log('Deleting data from ORM')
          ormRem.delete(arResultsFromORM[i].uuid)
        }
      } else {
        console.log('No Unsaved data')
      }
      this.daRemID = []
      this.addRemToUI()
    },
    removeRexFromForm(pRemID) {
      ormRem.delete(pRemID)
      const positionFound = this.daRemID.indexOf(pRemID)
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
