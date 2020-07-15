1. React to the state that the array is empty and in that reaction show the empty form

   addEmptyRemToOrm() {
   if (!this.cfRowsInEditStateInOrm) {
   console.log('Add rem called')
   const arFromORM = ormRem.insert({
   data: {
   rowStateOfClientSession: 2, // For meaning of diff values read rem/db/vuex-orm/rems.js:71
   ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
   },
   })
   console.log(arFromORM)
   }
   },

2) I open "add form" and enter "jai kali ma" and then i close the add form by pressign escape the row should be in warning color

3) I open "add form" and enter "jai kali ma" and then i close the add form by pressign escape. In the table that row should not have change and discontinue

4) When I hit submit the form should still be available to enter more data.

5) Below the form create another form called "Sending data to server" there you can show the data sent to the server.

6) Change query -> on client side update the ROW_END and for the new row update the state.

7) discontinue -> On click give a confirm button with space for entering text. https://element.eleme.io/#/en-US/component/message-box#prompt

8) multi discontinue -> no comment to be added.

9) Form field focus using vue technologies
