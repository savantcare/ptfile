import { Model } from '@vuex-orm/core'
const { v1: uuidv1 } = require('uuid')

export default class reminders extends Model {
  static entity = 'rem'

  /*  What should be the primary key?
    
    Option1: uuid -> Not possible since there are duplicate uuid as this is temporal DB
                      if there are 10 data rows and 2 are duplicate then entities will only get 8 entries.
    
    Option2: composite primary key. 
            ['uuid', 'ROW_START'] // Ref: https://vuex-orm.org/guide/model/defining-models.html#primary-key
            
            Finding data from primary key is much faster then finding data by running a loop over all the data rows.
            
            Update with primary key:
                 ormRem.update({
                  where: uniqueRowID              // vuex-orm knows that it needs to match with primary key
                  data: {
                    remDescription: pEvent,
                    },
                  })


            update with composite primary ley:
             ormRem.update({
              where: [remUUID, this.reminderRowStart],    // The index is bigger and it will take longer to match
              data: {
                remDescription: pEvent,
                },
              })      
                

    Option3: Let vuex-orm give auto generated simple primary key of auto increment numbers.

    Choice made in July 2020: Option 3
    
    */

  static fields() {
    return {
      id: this.uid(), // if this is not set then update based on primary key will not work
      uuid: this.uid(() => uuidv1()),
      uuidOfRemMadeFor: this.string(null),
      remDescription: this.string(null),
      notes: this.string(null),
      priority: this.number(0),
      isAutoRem: this.number(0),
      recordChangedByUUID: this.string(null),
      recordChangedFromIPAddress: this.string(null),
      recordChangedFromSection: this.string(null),
      // Why store time as a number? Since vuex-orm does not understand dates.
      // The data types that vuex-orm understands are given at: https://vuex-orm.org/guide/model/defining-models.html#generic-type
      ROW_START: this.string(0), // Todo: store this as number
      ROW_END: this.string(0),
    }
  }
}
