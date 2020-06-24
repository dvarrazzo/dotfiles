#!/bin/bash

# Pass credential to git if required
# you can set the env variable used by this script and set
# git config credential.helper "/path/to/git-cred-helper.sh"

set -euo pipefail

echo username=$GIT_USERNAME
echo password=$GIT_PASSWORD
