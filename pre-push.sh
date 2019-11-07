# note: this is actually copied from a colleague :) 
# will stash local changes, run tests, unstash changes

#!/usr/bin/env bash

stash_name=$(date "+%Y%m%d_%H%M%S")'-pre-push-stash'
if [[ -n $(git status -s) ]] ; then
    git stash push -u -m $stash_name
    echo "Pushing local changes to git stash"
fi

npm_test_return=0
if ! CI=true npm test ; then
    npm_test_return=1
    echo "CI tests failed"
fi

stash_id=$(git stash list | grep $stash_name | cut -d: -f1)
if [[ -n $stash_id ]] ; then
    git stash pop $stash_id
    echo "Popped pre-push stash from git stash"
fi

exit ${npm_test_return}
