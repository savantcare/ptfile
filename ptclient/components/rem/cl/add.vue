<template>
  <el-form label-width="120px">
    <el-form-item label="desc">
      <el-input v-model="description"></el-input>
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
      reminderID: [],
    }
  },
   computed: {
    description: {
      get () {
        const resultSet = ormRem.find(this.reminderID[0])
        if (resultSet){
          console.log(resultSet)
          // ['reminderDescription']
          console.log(resultSet.$id)
          return resultSet.reminderDescription
        }else{
          return ''
        }
      },
      set (value) {
        console.log('set called for', this.reminderID[0], value)
        const resultSet = ormRem.update({
          where: this.reminderID[0],
          data: {
            reminderDescription: value
          }
        })
        console.log(resultSet)      
      }
    }
  },
  mounted(){
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
      this.reminderID.push(entities.reminder[0].$id)
      console.log(this.reminderID)
    })
    // need to get UUID
    console.log(ResultSet)
  },
  methods: {
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
      this.reminderID.push(entities.reminder[0].$id)
      console.log(this.reminderID)
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