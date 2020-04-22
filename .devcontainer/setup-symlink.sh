#!/bin/bash

workspace='/workspace'
symlink_target='/var/www/html/wp-content/plugins/dev-plugin'

# To avoid interfering with WordPress initialization, wait for it to finish
until pids=$(pidof php-fpm)
do
  echo 'Waiting for initialization to finish...'
  sleep 1
done

# Create a symlink if not already exists
if [ ! -L "$symlink_target" ]; then
  echo "Creating symlink from '${workspace}' to '${symlink_target}'..."
  ln -s "$workspace" "$symlink_target"
fi
