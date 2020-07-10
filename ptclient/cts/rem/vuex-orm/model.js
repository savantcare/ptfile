import { Model } from '@vuex-orm/core'
const { v1: uuidv1 } = require('uuid')

export default class reminders extends Model {
  // This is the name used as module name of the Vuex Store.
  static entity = 'rem'

  /* 
    What should be the primary key?
    Option1: uuid -> Not possible since there are duplucate uuid as this is temporal DB
    Option2: composite primary key. 
            ['uuid', 'ROW_START'] // Ref: https://vuex-orm.org/guide/model/defining-models.html#primary-key
            Problem found in the above approach by: VK/TJ and RR
            if I do this everytime a update happens i need to run a where and if there are 100 elements in the array then it needs to loop over all of them
    Option3: Let vuex-orm give auto generated simple primary key of auto increment numbers.
  */

  // List of all fields (schema) of the post model. `this.attr` is used
  // for the generic field type. The argument is the default value.
  static fields() {
    return {
      id: this.uid(), // if this is not set then update based on primary key will not work
      uuid: this.uid(() => uuidv1()),
      uuidOfRemMadeFor: this.attr(null),
      remDescription: this.attr(null),
      notes: this.attr(null),
      priority: this.number(0),
      isAutoRem: this.number(0),
      recordChangedByUUID: this.attr(null),
      recordChangedFromIPAddress: this.attr(null),
      recordChangedFromSection: this.attr(null),
      // Why store time as a number? Since vuex-orm does not understand dates.
      // The data types that vuex-orm understands are given at: https://vuex-orm.org/guide/model/defining-models.html#generic-type
      ROW_START: this.string(0),
      ROW_END: this.string(0),
    }
  }
}
