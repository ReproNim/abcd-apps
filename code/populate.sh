#!/bin/bash


cd $(dirname $0)/..

# does not work on smaug for some reason: https://github.com/brainlife/brainlife/issues/220
# datalad run -m "Fetch fresh list of apps" --explicit --output apps.json bash -c "curl --silent https://brainlife.io/api/warehouse/app/query | jq '.' >| apps.json"

jq .[].github apps.json | sed -e 's,",,g' | sort | uniq | while read r; do d=apps/$r; [ -e $d ] || datalad install -d . --source https://github.com/$r $d; done

