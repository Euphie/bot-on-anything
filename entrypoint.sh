#!/bin/bash
set -e

# build prefix
BOT_ON_ANYTHING_PREFIX=/app
# execution command line
BOT_ON_ANYTHING_EXEC="python app.py"
# path to config.json
BOT_ON_ANYTHING_CONFIG_PATH=${BOT_ON_ANYTHING_CONFIG_PATH:-""}

# BOT_ON_ANYTHING_CONFIG_PATH is empty, use '/app/config.json'
if [ "$BOT_ON_ANYTHING_CONFIG_PATH" == "" ] ; then
    BOT_ON_ANYTHING_CONFIG_PATH=$BOT_ON_ANYTHING_PREFIX/config.json
fi

# go to prefix dir
cd $BOT_ON_ANYTHING_PREFIX
# excute
$BOT_ON_ANYTHING_EXEC


