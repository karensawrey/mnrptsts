#!/bin/bash
set -ueo pipefail

git fetch origin main

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$CURRENT_BRANCH" == "main" ]; then

    diff=$(git diff --name-only "$(git merge-base HEAD HEAD~1)" HEAD)
else

    diff=$(git diff --name-only "$(git merge-base HEAD origin/main)" HEAD)
fi

# Need output, even if empty
echo "${diff:-}"
