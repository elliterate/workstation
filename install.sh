#!/bin/bash

berks vendor cookbooks/
sudo -E chef-solo -c config.rb
