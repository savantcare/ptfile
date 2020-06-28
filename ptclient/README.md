```asciidoc
Core 1/6. Page design
=====================

┌────────────────────────────────────────────────────────────────────────┐
|    MultiStateDisplayAreaHeader = 9      |                              |
+-----------------------------------------+                              |
|                                         |                              |
|   multiStateDisplayArea = 102           | currentStateDisplayArea = 137|
|                                         |                              |
|                                         |                              |  typeOfStateDisplayArea = 122
|                                         |                              |  This var contains 1 of:
|This has list of compomponents.          |This has list of Components   |  multiStateDisplayArea
|Data of each component depends on        |                              |            OR
|timeOfStateSelectedInHeader ( = 99 )               |Data is from currentTime      |  currentStateDisplayArea
|timeOfStateSelectedInHeader has 2 possibilities    |                              |
|                                         |On right side I do not care   |
|1. timeOfStateSelectedInHeader=2038-01-19 03:14:07 |about timeOfStateSelectedInHeader       |
|2. timeOfStateSelectedInHeader=value               |                              |
|                                         |                              |
|If timeOfStateSelectedInHeader=2038-01-19 03:14:07 |                              |
| then data of component is from          |                              |
| current time.                           |                              |
|                                         +------------------------------+
|                                         |SearchBoxForCommandsFromUser=4|
└────────────────────────────────────────────────────────────────────────┘

```
