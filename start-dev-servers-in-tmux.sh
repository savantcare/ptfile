#!/bin/bash
tmux new-session -s projectname 'npm run docs-in-dev-mode' \; split-window 'cd ptclient; yarn dev' \; split-window \; select-layout tiled \;
