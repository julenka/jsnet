#!/bin/bash

# 8/7/2019: moved to github pages, see https://pages.github.com/ for more info. Github pages does not support
# subdomains, so I removed the ability to deploy to staging or release. Now deploy will always go to release

# terminate in case of failure
# http://stackoverflow.com/questions/4381618/exit-a-script-on-error
set -e 

# http://unix.stackexchange.com/questions/12068/how-to-measure-time-of-program-execution-and-store-that-inside-a-variable
START=$(date +%s)


echo 'building release...'
jekyll build --config _config_githubio.yml

echo 'deploying release...'
# 8/7/2019: To deploy, I now need to copy contents of _site/ into ../julenka.github.io
# then commit and push changes

PAGES_REPO_PATH="../julenka.github.io"
# Do a copy instead of a mirror, because a mirror that will delete the .git folder
rsync -avu _site/ $PAGES_REPO_PATH

pushd $PAGES_REPO_PATH
DATESTR=$(date)
git add .
git commit -m "Update site $DATESTR"
git push
popd

END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)

echo "deploy took ${DIFF} seconds"
