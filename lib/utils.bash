#!/usr/bin/env bash

set -euo pipefail

HADOOP_ARCHIVE_URL="https://archive.apache.org/dist/hadoop/common"
TOOL_NAME="hadoop"
TOOL_TEST="hadoop --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

echoerr() {
	echo "$1" >&2
}

curl_opts=(-fsSL)

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	local archive_src="${1:-}"

	if [[ -z "${archive_src}" ]]; then
		echo ""
		return
	fi

	{ grep -Eo '<a href="hadoop-[0-9]+\.[0-9]+\.[0-9]+(\-[a-z0-9]+)?\/">' <<<"${archive_src}" || :; } |
		sed -E 's/^<a href="hadoop-(.+)\/">$/\1/g'
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="$HADOOP_ARCHIVE_URL/hadoop-${version}/hadoop-${version}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="$3"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
