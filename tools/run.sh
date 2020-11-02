#!/bin/bash

label-studio start-multi-session --root-dir ./session_projects --host ${HOST:-0.0.0.0} --port ${PORT:-8080} --protocol ${PROTOCOL:-http://}