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
  async mounted() {
    /* Should data be loaded from localstorage or state

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
    Less permanance: State                          -> Survices previous. Does not survive browser refresh
    Middle permancne: Index DB                      -> Survices previous. Does not survice clean cache or using from diff browser 
    Most permanent: Mysql                           -> Survices all previous scenarios
    
    When Ct is mounted the data should come from:
      Step1: Mysql to get permanent data
      IndexDB: to get unsaved data in the client browser    
    
    Why IndexDB and not state?
      When control comes here there are 2 possibilities:
        1. This is page refresh
        2. This is just Ct being remounted or mounted for the first time

        In both the above cases IndexDB will have the correct data   

        State will have the correct data only when the Ct is being remounted.
    */
    const resultSet = await ormRem.$fetchFromIdx()
    console.log(resultSet)
  },
  methods: {
    getDescription(pReminderID) {
      console.log(pReminderID)
      const resultSet = ormRem.find(pReminderID)
      if (resultSet){
          console.log(resultSet)
          // ['reminderDescription']
          console.log(resultSet.id)
          return resultSet.reminderDescription
      }else{
          return ''
      }
    },
    setDescription (pEvent,pReminderID) {
        console.log('set called for', pReminderID, pEvent)
        const resultSet = ormRem.$updateOrmAndIdx({
          where: pReminderID,
          data: {
            reminderDescription: pEvent
          }
        })
        console.log(resultSet)      
    },
    async addRem(){
      console.log('Add rem called')
      const ResultSet = await ormRem.$createOrmAndIdx({
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
      this.arReminderID.push(entities[0].id)
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