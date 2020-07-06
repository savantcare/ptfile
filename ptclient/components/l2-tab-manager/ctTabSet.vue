<template>
  <el-select v-model="value" placeholder="Select">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    >
    </el-option>
  </el-select>
</template>

<script>
export default {
  data() {
    return {
      options: [
        {
          value: 'Assessment tabset',
          label: 'Assessment tabset',
        },
        {
          value: 'Plan tabset',
          label: 'Plan tabset',
        },
      ],
      value: '',
    }
  },
}
</script>
