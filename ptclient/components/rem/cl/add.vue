<template>
  <el-form label-width="120px">
    <el-form-item v-for="id in arReminderID" label="desc" :key="id">
      <el-input
        :value="getDescription(id)"
        @input="setDescription($event, id)"
      ></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary"> Submit</el-button>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="addRem"> Add more</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
import ormRem from '@/models/ormRem'
export default {
  data() {
    return {
      arReminderID: [],
    }
  },
   computed: {},
  mounted(){
    const ResultSet = ormRem.create({
      data: {
      reminderDescription: 'jai kali ma',
      priority: 1, 
      isAutoRem: 1,
      ROW_START: 1,
      ROW_END: 1
      }
    }).then((entities) => {
      console.log(entities)
      this.arReminderID.push(entities.reminder[0].$id)
      console.log(this.arReminderID)
    })
    // need to get UUID
    console.log(ResultSet)
  },
  methods: {
      getDescription (pReminderID) {
        console.log(pReminderID)
        const resultSet = ormRem.find(pReminderID)
        if (resultSet){
          console.log(resultSet)
          // ['reminderDescription']
          console.log(resultSet.$id)
          return resultSet.reminderDescription
        }else{
          return ''
        }
      },
      setDescription (pEvent,pReminderID) {
        console.log('set called for', pReminderID, pEvent)
        const resultSet = ormRem.update({
          where: pReminderID,
          data: {
            reminderDescription: pEvent
          }
        })
        console.log(resultSet)      
      },
    addRem(){
      console.log('Add rem called')
      const ResultSet = ormRem.create({
        data: {
        reminderDescription: '',
        priority: 1, 
        isAutoRem: 1,
        ROW_START: 1,
        ROW_END: 1
      }
    }).then((entities) => {
      console.log(entities)
      this.arReminderID.push(entities.reminder[0].$id)
      console.log(this.arReminderID)
    })
    // need to get UUID
    console.log(ResultSet)
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('submit!');
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    removedescription(item) {
      var index = this.dynamicValidateForm.descriptions.indexOf(item);
      if (index !== -1) {
        this.dynamicValidateForm.descriptions.splice(index, 1);
      }
    },
  }
}
</script>