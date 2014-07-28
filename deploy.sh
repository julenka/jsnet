#!/bin/bash

# terminate in case of failur
# http://stackoverflow.com/questions/4381618/exit-a-script-on-error
set -e 

# http://unix.stackexchange.com/questions/12068/how-to-measure-time-of-program-execution-and-store-that-inside-a-variable
START=$(date +%s.%N)


# scp -r  _site/* notjulie@notjulie.com:public_html/js_net

if [[ "${1}" == "staging" ]] 
    then
    echo 'building staging...'
    jekyll build --config _config_staging.yml

    echo 'deploying staging...'
    rsync -rav -e ssh _site/* notjulie@notjulie.com:public_html/js_net
elif [[ "${1}" == "release" ]]
    then
    echo 'building release...'
    jekyll build --config _config_release.yml

    echo 'deploying release...'
    rsync -rav -e ssh _site/* notjulie@notjulie.com:public_html/notjulie
else
    echo "${0} [staging|release]"
    exit 1
fi

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo "deploy took ${DIFF} seconds"
