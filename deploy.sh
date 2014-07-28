#!/bin/bash

# terminate in case of failur
# http://stackoverflow.com/questions/4381618/exit-a-script-on-error
set -e 

# http://unix.stackexchange.com/questions/12068/how-to-measure-time-of-program-execution-and-store-that-inside-a-variable
START=$(date +%s.%N)

echo 'building site...'
jekyll build --config _config_staging.yml

# scp -r  _site/* notjulie@notjulie.com:public_html/js_net
echo 'deploying site...'
rsync -rav -e ssh _site/* notjulie@notjulie.com:public_html/js_net

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo "deploy took ${DIFF} seconds"
