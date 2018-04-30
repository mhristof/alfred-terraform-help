#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

export CODE=$(cat tf-doc.py)
export VERSION=$(./tf-doc.py --version)

envsubst '$CODE:$VERSION' < info.plist.template > info.plist

exit 0
