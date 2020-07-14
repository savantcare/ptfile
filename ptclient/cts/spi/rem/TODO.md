1. When the data is sent to server the query run is update.
   1.1. Done till now
   a. this.uuid was not getting updated if we press ESC to close popup and open different reminder
   b. At the time of opening change popup the input box was not showing current description
   c. Whenever 'C' icon is clicked to open CL popup a blank row was getting populated in the VL table
   d. Update the value of 'rowStateOfClientSession' to success or failure depending on the api response
   e. Update old version of the reminder's ROW_END to current timestamp if change is successful
   f. The current description was not taking the description of latest one if sorted by id so we changed it to sort by ROW_END
   1.2. Problems still remain
   a. The data gets removed from VL table when the CL input gets changed

2. discontinue
3. multi discontinue
4. Form field focus using vue technologies
