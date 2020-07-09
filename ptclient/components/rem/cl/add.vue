<template>
  <el-form label-width="120px">
    <el-form-item v-for="id in arRemID" label="desc" :key="id">
      <el-input
        type="textarea"
        style="width: 800px;"
        :autosize="{ minRows: 2, maxRows: 10 }"
        placeholder="Please input"
        :value="getDescription(id)"
        @input="setDescription($event, id)"
      ></el-input>
      <el-button type="warning" @click="removeRexFromForm(id)"
        >Remove</el-button
      >
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="sendDataToServer">Submit</el-button>
      <el-button type="primary" @click="addRem">Add more</el-button>
      <el-button type="warning" @click="resetForm">Reset form</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
import ormRem from '@/components/rem/vuex-orm/model.js'
export default {
  data() {
    return {
      arRemID: [],
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
      const resultSet = ormRem.query().where('$isNew', true).get()
      
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
    const resultSet = ormRem.query().where('$isNew', true).get()
    if (resultSet.length) {
      console.log('unsaved data found', resultSet, resultSet[0].uuid)
      for (let i = 0; i < resultSet.length; i++) {
        this.arRemID.push(resultSet[i].uuid)
      }
    } else {
      // When there is no unsaved data then we add an empty data to the state inside vuex
      console.log('No Unsaved data')
      this.addRem()
    }
  },
  methods: {
      getDescription (pRemID) {
        console.log(pRemID)
        const resultSet = ormRem.find(pRemID)
        if (resultSet){
          console.log(resultSet)
          // ['remDescription']
          console.log(resultSet.uuid)
          return resultSet.remDescription
        }else{
          return ''
        }
      },
      setDescription (pEvent,pRemID) {
        console.log('set called for', pRemID, pEvent)
        const resultSet = ormRem.update({
          where: pRemID,
          data: {
            remDescription: pEvent
          }
        })
        console.log(resultSet)      
      },
    addRem(){
      console.log('Add rem called')
      const ResultSet = ormRem.insert({
        data: {
        remDescription: '',
        priority: 1, 
        isAutoRem: 1,
        ROW_START: 1,
        ROW_END: 1,
        $isNew: true
      }
    }).then((entities) => {
      console.log(entities)
      this.arRemID.push(entities.rem[0].uuid)
      console.log(this.arRemID)
    })
    console.log(ResultSet)
    },
    sendDataToServer(formName) {
      const resultSet = ormRem.query().where('$isNew', true).get()
      if (resultSet.length){
        console.log('unsaved data found', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          console.log ('call API', resultSet[i].uuid)
          // Once server returns true then: set isNew and IsDirty to false
        }
      } else{
        console.log('No Unsaved data')
      }
    },
    resetForm(formName) {
      const resultSet = ormRem.query().where('$isNew', true).get()
      if (resultSet.length){
        console.log('unsaved data found', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          console.log ('Deleting data from ORM')
          ormRem.delete(resultSet[i].uuid)
        }
      } else{
        console.log('No Unsaved data')
      }
      this.arRemID = []
      this.addRem()
    },
    removeRexFromForm(pRemID) {
      ormRem.delete(pRemID)
      const positionFound = this.arRemID.indexOf(pRemID)
      this.arRemID.splice(positionFound, 1);
    },
  }
}
</script>