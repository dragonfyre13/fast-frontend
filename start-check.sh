#!/bin/sh

if [ -f /app/main.py ] && [ -f /app/frontend/public/index.html ]; then
	echo "Found existing application"
else
	echo "Application not found, initializing /app folder"
	echo "app_initialize"
	ls -ltrah /app_initialize
	echo "app"
	ls -ltrah /app
	mkdir -p /app
	cp -a /app_initialize/* /app/
	echo "app"
	ls -ltrah /app
fi
cd /app
/start-reload.sh
