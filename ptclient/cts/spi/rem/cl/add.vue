<!-- For design see ptclient/docs/forms.md -->
<template>
  <div>
    <!-- Goal: Show multiple add rows along with remove each row. At end A. Reset B. Add more C. Submit -->
    <el-form>
      <div v-if="cfGetOrmEditStateRows.length">
        <el-form-item v-for="rem in cfGetOrmEditStateRows" :key="rem.id">
          <!-- Prop explaination  Read prop explanation for span=4 on line 19 -->
          <el-col :span="20" :class="rem.validationClass">
            <el-input
              type="textarea"
              :class="mfGetCssClassName(rem.id)"
              :autosize="{ minRows: 2, maxRows: 10 }"
              placeholder="Please enter the reminder .."
              :value="mfGetDesc(rem.id)"
              @input="mfSetRemDescInOrmOnTimeout($event, rem.id)"
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
              @click="mfDeleteRowFromOrm(rem.id)"
              >Remove</el-button
            >
          </el-col>
        </el-form-item>
      </div>
      <!-- If there are no edit state rows then create a empty row for faster data input -->
      <p v-else>{{ mfAddEmptyRowToOrm() }}</p>
      <el-form-item>
        <el-button type="primary" plain @click="mfOnSubmit">Submit</el-button>
        <el-button type="primary" plain @click="mfAddEmptyRowToOrm">Add more</el-button>
        <el-button type="warning" plain @click="mfResetForm">Reset form</el-button>
      </el-form-item>
    </el-form>
    <!-- Goal: Show data saved successfuly this session -->
    <el-table
      v-if="cfGetOrmApiSuccessStateRowsInOrm.length > 0"
      :data="cfGetOrmApiSuccessStateRows"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="remDesc" label="Reminders added this session"> </el-table-column>
    </el-table>
    <!-- Goal: Show data of API that failed in this session -->
    <el-table
      v-if="cfGetOrmApiErrorStateRows.length > 0"
      :data="cfGetOrmApiErrorStateRows"
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
    cfGetOrmEditStateRows() {
      // C1/3
      const arFromORM = ormRem
        .query()
        .where('rowStateInThisSession', 2) // New
        .orWhere('rowStateInThisSession', 24) // New -> Changed
        .orWhere('rowStateInThisSession', 2456) // New -> Changed -> Requested save -> form error
        .get()
      return arFromORM
    },
    cfGetOrmApiSuccessStateRows() {
      // C2/3
      // New -> Changed -> Requested save -> Sent to server -> Success
      const arFromORM = ormRem.query().where('rowStateInThisSession', 24571).get()
      return arFromORM
    },
    cfGetOrmApiErrorStateRows() {
      // C3/3
      // New -> Changed -> Requested save -> Sent to server -> Failure
      const arFromORM = ormRem.query().where('rowStateInThisSession', 24578).get()
      return arFromORM
    },
  },
  mounted() {},
  methods: {
    mfAddEmptyRowToOrm() {
      // M1/9
      const arFromORM = ormRem.insert({
        data: {
          remDesc: '',
          rowStateInThisSession: 2, // For meaning of diff values read rem/db/vuex-orm/rems.js:71
          ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
        },
      })
    },
    /* Why are mfGetDesc and setDesc not a single computed function called desc with a setter and a getter
      Initially tried to write v-model and this was computed function
       But vmodel+computed the Desc id cannot be sent to computed fn
       */
    mfGetDesc(pRemIDGivenByORM) {
      // M2/9
      const contentFromCache = this.arrRemDescCached[pRemIDGivenByORM]
      if (!contentFromCache) {
        return this.mfGetRemDescFromOrm(pRemIDGivenByORM)
      } else {
        return this.arrRemDescCached[pRemIDGivenByORM]
      }
    },
    mfGetRemDescFromOrm(pRemIDGivenByORM) {
      const arFromORM = ormRem.find(pRemIDGivenByORM)
      if (arFromORM) {
        return arFromORM.remDesc
      }
    },
    // state updates are smarter.
    mfSetRemDescInOrmOnTimeout(pEvent, pRemIDGivenByORM) {
      // M3/9
      this.$set(this.arrRemDescCached, pRemIDGivenByORM, pEvent)
      if (this.vOrmSaveScheduled) {
        clearTimeout(this.vOrmSaveScheduled)
      }
      /* Ref: https://stackoverflow.com/questions/38399050/vue-equivalent-of-settimeout */
      this.vOrmSaveScheduled = setTimeout(
        function (scope) {
          scope.mfSetRemDescInOrm(pEvent, pRemIDGivenByORM)
        },
        1000,
        this
      )
    },
    mfSetRemDescInOrm(pEvent, pRemIDGivenByORM) {
      // M4/9
      const arFromORM = ormRem.update({
        where: pRemIDGivenByORM,
        data: {
          remDesc: pEvent,
          rowStateInThisSession: 24,
          validationClass: '',
          isValidationError: false,
        },
      })
    },
    mfGetCssClassName(pRemIDGivenByORM) {
      // M5/9
      const arFromORM = ormRem.find(pRemIDGivenByORM)
      if (arFromORM && arFromORM.rowStateInThisSession === 24) {
        // New -> Changed
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    mfDeleteRowFromOrm(pRemIDGivenByORM) {
      // M6/9
      ormRem.delete(pRemIDGivenByORM)
    },
    mfResetForm(formName) {
      // M7/9
      const arFromORM = this.cfGetOrmEditStateRows
      if (arFromORM.length) {
        console.log('unsaved data found', arFromORM)
        for (let i = 0; i < arFromORM.length; i++) {
          ormRem.delete(arFromORM[i].$id)
        }
      }
    },
    async mfOnSubmit() {
      // M8/9
      let arFromORM = ormRem
        .query()
        .where('rowStateInThisSession', 2) // New -> Changed
        .orWhere('rowStateInThisSession', 24) // New -> Changed
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
            // API will return 1 (Success) or 0 (Failure)
            const status = await this.mfSendDataToServer(arFromORM[i])
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
      arFromORM = this.cfGetOrmEditStateRows
    },
    async mfSendDataToServer(pORMRowArray) {
      // M9/9
      pORMRowArray.uuidOfRemMadeFor = 'bfe041fa-073b-4223-8c69-0540ee678ff8'
      pORMRowArray.recordChangedByUUID = 'bua674fa-073b-4223-8c69-0540ee786kj8'
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
