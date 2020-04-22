#!/bin/bash

echo "Running symlink-setup in background"

nohup ./.devcontainer/setup-symlink.sh > /dev/null 2> /dev/null < /dev/null &
