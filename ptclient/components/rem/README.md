# Q) How should data be saved before sending to DB when user is adding?

## Option 1: Local array

## Option 2: vuex-orm

Positive:

    1. It is state hence it will survice even if user clicks on cross and that removes the tab and hence component local variable is lost

    2. It will make code of all components similar since each field will have computed property and getter setter for each computed property
    field 1 -> computed property 1 -> getter 1 -> setter 1
    When a input field is changed v-model maintain 2 way reactivity and hence v-model will update the field.
    Ref: https://vuejs.org/v2/guide/forms.html#v-model-with-Components

    If we do add through array each component will implement it differently.

    3. Since we will use vuex-orm localforage hence data will also survice browser refresh
       https://github.com/eldomagan/vuex-orm-localforage

    4. Since submit button will be a state value when submit is pressed some other component will watch if submit is pressed and then act on the data. This will make the work more seperate.
    The name of component watchForUserSubmit
        This function will find
        let results = store.getters['entities/allDirty']();
        Ref: https://github.com/vuex-orm/plugin-change-flags

How to do it?
https://stackoverflow.com/questions/57218760/two-way-data-binding-with-vuex-orm

Working features:

1. Add more
2. Tab closed with X this looses values of all local variables
   When rem is mounted again, in the mounted() look for records that have isNew set
3. Survive page refresh since state is blank when page is refreshed. Use localforage
   -> Decided not to do. For reasons read rem/cl/add.vue

Todo:

1. Out of 3 add more doctor removes one of them
2. Track if submit has been pressed and then call the DB code.
3. sync id between server and client
