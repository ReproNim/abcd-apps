#!/bin/bash


cd $(dirname $0)/..

datalad run -m "Fetch fresh list of apps" --explicit --output apps.json bash -c "curl --silent https://brainlife.io/api/warehouse/app/query | jq '.' >| apps.json"
