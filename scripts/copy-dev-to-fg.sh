#!/bin/bash

set -x
set -e

fgdir=${1:-${FG_HOME}}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

pushd "${scriptdir}/../extension"

source .metadata

mkdir -p "${fgdir}/extensions/${name}"
rsync -av --exclude-from=.zipignore ./ "${fgdir}/extensions/${name}/"

popd
