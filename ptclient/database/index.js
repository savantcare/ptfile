import { Database } from '@vuex-orm/core'
import User from '../models/User.js'
import Todo from '../models/Todo.js'
import Patient from '../models/Patient.js'
import Rex from '../models/Recommendation.js'

const database = new Database()

database.register(User)
database.register(Todo)
database.register(Patient)
database.register(Rex)

export default database
