#!/bin/bash

opts=""

recipes=("$@")
if [[ "${#recipes[@]}" > 0 ]]; then
  opts="-o $(IFS=,; echo "${recipes[*]}")"
fi

berks vendor cookbooks/
sudo -E chef-solo -c config.rb $opts
