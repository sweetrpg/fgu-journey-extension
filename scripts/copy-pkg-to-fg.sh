#!/bin/bash

set -x
set -e

fgdir=${1:-${FG_HOME}}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

pushd "${scriptdir}/../extension"

source .metadata

zip -9r -x@.zipignore ../${filename} .
cp ../${filename} "${fgdir}/extensions/"

popd
