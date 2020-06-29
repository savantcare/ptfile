import { Database } from '@vuex-orm/core'
import User from '../models/User.js'
import Todo from '../models/Todo.js'
import Patient from '../models/Patient.js'
import Rex from '../models/Recommendation.js'
import Dx from '../models/Diagnosis.js'

const database = new Database()

database.register(User)
database.register(Todo)
database.register(Patient)
database.register(Rex)
database.register(Dx)

export default database
