#!/bin/bash

staled_list=$(echo "$STALED_PRS" | jq '.[] | .pull_request.html_url' | tr -d '"')
closed_list=$(echo "$CLOSED_PRS" | jq '.[] | .pull_request.html_url' | tr -d '"')

staled_formatted_list=""
for item in $staled_list; do
  staled_formatted_list+="$item "
done

closed_formatted_list=""
for item in $closed_list; do
  closed_formatted_list+="$item "
done

echo "::set-output name=staledPRs::$staled_formatted_list"
echo "::set-output name=closedPRs::$closed_formatted_list"