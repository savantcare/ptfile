# Q1) How is the state of data entered in the form managed on client side?

vuex orm field: rowStateOfClientSession of type int

e.g. cts/spi/rem/db/vuex-orm/model.js

# Q2) What are the different possible values for rowStateOfClientSession?

0 => Not known
1 => Got from DB and not changed on client
2 => Created new on client but not on the server yet.
3 => Changed on client
After 2 if there is success the state goes back to 1
4 => Client requested save to server. Now data validation on client side will start.
5 => form error on client side
6 => Data sent to server to save
7 => Data saved to server failed.

Data is stored with the timeline

A. New record changed on client but not saved = 23

A. New record after data is saved on server. clientSideState = 231

B. Record is discontinued. Query sent is update. Value will be clientSideState = 121

C. When a record is changed
Since temporal DB old is deleted and new is inserted. But from client side the query sent is update
clientSideState = 121
