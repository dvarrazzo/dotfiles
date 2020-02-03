#!/bin/bash

set -euo pipefail
# set -x

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function log() {
    echo $1 >&2
}

for d in $(cd ${dir}/.. && ls -d vim/pack/*/*/*/); do
    # Update only if it's a submodule
    # ${d%/} strips trailing slash
    if ! grep -q ${d%/} "${dir}/../.gitmodules"; then
        continue
    fi
    log "updating package $(basename $d)"
    git -C "../$d" checkout master
    git -C "../$d" pull
done

log "updating black"
curl -sL https://raw.githubusercontent.com/psf/black/master/plugin/black.vim \
    > plugin/black.vim
