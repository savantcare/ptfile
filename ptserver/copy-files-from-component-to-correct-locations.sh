#!/bin/bash

printf "== Copying 3 files from recommendation component "
printf "." && cp ../ptclient/src/components/patient/Recommendations/db/recommendation.database.js ./models/database/
printf "." && cp ../ptclient/src/components/patient/Recommendations/db/recommendation.model.js ./models/
printf "." && cp ../ptclient/src/components/patient/Recommendations/db/recommendation.route.js ./routes/ 
echo " Done"

printf "== Copying 5 files from screening component "
printf "." && cp ../ptclient/src/components/patient/Screening/db/screening.database.js ./models/database/
printf "." && cp ../ptclient/src/components/patient/Screening/db/screensAssignedToPatient.model.js ./models/
printf "." && cp ../ptclient/src/components/patient/Screening/db/screensListMaster.model.js ./models/
printf "." && cp ../ptclient/src/components/patient/Screening/db/phq9PatientResponse.model.js ./models/
printf "." && cp ../ptclient/src/components/patient/Screening/db/screening.route.js ./routes/ 
echo " Done"

printf "== Copying 1 file from dx component "
printf "." && cp ../ptclient/src/components/patient/diagnosis/db/diagnosis.route.js ./routes/ 
echo " Done"