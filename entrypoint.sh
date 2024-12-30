#!/bin/sh -l

## Install Node.js and npm
if [ "$1" != "14" ]; then
  apt-get update && \
  apt-get install -y curl && \
  curl -fsSL https://deb.nodesource.com/setup_$1.x | bash - && \
  apt-get install -y nodejs && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
  
  python /main.py $2 $3 $4 $5 $6 $7 --build
else
  echo "Projects using Node.js 14 are not built before deployment"
  python /main.py $2 $3 $4 $5 $6 $7 --no-build
fi
