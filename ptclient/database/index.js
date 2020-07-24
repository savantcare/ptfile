// this is file 3 in example

import { Database } from '@vuex-orm/core'
import CtSearch from '~/cts/core/vl-search-box/orm-search-phrases-of-ct'
import CtLifeCycle from '@/cts/core/ctMaster/orm-ct-life-cycle'
import User from '@/models/user'
import Patient from '@/models/patient'
import Rex from '@/cts/spi/rec/vuex-orm/model.js'
import rowStatus from '@/cts/core/crud/rowstatus.js'
import Rem from '@/cts/spi/rem/db/vuex-orm/rem.js'
import Dx from '@/models/Dx'
import Goal from '@/models/Goal'
import Scr from '@/cts/spi/scr/db/vuex-orm/scr.js'
import Dxa from '@/models/Dxa'

const database = new Database()

database.register(User)
database.register(Patient)
database.register(Rex)
database.register(rowStatus)
database.register(Rem)
database.register(Dx)
database.register(Goal)
database.register(Scr)
database.register(CtSearch)
database.register(CtLifeCycle)
database.register(Dxa)

export default database
