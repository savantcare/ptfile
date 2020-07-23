#!/bin/bash

# This file is called by /ptfile/ptserver/copy-files-from-component-to-correct-locations.sh
echo "Running file copy"

echo "Copying: reminder.model.js"
cp /gt/sc-prog-repos/ptfile/ptclient/cts/spi/rem/db/sequalize/reminder.model.js /gt/sc-prog-repos/ptfile/ptserver/models/

echo "Copying: reminder.route.js"
cp /gt/sc-prog-repos/ptfile/ptclient/cts/spi/rem/db/sequalize/reminder.route.js /gt/sc-prog-repos/ptfile/ptserver/routes/