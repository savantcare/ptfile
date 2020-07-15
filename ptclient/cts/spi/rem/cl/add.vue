<!-- For design see ptclient/docs/forms.md -->
<template>
  <div>
    <!-- Goal: Show multiple add boxes along with remove each row and reset whole form -->
    <el-form>
      <el-form-item v-for="rem in cfRowsInEditStateInOrm" :key="rem.id">
        <!-- Prop explaination  Read prop explanation for span=4 on line 19 -->
        <el-col :span="20" :class="rem.validationClass">
          <el-input
            type="textarea"
            :class="mfGetCssClassName(rem.id)"
            :autosize="{ minRows: 2, maxRows: 10 }"
            placeholder="Please enter the reminder .."
            :value="getDesc(rem.id)"
            @input="setRemDescInOrmOnTimeout($event, rem.id)"
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
        <el-button type="primary" plain @click="addEmptyRemToOrm">Add more</el-button>
        <el-button type="warning" plain @click="resetForm">Reset form</el-button>
      </el-form-item>
    </el-form>
    <!-- Goal: Show data saved successfuly this session -->
    <el-table
      v-if="cfDataApiSuccessInThisSession.length > 0"
      :data="cfDataApiSuccessInThisSession"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="remDesc" label="Reminders added this session"> </el-table-column>
    </el-table>
    <!-- Goal: Show data of API that failed -->
    <el-table
      v-if="cfDataApiErrorInThisSession.length > 0"
      :data="cfDataApiErrorInThisSession"
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
    return {
      vOrmSaveScheduled: '',
      arrRemDescCached: [],
    }
  },
  computed: {
    cfRowsInEditStateInOrm() {
      // C1/3
      const arFromORM = ormRem
        .query()
        .where('rowStateInThisSession', 2) // New
        .orWhere('rowStateInThisSession', 24) // New -> Changed
        .orWhere('rowStateInThisSession', 2456) // New -> Changed -> Requested save -> form error
        .get()
      return arFromORM
    },
    cfDataApiSuccessInThisSession() {
      // C2/3
      // New -> Changed -> Requested save -> Sent to server -> Success
      const arFromORM = ormRem.query().where('rowStateInThisSession', 24571).get()
      return arFromORM
    },
    cfDataApiErrorInThisSession() {
      // C3/3
      // New -> Changed -> Requested save -> Sent to server -> Failure
      const arFromORM = ormRem.query().where('rowStateInThisSession', 24578).get()
      return arFromORM
    },
  },
  mounted() {
    // Goal: If there is no unsaved data then give user a empty form
    const arFromORM = this.cfRowsInEditStateInOrm
    if (!arFromORM.length) this.addEmptyRemToOrm()
  },
  methods: {
    addEmptyRemToOrm() {
      // M1/9
      console.log('Add rem called')
      const arFromORM = ormRem.insert({
        data: {
          remDesc: '',
          rowStateInThisSession: 2, // For meaning of diff values read rem/db/vuex-orm/rems.js:71
          ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
        },
      })
      console.log(arFromORM)
    },
    /* Why are getDesc and setDesc not a single computed function called desc with a setter and a getter
      Initially tried to write v-model and this was computed function
       But vmodel+computed the Desc id cannot be sent to computed fn
       */
    getDesc(pRemIDGivenByORM) {
      // M2/9
      const contentFromCache = this.arrarrRemDescCached[pRemIDGivenByORM]
      if (!contentFromCache) {
        return this.getRemDescFromOrm(pRemIDGivenByORM)
      } else {
        return this.arrRemDescCached[pRemIDGivenByORM]
      }
    },

    getRemDescFromOrm(pRemIDGivenByORM) {
      const arFromORM = ormRem.find(pRemIDGivenByORM)
      if (arFromORM) {
        return arFromORM.remDesc
      }
    },

    // state updates are smarter.
    setRemDescInOrmOnTimeout(pEvent, pRemIDGivenByORM) {
      // M3/9
      // Full form: Set reminder in vue state on delay

      console.log('enter')

      this.$set(this.arrRemDescCached, pRemIDGivenByORM, pEvent)

      if (this.vOrmSaveScheduled) {
        console.log('clearing timeout')
        clearTimeout(this.vOrmSaveScheduled)
      }
      /* Ref: https://stackoverflow.com/questions/38399050/vue-equivalent-of-settimeout */
      this.vOrmSaveScheduled = setTimeout(
        function (scope) {
          scope.setRemDescInOrm(pEvent, pRemIDGivenByORM)
        },
        5000,
        this
      )
      console.log('exit')
    },

    setRemDescInOrm(pEvent, pRemIDGivenByORM) {
      // M4/9
      console.log('set called for', pRemIDGivenByORM, pEvent)

      const arFromORM = ormRem.update({
        where: pRemIDGivenByORM,
        data: {
          remDesc: pEvent,
          rowStateInThisSession: 24,
          validationClass: '',
          isValidationError: false,
        },
      })
      console.log(arFromORM)
    },
    mfGetCssClassName(pRemIDGivenByORM) {
      // M5/9
      console.log(pRemIDGivenByORM)
      const arFromORM = ormRem.find(pRemIDGivenByORM)
      if (arFromORM && arFromORM.rowStateInThisSession === 24) {
        // New -> Changed
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    removeSingleRemInAddForm(pRemIDGivenByORM) {
      // M6/9
      ormRem.delete(pRemIDGivenByORM)
      // if there are no records left then I need to add a empty. For goal read docs/forms.md/1.3
      const arFromORM = this.cfRowsInEditStateInOrm
      if (arFromORM.length) {
      } else {
        this.arrRemDescCached = []
        this.addEmptyRemToOrm()
      }
    },
    resetForm(formName) {
      // M7/9
      const arFromORM = this.cfRowsInEditStateInOrm
      if (arFromORM.length) {
        console.log('unsaved data found', arFromORM)
        for (let i = 0; i < arFromORM.length; i++) {
          console.log('Deleting data from ORM')
          ormRem.delete(arFromORM[i].$id)
        }
      } else {
        console.log('No Unsaved data')
      }
      this.addEmptyRemToOrm()
    },
    async onSubmit() {
      // M8/9
      let arFromORM = ormRem
        .query()
        .where('rowStateInThisSession', 24) // New -> Changed
        .orWhere('rowStateInThisSession', 2456) // New -> Changed -> Requested save -> form error
        .get()
      if (arFromORM.length) {
        console.log('unsaved data found', arFromORM)
        for (let i = 0; i < arFromORM.length; i++) {
          if (arFromORM[i].remDesc.length < 3) {
            // Validation check
            ormRem.update({
              where: (record) => record.id === arFromORM[i].id,
              data: {
                validationClass: 'validaionErrorExist',
                rowStateInThisSession: '2456', // New -> Changed -> Requested save -> form error
                isValidationError: true,
              },
            })
          } else {
            ormRem.update({
              where: (record) => record.id === arFromORM[i].id,
              data: {
                validationClass: '',
                rowStateInThisSession: '2457', // New -> Changed -> Requested save -> Send to server
                isValidationError: false,
              },
            })
            console.log('calling api to save data', ormRem)

            // API will return 1 (Success) or 0 (Failure)
            const status = await this.sendDataToServer(arFromORM[i])

            console.log(status)
            if (status === 0) {
              // Handle api returned success
              ormRem.update({
                where: (record) => record.id === arFromORM[i].id,
                data: {
                  rowStateInThisSession: '24578', // New -> Changed -> Requested save -> Send to server -> API fail
                },
              })
            } else {
              // Handle api returned failure
              ormRem.update({
                where: (record) => record.id === arFromORM[i].id,
                data: {
                  rowStateInThisSession: '24571', // New -> Changed -> Requested save -> Send to server -> API Success
                },
              })
            }
          }
        }
      }
      // if there are no records left then I need to add a empty. For goal read docs/forms.md/1.3
      arFromORM = this.cfRowsInEditStateInOrm
      if (arFromORM.length) {
      } else {
        this.arrRemDescCached = []
        this.addEmptyRemToOrm()
      }
    },
    async sendDataToServer(pORMRowArray) {
      // M9/9
      // Should bulk created be used Out of 10 reminders set what if 9 got created successfuly but 1 failed?
      // To keep code simple it was decided by VK on 13th July 2020 that for creasting 10 items we will fire 10 API calls.

      pORMRowArray.uuidOfRemMadeFor = 'bfe041fa-073b-4223-8c69-0540ee678ff8' // This is the patient ID for whom the reminder is added
      pORMRowArray.recordChangedByUUID = 'bua674fa-073b-4223-8c69-0540ee786kj8' // This is the logged in user ID for who added the reminder
      try {
        const response = await fetch(REMINDER_API_URL, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            // Authorization: 'Bearer ' + TOKEN,
          },
          body: JSON.stringify({
            data: pORMRowArray,
          }),
        })
        console.log('response=> ', response)
        if (!response.ok) {
          return 0 // Returns error code when api fails to update record in DB
        } else {
          return 1 // Returns success code when api successfully updates record in DB
        }
      } catch (ex) {
        return 0 // Returns error code when try block gets an exception and fails
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
