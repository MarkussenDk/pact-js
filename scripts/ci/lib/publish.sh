#!/bin/bash -eu
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)" # Figure out where the script is running
. "$SCRIPT_DIR"/robust-bash.sh

require_binary npm

"${SCRIPT_DIR}"/prepare-release.sh
VERSION="$("$SCRIPT_DIR/get-version.sh")"

echo "--> Releasing version ${VERSION}"

echo "--> Releasing artifacts"
echo "    Publishing pact@${VERSION}..."
npm publish dist --access public --tag latest
echo "    done!"

echo "    Publishing pact-web@${VERSION}..."
npm publish dist-web --access public --tag latest
echo "    done!"