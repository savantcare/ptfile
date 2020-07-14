<template>
  <!-- What is the of add user experience?
    1. Give visual feedback to the user that the data was added.
    2. Visual feedback should come close to where the user eyes are. The visual feedback should not be on top right corner.
    3. Immediately allow the user to add one more.
    4. User should be able to add 1 more without taking another action with their mouse.
    5. While the data is being sent to the server allow the user to add one more.
    6. If user does "add more" and now there are 2 add more forms open. The first rem has 5 charecters and 2nd rem has 2 charecters.
        On clicking submit the 1st should move down and the 2nd should stay up.
    -->

  <div>
    <el-form>
      <el-form-item v-for="rem in cfDataAddedOnClientThisSession" :key="rem.id">
        <!-- Prop explaination 
          Read prop explanation for span=4 on line 18
           -->

        <el-col :span="20" :class="rem.validationClass">
          <el-input
            type="textarea"
            :class="mfGetDirtyClassName(rem.id)"
            :autosize="{ minRows: 2, maxRows: 10 }"
            placeholder="Please enter the reminder .."
            :value="getDesc(rem.id)"
            @input="setDesc($event, rem.id)"
          ></el-input>
          <div v-if="rem.isValidationError" class="el-form-item__error">
            Please enter minimum 3 characters.
          </div>
        </el-col>

        <!-- Prop explaination 
            Goal: Show the remove button on the right hand side of the input area. Since element.io divides it into 24 columns. we are giving 
            20 columns to input and 4 columns to remove button
           -->
        <el-col :span="4">
          <el-button
            plain
            type="warning"
            @click="removeSingleRemInAddForm(rem.id)"
            style="float: right;"
            >Remove</el-button
          >
        </el-col>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" plain @click="onSubmit">Submit</el-button>
        <el-button type="primary" plain @click="addEmptyRemToUI">Add more</el-button>
        <el-button type="warning" plain @click="resetForm">Reset form</el-button>
      </el-form-item>
    </el-form>
    <!-- In a for loop show all reminders that have orm.RowStateOfClientSession = 231 
          The table "Reminders added this session" only comes if there is atleast a single row

          The row color will be orange if the number is 234 or 235
          the row color will be white if the number is 231

          As soon submit is pressed  RowStateOfClientSession = 24
          when the api succeed RowStateOfClientSession = 241
              Why not set RowStateOfClientSession = 1 when api succeds?
                For the end user it is a matter of comfort to see the previous data in the table.
      -->
    <el-table
      v-if="cfDataSavedToDBThisSessionSuccessfully.length > 0"
      :data="cfDataSavedToDBThisSessionSuccessfully"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="remDesc" label="Reminders added this session"> </el-table-column>
    </el-table>

    <!-- Showing errors -->
    <el-table
      v-if="cfDataApiErrorThisSession.length > 0"
      :data="cfDataApiErrorThisSession"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="remDesc" label="Error: Reminders attempted but failed to save">
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
import { REMINDER_API_URL } from '../const.js'
import ormRem from '@/cts/spi/rem/db/vuex-orm/model.js'
export default {
  data() {
    return {}
  },
  computed: {
    cfDataAddedOnClientThisSession() {
      const arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 2)
        .orWhere('rowStateOfClientSession', 23)
        .orWhere('rowStateOfClientSession', 2345)
        .get()
      return arResultsFromORM
    },
    cfDataSavedToDBThisSessionSuccessfully() {
      const arResultsFromORM = ormRem.query().where('rowStateOfClientSession', 23461).get()
      return arResultsFromORM
    },
    cfDataApiErrorThisSession() {
      const arResultsFromORM = ormRem.query().where('rowStateOfClientSession', 23467).get()
      return arResultsFromORM
    },
  },
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
    // Goal: When there is unsaved data in the state then load the unsaved data
    const arResultsFromORM = ormRem
      .query()
      .where('rowStateOfClientSession', 2)
      .orWhere('rowStateOfClientSession', 23)
      .orWhere('rowStateOfClientSession', 2345)
      .get()
    if (arResultsFromORM.length) {
      console.log('there is unsaved data')
    } else {
      // When there is no unsaved data then we add an empty data to the state inside vuex
      console.log('No Unsaved data')
      this.addEmptyRemToUI()
    }
  },
  methods: {
    /* Why are getDesc and setDesc not a single computed function called desc with a setter and a getter
      Initially tried to write v-model and this was computed function
       But vmodel+computed the Desc id cannot be sent to computed fn
       */
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
          validationClass: '',
          isValidationError: false,
        },
      })
      console.log(arResultsFromORM)
    },
    mfGetDirtyClassName(pRemIDGivenByORM) {
      console.log(pRemIDGivenByORM)
      const arResultsFromORM = ormRem.find(pRemIDGivenByORM)
      if (arResultsFromORM && arResultsFromORM.rowStateOfClientSession === 23) {
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    addEmptyRemToUI() {
      console.log('Add rem called')
      const arResultsFromORM = ormRem.insert({
        data: {
          remDesc: '',
          priority: 1,
          isAutoRem: 0,
          rowStateOfClientSession: 2, // For meaning of diff values read rem/db/vuex-orm/models.js:71
          ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
          ROW_END: 2147483647.999999, // this is unix_timestamp value from mariaDB for ROW_END when a record is created new in MariaDB system versioned table.
        },
      })
      console.log(arResultsFromORM)
    },

    onSubmit() {
      let arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 23)
        .orWhere('rowStateOfClientSession', 2)
        .get()
      if (arResultsFromORM.length) {
        console.log('unsaved data found', arResultsFromORM)
        for (let i = 0; i < arResultsFromORM.length; i++) {
          if (arResultsFromORM[i].remDesc.length < 3) {
            ormRem.update({
              where: (record) => record.id === arResultsFromORM[i].id,
              data: {
                validationClass: 'validaionErrorExist',
                rowStateOfClientSession: '2345',
                isValidationError: true,
              },
            })
          } else {
            ormRem.update({
              where: (record) => record.id === arResultsFromORM[i].id,
              data: {
                validationClass: '',
                rowStateOfClientSession: '2346',
                isValidationError: false,
              },
            })
            console.log('calling api to save data', ormRem)

            // API will return 1 (Success) or 0 (Failure)
            const status = this.sendDataToServer(arResultsFromORM[i])

            console.log(status)
            if (status === 0) {
              ormRem.update({
                where: (record) => record.id === arResultsFromORM[i].id,
                data: {
                  rowStateOfClientSession: '23467',
                },
              })
            } else {
              ormRem.update({
                where: (record) => record.id === arResultsFromORM[i].id,
                data: {
                  rowStateOfClientSession: '23461',
                },
              })
            }
          }
        }
      }
      // if there are no records left then I need to add a empty
      arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 2)
        .orWhere('rowStateOfClientSession', 23)
        .orWhere('rowStateOfClientSession', 2345)
        .get()
      if (arResultsFromORM.length) {
      } else {
        this.addEmptyRemToUI()
      }
    },
    async sendDataToServer(pORMRowArray) {
      /* Should bulk created be used Out of 10 reminders set what if 9 got created successfuly but 1 failed? 
To keep code simple it was decided by VK on 13th July 2020 that for creasting 10 items we will fire 10 API calls.
*/

      console.log(pORMRowArray, REMINDER_API_URL)
      const status = Math.floor(Math.random() * (1 - 0 + 1)) + 0 // Ref: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
      return status
    },
    resetForm(formName) {
      const arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 2)
        .orWhere('rowStateOfClientSession', 23)
        .get()
      if (arResultsFromORM.length) {
        console.log('unsaved data found', arResultsFromORM)
        for (let i = 0; i < arResultsFromORM.length; i++) {
          console.log('Deleting data from ORM')
          ormRem.delete(arResultsFromORM[i].$id)
        }
      } else {
        console.log('No Unsaved data')
      }
      this.addEmptyRemToUI()
    },
    removeSingleRemInAddForm(pRemIDGivenByORM) {
      ormRem.delete(pRemIDGivenByORM)
      // if there are no records left then I need to add a empty
      const arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 2)
        .orWhere('rowStateOfClientSession', 23)
        .orWhere('rowStateOfClientSession', 2345)
        .get()
      if (arResultsFromORM.length) {
      } else {
        this.addEmptyRemToUI()
      }
    },
  },
}
</script>

<style>
.unsaved-data textarea {
  border-color: #e6a23c;
}
.validaionErrorExist .el-textarea__inner {
  border-color: #ff4949;
}
</style>
