<template>
  <el-form
    :model="dynamicValidateForm"
    ref="dynamicValidateForm"
    label-width="120px"
    class="demo-dynamic"
  >
    <el-form-item
      v-for="(description, index) in dynamicValidateForm.descriptions"
      :label="'description' + index"
      :key="description.key"
      :prop="'descriptions.' + index + '.value'"
      :rules="{
        required: true,
        message: 'description can not be null',
        trigger: 'blur',
      }"
    >
      <el-input v-model="description.value"></el-input
      ><el-button @click.prevent="removedescription(description)"
        >Delete</el-button
      >
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('dynamicValidateForm')"
        >Submit</el-button
      >
      <el-button @click="adddescription">New description</el-button>
      <el-button @click="resetForm('dynamicValidateForm')">Reset</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
  export default {
    data() {
      return {
        dynamicValidateForm: {
          descriptions: [{
            key: 1,
            value: ''
          }],
        }
      };
    },
    methods: {
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
      adddescription() {
        this.dynamicValidateForm.descriptions.push({
          key: Date.now(),
          value: ''
        });
      }
    }
  }
</script>