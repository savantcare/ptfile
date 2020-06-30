```
Layer 1 - Currentstate
======================
                                                                                   F -> Bring left hand side component in focus 
+-------------------------------------------------------------------------------+  M -> doctor can change all 9 together.
|                                                                               |                                                               
|                                                     +-----+ +-----+ +-----+   |  +----------------------------------------------+            
|  Body Measurement                                   |  F  | |  M  | |  G  | <----+ Graph for all.                               |            
|                                                     +-----+ +-----+ +-----+   |  | Open a chart in 2nd layer where all the      |            
+-------------------------------------------------------------------------------+  | graphs of sub-sections can be seen.          |            
|                                                                               |  | There is checkbox to uncheck some lines      |            
|                                                                               |  +----------------------------------------------+            
|───────────────────────┐                                             ┌────┐    |    ┌──────────────────────────────────────────────┐          
|                       │        ▲                                    │  C │◀────────│Change button.                                │          
|  Weight ══════════════│        │                                    └────┘    |    │This opens change form in layer 2 for current │          
|───────────────────────┤        │                                              |    │tab and after submitting, new value will be   │          
|                       │        │                                              |    │seen on the graph                             │          
|  BMI                  │        │                                              |    └──────────────────────────────────────────────┘          
|───────────────────────┤        │ ────────────────┐                            |                                                              
|                       │        │                 │                            |                                                              
|  Waist circumference  │        │                 │                            |                                                              
|───────────────────────┤        │                 │                            |                                                              
|                       │        │                 │                            |                                                              
|  Blood sugar          │┌──────┐│                 │                            |                                                              
|───────────────────────┤│Weight││                 └────────────────▶           |                                                              
|                       │└──────┘│                                              |                                                              
|  Height               │        │                                              |                                                              
|───────────────────────┤        │                                              |                                                              
|                       │        │                                              |                                                              
|  Blood pressure       │        │                                              |                                                              
|───────────────────────┤        │                                              |                                                              
|                       │        │                                              |                                                              
|  Oxygen saturation    │        │                                              |                                                              
|───────────────────────┤        │                                              |                                                              
|                       │        │                                              |                                                              
|  Pulse                │        │                                              |                                                              
|                       │        │                                              |                                                              
|───────────────────────┤        └───────────────────────────────────────────▶  |                                                              
|  Temperature          │                         ┌────┐                        |                                                              
|                       │                         │Time│                        |                                                              
|                       │                         └────┘                        |                                                              
+-------------------------------------------------------------------------------+                                                              
     Each tab on the left is Graph for that individual section.                                                                                
     Clicking on it will open chart consisting only that sections graph.                                                                       
                                                                                                                                               



How does the KB interaction work?
First down arrow -> Card header is highlighted. I can press A or G. On pressing A give me a form where I can allo the 9 data points together.
2nd down arrow -> The weight tab is active and I see the weight graph. I can press A to add a new weight.
3rt down arrow -> The "waist circumference" tab is active and I see the "waist circumference" graph. I can press A to add a new "waist circumference"

When doing data entry always show the old data that the doctor can change and then save. Since the new data is usually close to old data it is better to have the old data.




Layer 1 - Multistate
====================

+-------------------------------------------------------------------------------+
|                                                                               |         +----------------------------------------------+
|  Body Measurement                                              F  M    G                | G ->  Graph for all.                         |
|                                                                               |         | Open a chart in 2nd layer where all the      |
+-------------------------------------------------------------------------------+         | graphs of sub-sections can be seen.          |
|                                                                               |         | There is checkbox to uncheck some lines      |
|                            Current Value                        Actions       |         +----------------------------------------------+
|  +-----------------------------------------------------------------------+    |         +----------------------------------------------+
|                                                               |---| |---|     |         | This field will show the latest data of the  |
|  Weight                    160 lb <-----------------------------------------------------+ section. If there is no data found then the  |
|                                                               |---| |---|     |         | field should indicate that also.             |
|                                                               +---+ +---+     |         +----------------------------------------------+
|  BMI                       28                                 | C | | G |     |
|                                                               +---+ +---+     |
|                                                               +---+ +---+     |
|  Waist circumference       35 in                              | C | | G |     |
|                                                               +---+ +---+     |
|                                                               +---+ +---+     |
|  Blood sugar               135 mg/dL                          | C | | G |     |
|                                                               +---+ +---+     |
|                                                               +---+ +---+     |
|  Height                    5 feet 9 inches                    | C | | G |     |
|                                                               +---+ +---+     |         +----------------------------------------------+
|                                                               +---+ +---+     |         | Graph for this individual section.           |
|  Blood pressure            132/88 mmHg                        | C | | G | <-------------+ Clicking on it will open chart consisting    |
|                                                               +---+ +---+     |         | only this sections graph.                    |
|                                                               +---+ +---+     |         +----------------------------------------------+
|  Oxygen saturation         75 mmHg                            | C | | G |     |
|                                                               +---+ +---+     |          +----------------------------------------------+
|                                                               +---+ |---|     |          | Change button.                               |
|  Pulse                     80 bpm                             | C | <--------------------+ Clicking will open change form in layer 2    |
|                                                               +---+ |---|     |          | and after submitting, new value will be      |
|                                                               +---+ +---+     |          | seen on current Value field of the section.  |
|  Temperature               97 F                               | C | | G |     |          +----------------------------------------------+
|                                                               +---+ +---+     |
|                                                                               |
+-------------------------------------------------------------------------------+


Layer 2
=======
Change form:
------------
+-----------------------------------------------------------------------------------------------+
|                                                                                               |
| +-------------+                                                                               |
| |Change Weight|                                                                               |
| +             +-------------------------------------------------------------------+           |
|                                                                                               |
|                                                                                               |
|                         +-------------------------------------------------+                   |
|              Value *    |                                                 |                   |
|                         +-------------------------------------------------+                   |
|                                                                                               |
|                         +-------------------------------------------------+                   |
|               Date *    |  Default value of today                         |                   |
|                         +-------------------------------------------------+                   |
|                                                                                               |
|                         +-------------------------------------------------+                   |
|               Notes     |                                                 |                   |
|                         +-------------------------------------------------+                   |
|                                                                                               |
|               +---------+                                                                     |
|               |  Save   |                                                                     |
|               +---------+                                                                     |
|                                                                                               |
|                                                                                               |
+-----------------------------------------------------------------------------------------------+
```