#!/bin/bash

# Here panel exit when program ends
# tmux new-session -s projectname 'yarn docs-in-dev-mode' \; split-window 'cd ptclient; yarn dev' \; split-window \; select-layout tiled \;

# Here panes do not exit when command ends
tmuxinator start all-dev-servers-in-tmux
