#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  apt-get install -qy git
  rm -rf /opt/sickbeard-ita
  git clone https://github.com/gborri/Sick-Beard.git /opt/sickbeard-ita
  chown -R nobody:users /opt/sickbeard-ita
fi
