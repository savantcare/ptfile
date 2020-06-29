import { Database } from '@vuex-orm/core'
import User from '@/models/User'
import Todo from '@/models/Todo'
import Patient from '@/models/Patient'
import Rex from '@/models/Recommendation'

const database = new Database()

database.register(User)
database.register(Todo)
database.register(Patient)
database.register(Rex)

export default database
