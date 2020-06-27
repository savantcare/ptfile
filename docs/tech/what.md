## Q1) What is needed to write a new component?

For the model component Recommendations the following files are needed:

Total loc: 991 

## Client side

### Layer 1

**HTML/CSS/JS (122 loc)** -> [/components/composition-layer1/RecommendationsCard.vue](https://github.com/savantcare/patientfile/blob/master/vue-client/src/components/composition-layer1/RecommendationsCard.vue) -> This has the presentation layer (html), styling layer (css), JS to change the state. This file is compiled into seperate html js and css by [vue-cli](https://cli.vuejs.org/)

### Layer 2
1. **Add (123 loc)**  [/components/composition-layer2/recommendation/AddRecommendation.vue](https://github.com/savantcare/patientfile/blob/master/vue-client/src/components/composition-layer2/recommendation/AddRecommendation.vue)

2. **Multi change (86 loc)**  [/components/composition-layer2/recommendation/MultiChangeRecommendation.vue](https://github.com/savantcare/patientfile/blob/master/vue-client/src/components/composition-layer2/recommendation/MultiChangeRecommendation.vue)

3. **Recommendation history (56 loc)**  [/components/composition-layer2/recommendation/RecommendationHistoryItem.vue](https://github.com/savantcare/patientfile/blob/master/vue-client/src/components/composition-layer2/recommendation/RecommendationHistoryItem.vue)


### Common between layer 1 and layer 2

**Local State (267 loc)** -> [/store/modules/recommendation.js](https://github.com/savantcare/patientfile/blob/master/vue-client/src/store/modules/recommendation.js) -> State of this component. Functions to mutate state. Socket functions to change state.

## Server side

1. **Connection details (27 loc)** -> [/models/database/recommendation.database.js](https://github.com/savantcare/patientfile/blob/master/node-server/models/database/recommendation.database.js)

2. **Sql structure (41 loc)** -> [/models/recommendation.model.js](https://github.com/savantcare/patientfile/blob/master/node-server/models/recommendation.model.js)          

3. **Routes (174 loc)** and emit socket messages -> [/routes/recommendation.route.js](https://github.com/savantcare/patientfile/blob/master/node-server/routes/recommendation.route.js) 


## Q2) What code-formatter is used?
vetur


## Q3) What is the migration plan?
We get rec and rem component to work completely in the new architecture. Once they are cerifited then 10 developers are given the responsibility of delivered 5 components each week.

Within 2 weeks /p2 will get released once the architecture is finalized

## Q4) What is the ideal component on which other components are based?
Recommendation.

## Q5) What tags are used in code?

 * TODO:
 * QUESTION:
 * FIX:

To find files with Fix tag: 

patientfile> grep -ir -n --exclude-dir={node_modules,.git} ' FIX:' ./

## Q6) What is the code review process?
https://www.youtube.com/watch?v=8fx-EaOUK2E


## Q7) How to do discontinue and delete in temporal DB? 

1. When doctor says change then run a edit query

2. When doctor says discontinue then run a delete query

### What is the DB doing internally?

1. For each record a start and end time is maintained. These 2 columns are hidden from the sql query.

2. So when a edit is done mysql is internally adding a new record. And marking the end time of the previous record.

3. When a delete is done mysql is NOT deleting from the DB. Mysql is just marking the end time of that record.

Ref: https://mariadb.com/kb/en/temporal-data-tables/

## Q8) How the system decides which components are allowed access for each user role? Also what is the initial load sequence?
sc_user »Table: user_roles has the following fields:
componentsAllowedToAccess
multiStateDisplayAreaAreaComponentLoadSequence
currentStateDisplayAreaAreaComponentLoadSequence

The data looks like this:
| id                                   | name                   | componentsAllowedToAccess | multiStateDisplayAreaAreaComponentLoadSequence | currentStateDisplayAreaAreaComponentLoadSequence |
|--------------------------------------|------------------------|---------------------------|------------------------------------------------|--------------------------------------------------|
| 897d25c6-2c84-47fe-9236-2c3cc9c70bdf | Doctor                 | Rex,Rem,Shx               | Rex,Rem,Shx                                    | Rem,Rex                                          |
| ae0ae9e7-545a-4783-ac83-84786839dcc1 | Patient                | NULL                      | 0                                              | 0                                                |
| ae2f20c1-448b-4df0-b221-9b4c3d411f59 | Doctor admin assistant | Shx, Policies             | Shx,Rem                                        | Rex                                              |

## Q9) How does the system redirect user to login if the user is not logged in?
