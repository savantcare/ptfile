#!/bin/bash

# If you have tmux but not tmuxinator:
# Here panel exit when program ends
# tmux new-session -s projectname 'yarn docs-in-dev-mode' \; split-window 'cd ptclient; yarn dev' \; split-window \; select-layout tiled \;

# Here panes do not exit when command ends
tmuxinator start all-dev-servers-in-tmux

# If you dont have yarn
# 1. cd ptclient; npm run dev
# 2. cd ptserver; npm run start