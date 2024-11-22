#!/bin/sh

echo "restarting uvicorn..."
pkill -f "uvicorn"
nohup uvicorn main:app --host 0.0.0.0 --port 80 --no-server-header --proxy-headers
