#!/bin/bash

workspace="/workspace"
symlink_target="/var/www/html/wp-content/plugins/test-plugin"

# Create a symlink if not already exists
if [ ! -L "$symlink_target" ]; then
  echo "Creating symlink from '${workspace}' to '${symlink_target}'..."
  ln -s "$workspace" "$symlink_target"
fi
