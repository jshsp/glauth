#!/bin/sh


function dorun(){
echo "";
echo "Version and build information:";
echo "";

# Output version string to logs
/app/glauth --version


echo "";
echo "Starting GLauth now.";
echo "";

# Run app
/app/glauth -c $1
echo ""
echo "GLauth has exited."
echo "Exiting."
}

# Copy config file if it doesn't exist so that the app can start
if [ -f /app/config/mounted/config.cfg ] ; then
  echo "Mounted Config file found at /app/config/config.cfg"
  echo "Copying configuration file to run."
  dorun /app/config/mounted/config.cfg   || exit 1
 fi

# Copy config file if it doesn't exist so that the app can start
if [ ! -f /app/config/config.cfg ] ; then
  echo "Config file not found at /app/config/config.cfg"
  echo "Copying example configuration file to run."
  dorun /app/docker/default-config.cfg  || exit 1
 fi

 dorun /app/config/config.cfg 