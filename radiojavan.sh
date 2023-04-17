#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : radiojavan.sh
#
# [] Creation Date : 29-07-2018
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================
# https://stackoverflow.com/questions/3822621/how-to-exit-if-a-command-failed
set -e

usage() {
	echo "$(basename "$0") [-o] [track url in radiojavan, e.g. https://www.radiojavan.com/mp3s/mp3/Bahram-24-Saat?start=768&index=0]"
	echo "$(basename "$0") [-o] [track artist in radiojavan, e.g. Bahram] [track name in radiojavan, e.g. 24-Saat"
	echo "  -o   create mp3 file in specific directory"

}

rj_host="rj-mw1.com"

# downloads a music that is given by $1. $2 specifies rj media host.
# $3 specifies music quality, empty means a request url without quality.
rj-download-() {
	echo "Host-$2"

	status=$(curl -s -w "%{http_code}" -o "$1.mp3" "https://host$2.$rj_host/media/mp3/$1.mp3" || echo 500)

	if [ "$status" -ne 200 ] || grep -Fxq "Not found" "$name.mp3"; then
		echo "$status"
		rm "$name.mp3" || true
		return 1
	fi
	return 0
}

rj-download() {
	rj-download- "$1" 1 || rj-download- "$1" 2 || rj-download- "$1" 3
}

main() {
	if ! hash curl 2>/dev/null; then
		echo "This script needs curl for downloading phase"
		exit
	fi

	output_dir="."
	while getopts 'o:' argv; do
		case "$argv" in
		o)
			output_dir=$OPTARG
			;;
		*) ;;
		esac
	done

	for ((i = 2; i <= OPTIND; i++)); do
		shift
	done

	if [ "$#" -eq 1 ]; then
		name="$(basename "$1")"
		name="${name%%\?*}"
	elif [ "$#" -eq 2 ]; then
		name="$1-$2"
	else
		usage
		exit
	fi

	echo "Download $name from Radiojavan to $output_dir"

	if [ ! -d "$output_dir" ]; then
		echo "invalid directory name: $output_dir"
		exit 1
	fi
	rj-download "$name"

	if [ "$output_dir" != "." ]; then
		mv "$name.mp3" "$output_dir/$name.mp3"
	fi
}

main "$@"
