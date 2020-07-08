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
  mounted() {
     // There are 2 possibilities
     // Possibility 1: There are already unsaved data on the client sttae in the vuex
     // Possibility 2: There is no unsaved data

     // When there is unsaved data we load the unsaved data
     const resultSet = ormRem.query().where('$isNew', true).get()
     if (resultSet.length){
       console.log('unsaved data found', resultSet, resultSet[0].$id)
       for (let i = 0; i < resultSet.length; i++) {
         this.arReminderID.push(resultSet[i].$id)
       }
     } else{
       // When there is no unsaved data then we add an empty data to the state inside vuex
       console.log('No Unsaved data')
      this.addRem()
     }
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
      const ResultSet = ormRem.insert({
        data: {
        reminderDescription: '',
        priority: 1, 
        isAutoRem: 1,
        ROW_START: 1,
        ROW_END: 1,
        $isNew: true
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