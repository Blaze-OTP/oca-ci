#!/bin/bash

set -e

# Run pytest on the tests directory,
# which is assumed to be mounted somewhere in the docker image.

here=$(dirname $0)
testvenv=/tmp/testvenv 

virtualenv -p python3 $testvenv
git config --global user.name ${OCA_GIT_USER_NAME}
git config --global user.email ${OCA_GIT_USER_EMAIL}
$testvenv/bin/pip install pytest
$testvenv/bin/pytest --color=yes --ignore $here/data $here "$@"
