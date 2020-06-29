import { Database } from '@vuex-orm/core'
import User from '@/models/user'
import Todo from '@/models/Todo'
import Patient from '@/models/patient'
import Rex from '@/models/Recommendation'
import Dx from '@/models/Diagnosis'
import Goal from '@/models/Goal'

const database = new Database()

database.register(User)
database.register(Todo)
database.register(Patient)
database.register(Rex)
database.register(Dx)
database.register(Goal)

export default database
