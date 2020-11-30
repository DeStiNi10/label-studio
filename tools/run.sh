#!/bin/bash

label-studio start-multi-session --use-gevent --root-dir ./session_projects --host ${HOST:-0.0.0.0} --port ${PORT:-8081} --protocol ${PROTOCOL:-http://}