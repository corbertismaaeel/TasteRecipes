#!/bin/bash

curBranch=$(git symbolic-ref --short -q HEAD)
echo "                                ==========> branch: $curBranch"

git add .
git commit -m "$1"


remote_names=$(git remote)
for remote_name in $remote_names; do

    if [ -n "${remote_name}" ]; then
        echo ""
        echo "==========================="
        printf "\e[1;32m---> push to ${remote_name} ${curBranch} \e[0m\n"
        echo "==========================="
        echo ""
        git push ${remote_name} ${curBranch}
    fi
done


