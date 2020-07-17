<!-- For design see ptclient/docs/forms.md -->
<template>
  <div>
    <!-- Goal: Show multiple add rows along with remove each row. At end A. Reset B. Add more C. Submit -->
    <el-form>
      <div v-if="cfGetOrmEditStateRows.length">
        <el-form-item v-for="ormRow in cfGetOrmEditStateRows" :key="ormRow.id">
          <!-- Prop explaination  Read prop explanation for span=4 on line 19 -->
          <el-col :span="20" :class="ormRow.validationClass">
            <el-input
              type="textarea"
              :class="mfGetCssClassName(ormRow.id)"
              :autosize="{ minRows: 2, maxRows: 10 }"
              placeholder="Please enter the diagnosis .."
              :value="mfGetField(ormRow.id, 'dxName')"
              @input="mfSetFieldInOrmOnTimeout($event, ormRow.id, 'dxName')"
            ></el-input>
            <div v-if="ormRow.isValidationError" class="el-form-item__error">
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
              @click="mfDeleteRowInOrm(ormRow.id)"
              >Remove</el-button
            >
          </el-col>
        </el-form-item>
      </div>
      <!-- If there are no edit state rows then create a empty row for faster data input -->
      <p v-else>{{ mfAddEmptyRowInOrm() }}</p>
      <el-form-item>
        <el-button type="primary" plain @click="mfOnSubmit">Submit</el-button>
        <el-button type="primary" plain @click="mfAddEmptyRowInOrm">Add more</el-button>
        <el-button type="warning" plain @click="mfResetForm">Reset form</el-button>
      </el-form-item>
    </el-form>
    <!-- Goal: Show data saved successfuly this session -->
    <el-table
      v-if="cfGetOrmApiSuccessStateRows.length > 0"
      :data="cfGetOrmApiSuccessStateRows"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="dxName" label="Diagnoses added this session"> </el-table-column>
    </el-table>
    <!-- Goal: Show data of API that failed in this session -->
    <el-table
      v-if="cfGetOrmApiErrorStateRows.length > 0"
      :data="cfGetOrmApiErrorStateRows"
      style="width: 100%; background: #f0f9eb;"
    >
      <el-table-column prop="dxName" label="Error: Diagnoses attempted but failed to save">
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
import ormDx from '@/cts/spi/dx/db/vuex-orm/dx.js'
export default {
  data() {
    return {}
  },
  computed: {
    cfGetOrmEditStateRows() {
      return ormDx.getEditStateRows()
    },
    cfGetOrmApiSuccessStateRows() {
      return ormDx.getApiSuccessStateRows()
    },
    cfGetOrmApiErrorStateRows() {
      return ormDx.getApiErrorStateRows()
    },
  },
  mounted() {},
  methods: {
    mfAddEmptyRowInOrm() {
      const arFromORM = ormDx.insert({
        data: {
          dxName: '',
          rowStateInThisSession: 2, // For meaning of diff values read dx/db/vuex-orm/dx.js:71
          ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
        },
      })
      if (!arFromORM) {
        console.log('FATAL ERROR')
      }
    },
    mfGetField(pOrmRowId, pFieldName) {
      console.log('mf get field called')
      return ormDx.getField(pOrmRowId, pFieldName)
    },
    // state updates are smarter.
    mfSetFieldInOrmOnTimeout(pEvent, pOrmRowId, pFieldName) {
      ormDx.setField(pEvent, pOrmRowId, pFieldName)
      this.$forceUpdate() // How to remove this? TODO
    },
    mfGetCssClassName(pOrmRowId) {
      const arFromORM = ormDx.find(pOrmRowId)
      if (arFromORM && arFromORM.rowStateInThisSession === 24) {
        // New -> Changed
        return 'unsaved-data'
      } else {
        return ''
      }
    },
    mfDeleteRowInOrm(pOrmRowId) {
      ormDx.delete(pOrmRowId)
    },
    mfResetForm(formName) {
      ormDx.deleteEditStateRows()
    },
    async mfOnSubmit() {
      // M8/9
      const arFromORM = this.cfGetOrmEditStateRows
      if (arFromORM.length) {
        console.log('unsaved data found', arFromORM)
        for (let i = 0; i < arFromORM.length; i++) {
          if (arFromORM[i].dxName.length < 3) {
            // Validation check
            ormDx.update({
              where: (record) => record.id === arFromORM[i].id,
              data: {
                validationClass: 'validaionErrorExist',
                rowStateInThisSession: '2456', // New -> Changed -> Requested save -> form error
                isValidationError: true,
              },
            })
          } else {
            ormDx.update({
              where: (record) => record.id === arFromORM[i].id,
              data: {
                validationClass: '',
                rowStateInThisSession: '2457', // New -> Changed -> Requested save -> Send to server
                isValidationError: false,
              },
            })
          }
        }
      }
      // if there are no records left then I need to add a empty. For goal read docs/forms.md/1.3
      await ormDx.sendToServer()
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
