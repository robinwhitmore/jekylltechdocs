#!/usr/bin/env bash

#
# Usage:
#   script/proof

# set -e

function msg {
 printf "\e[0;37m==> $1\e[0m\n"
}


SOURCE="jekylltechdocs"
DESTINATION="x_platform_output"


export PROOF=true
export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

cd Documents/jekylltechdocs

# 1.
# msg "Installing..."
# bundle install -j8 > /dev/null || bundle install > /dev/null

# 2.
# msg "Building..."
# bundle exec jekyll build -s $SOURCE -d $DESTINATION --trace


# 3.
msg "Proofing..."
time bundle exec htmlproofer ./$DESTINATION 2>&1 | tee platform_output.txt
