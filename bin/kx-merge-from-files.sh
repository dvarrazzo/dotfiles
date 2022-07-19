#!/bin/bash

# Merge a set of kubeconfig files to stdout.
#
# Usage: kx-merge-from-file file1 file2 ... > ~/.kube/config
#
# See kx-split-in-dir.sh for the opposite operation.

set -euo pipefail
# set -x

# https://stackoverflow.com/questions/1527049/how-can-i-join-elements-of-an-array-in-bash
function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

export KUBECONFIG=$(join_by : "$@")
kubectl config view --flatten
