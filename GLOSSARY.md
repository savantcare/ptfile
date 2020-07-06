### Glossary

- pt: Patient
- pts: Patients
- ct: Component
- cts: Components
- fn: Function
- pf: Patient file
- ctAge: Age is a component
- pAge: Age is a parameter to a function
- ormAge: Age is ORM created with vuex-orm

### Data types

- sAge: variable of type string called Age
- iAge: variable of type int called Age
- bl: variable of type bool called Age
- arAge: Array called Age
- obAge: Object called Age

### Component functions (similar to class functions)

In the following examples age is a function inside a component

- mfAge: method function
- wfAge: watch function
- cfAge: computed function
- mtfAge: Mutation function

### Component Prop (similar to function parameters)

- psAge: prop of type string called age in component.
- pnAge: prop of type number called age in the component
- paAge: prop of type array called age in the component
- poAge: prop of type object called age in the component

### Component Data (similar to local variables)

- dblAge: data of type boolean called age in the component
- dsAge: data of type string called age in the component.
- dnAge: data of type number called age in the component
- daAge: data of type array called age in the component
- doAge: data of type object called age in the component

### Component short forms

- dx: [Diagnosis](/ptclient/components/dx/)
- dxa: Diagnosis assessment
- g: goal
- bm: [Body measurement](/ptclient/components/bm/)
- rec: Recommendation
- recs: Recommendations
- rem: Reminder
- rems: Reminders
- sh: Social history. This is both plural and singular.
- mse: Mental status exam
- dob: Date of birth
- pros: Psych review of systems
- hx: History
- scr: screening

### Others

- L1: Layer1
- L2: Layer2
- KIL: Keep it local. Do not convert to functions without giving a good reason. Since 1. Each function call makes code hard to read 2. vue vuex-orm element.io all are giving lot of functions 3. A function should not have more than 2 paramters
- cs: currrent state
- csda: currrent state display area
- ms: multi state
- msda: multi state display area
- multiStateDisplayArea: This has components that can show either the current state or historical state
- timeOfStateSelectedInHeader: This gives the time for which : multiStateDisplayArea: should be rendered
- multiStateDisplayAreaHeader: This has the slider to choose : timeOfStateSelectedInHeader:
