The UI componet used is:
https://element.eleme.io/#/en-US/component/tabs#add-close-tab

This code has a for loop on line 3 of example given in above URL:

v-for="(item, index) in editableTabs

## Preference 1:

Use the current code running from the repo:
savantcare/patientfile

## Preference 2:

1. editableTabs will be a vuex-ORM model and
2. Any component when they want to display a tab will do ormTabManager.insert("TabTitle", component)
3. editableTabs will be a computed property so that the tabs will update themselves when array is updated.

Why use vuex-ORM instead of an array inside state?

1. ormTabs will be abailable to any compone thtey just have to do:
   import 2l-tab-manager/ormTabs.js

2. Since all components use vuex-orm it is better to use same coding style.
