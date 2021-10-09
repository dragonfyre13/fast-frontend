#!/bin/sh

cd /
pip install --no-cache-dir --upgrade -r /app/requirements.txt
cd /app/frontend
npm install
npm run build
cd /app
