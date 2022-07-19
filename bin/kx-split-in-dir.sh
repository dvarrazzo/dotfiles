#!/bin/bash

# Split the current kubeconfig into one file per context into a target dir.
#
# Use the `KUBECONFIG` env var to specify what to split (`:`-separated files).
#
# See kx-merge-from-files.sh for the opposite operation.

set -euo pipefail
# set -x

target_dir="${1:-}"
if [[ ! "${target_dir}" ]]; then
    echo "Usage: $0 TARGET_DIR" >&2
    exit 2
fi

for n in $(kubectl config view -o json | jq -r  '.contexts[].name'); do
    echo $n >&2
    kubectl config view --minify --flatten --context=$n > "${target_dir}/${n}.yaml"
done
