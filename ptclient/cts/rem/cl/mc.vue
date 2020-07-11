<!--
The tree structure is:

Carausel                           |
  -- Carausel item                 |   These are the slides
    -- Cards                       |   Each card is a reminder


Performance:
Inside rem/cl/c.vue:getRemDescUsingCache enable the console.log 
console.log(
        'Inside get desc. Only first time it needs to come from ORM and subsequently it can always come from cache, the value set by setRemDescOn5KeyPress'
      )
When this Ct is mounted it loads the changeRem 204 times since the above console.log is put on console 204 times. 

Every time the slide is changed the getRemDescUsingCache() is again called 204 times since on console.log I see 204 messages
-->
<template>
  <div class="block">
    <el-carousel
      arrow="always"
      trigger="click"
      @change="slideChanged"
      v-bind:autoplay="false"
    >
      <!-- Reason for v-bind to pass boolean value https://stackoverflow.com/questions/49225002/passing-boolean-vue-prop-value-in-html -->
      <el-carousel-item v-for="slide in getNumOfCarouselSlides" :key="slide">
        <el-row type="flex">
          <el-card v-for="remID in getArrayOfRemIDsToShowInThisCard">
            <changeRem :firstParam="remID"></changeRem>{{ remID }}
          </el-card>
        </el-row>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>
<script>
import ormRem from '@/cts/rem/vuex-orm/model.js'
import changeRem from '@/cts/rem/cl/c.vue'
export default {
  components: { changeRem },
  data() {
    return {
      daUniqueIDOfEachRowFromORM: [],
      diCurrentSlideNumber: 0,
    }
  },
  computed: {
    getArrayOfRemIDsToShowInThisCard() {
      const firstCard = this.diCurrentSlideNumber * 3
      console.log('First rem card', firstCard)
      const arr = this.daUniqueIDOfEachRowFromORM.slice(
        firstCard,
        firstCard + 3
      )
      return arr
    },
    getNumOfCarouselSlides() {
      const count = this.daUniqueIDOfEachRowFromORM.length / 3
      const intValue = Math.floor(count)
      console.log('number of items in carousel are', count, intValue)
      if (count === 0) {
        return 1
      } else {
        return intValue
      }
    },
  },
  methods: {
    slideChanged(val) {
      console.log('slide changed', val)
      this.diCurrentSlideNumber = val
    },
  },
  mounted() {
    console.log('In mounted function')
    const resultArFromORM = ormRem.query().get()
    if (resultArFromORM.length) {
      for (let i = 0; i < resultArFromORM.length; i++) {
        this.daUniqueIDOfEachRowFromORM.push(resultArFromORM[i].$id)
      }
    }
    console.log(this.daUniqueIDOfEachRowFromORM)
  },
}
</script>
