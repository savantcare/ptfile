<!-- For design see ptclient/docs/forms.md -->
<template>
  <div>
    <el-form>
      <el-form-item v-for="rem in cfRowsInEditStateOnClient" :key="rem.id">
        <!-- Prop explaination  Read prop explanation for span=4 on line 19 -->
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
            Goal: Show remove button on the RHS of input area. Since element.io divides it into 24 columns. we are giving 
            20 columns to input and 4 columns to remove button
           -->
        <el-col :span="4">
          <el-button
            plain
            type="warning"
            style="float: right;"
            @click="removeSingleRemInAddForm(rem.id)"
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
    <!-- Goal: Show data saved successfuly this session -->
    <el-table
      v-if="cfDataSavedToDBThisSessionSuccessfully.length > 0"
      :data="cfDataSavedToDBThisSessionSuccessfully"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="remDesc" label="Reminders added this session"> </el-table-column>
    </el-table>
    <!-- Goal: Show data of API that failed -->
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
import ormRem from '@/cts/spi/rem/db/vuex-orm/rem.js'
export default {
  data() {
    return {}
  },
  computed: {
    cfRowsInEditStateOnClient() {
      const arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 2) // New
        .orWhere('rowStateOfClientSession', 23) // New -> Changed
        .orWhere('rowStateOfClientSession', 2345) // New -> Changed -> Requested save -> form error
        .get()
      return arResultsFromORM
    },
    cfDataSavedToDBThisSessionSuccessfully() {
      // New -> Changed -> Requested save -> Sent to server -> Success
      const arResultsFromORM = ormRem.query().where('rowStateOfClientSession', 23461).get()
      return arResultsFromORM
    },
    cfDataApiErrorThisSession() {
      // New -> Changed -> Requested save -> Sent to server -> Failure
      const arResultsFromORM = ormRem.query().where('rowStateOfClientSession', 23467).get()
      return arResultsFromORM
    },
  },
  mounted() {
    // Goal: If there is no unsaved data then give user a empty form
    const arResultsFromORM = this.cfRowsInEditStateOnClient
    if (!arResultsFromORM.length) this.addEmptyRemToUI()
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
        // New -> Changed
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    addEmptyRemToUI() {
      console.log('Add rem called')
      const arResultsFromORM = ormRem.insert({
        data: {
          rowStateOfClientSession: 2, // For meaning of diff values read rem/db/vuex-orm/rems.js:71
          ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
        },
      })
      console.log(arResultsFromORM)
    },

    async onSubmit() {
      let arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 23) // New -> Changed
        .orWhere('rowStateOfClientSession', 2345) // New -> Changed -> Requested save -> form error
        .get()
      if (arResultsFromORM.length) {
        console.log('unsaved data found', arResultsFromORM)
        for (let i = 0; i < arResultsFromORM.length; i++) {
          if (arResultsFromORM[i].remDesc.length < 3) {
            ormRem.update({
              where: (record) => record.id === arResultsFromORM[i].id,
              data: {
                validationClass: 'validaionErrorExist',
                rowStateOfClientSession: '2345', // New -> Changed -> Requested save -> form error
                isValidationError: true,
              },
            })
          } else {
            ormRem.update({
              where: (record) => record.id === arResultsFromORM[i].id,
              data: {
                validationClass: '',
                rowStateOfClientSession: '2346', // New -> Changed -> Requested save -> Send to server
                isValidationError: false,
              },
            })
            console.log('calling api to save data', ormRem)

            // API will return 1 (Success) or 0 (Failure)
            const status = await this.sendDataToServer(arResultsFromORM[i])

            console.log(status)
            if (status === 0) {
              ormRem.update({
                where: (record) => record.id === arResultsFromORM[i].id,
                data: {
                  rowStateOfClientSession: '23467', // New -> Changed -> Requested save -> Send to server -> API fail
                },
              })
            } else {
              ormRem.update({
                where: (record) => record.id === arResultsFromORM[i].id,
                data: {
                  rowStateOfClientSession: '23461', // New -> Changed -> Requested save -> Send to server -> API Success
                },
              })
            }
          }
        }
      }
      // if there are no records left then I need to add a empty. For goal read docs/forms.md/1.3
      arResultsFromORM = this.cfRowsInEditStateOnClient
      if (arResultsFromORM.length) {
      } else {
        this.addEmptyRemToUI()
      }
    },
    sendDataToServer(pORMRowArray) {
      // Should bulk created be used Out of 10 reminders set what if 9 got created successfuly but 1 failed?
      // To keep code simple it was decided by VK on 13th July 2020 that for creasting 10 items we will fire 10 API calls.
      console.log(pORMRowArray, REMINDER_API_URL)
      const status = Math.floor(Math.random() * (1 - 0 + 1)) + 0 // Ref: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
      return status
    },
    resetForm(formName) {
      const arResultsFromORM = this.cfRowsInEditStateOnClient
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
      // if there are no records left then I need to add a empty. For goal read docs/forms.md/1.3
      const arResultsFromORM = this.cfRowsInEditStateOnClient
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
