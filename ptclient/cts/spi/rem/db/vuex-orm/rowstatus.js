// simiolar to person.js in example

import { Model } from '@vuex-orm/core'

class rowStatus extends Model {
  static entity = 'rowstatus'

  static getOrmEditStateRows() {
    const arFromORM = this.query()
      .where('rowStateInThisSession', 2) // New
      .orWhere('rowStateInThisSession', 24) // New -> Changed
      .orWhere('rowStateInThisSession', 2456) // New -> Changed -> Requested save -> form error
      .get()
    return arFromORM
  }
}

export default rowStatus
