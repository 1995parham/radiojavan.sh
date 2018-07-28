#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : radiojavan.sh
#
# [] Creation Date : 29-07-2018
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

usage() {
        echo "$(basename $0) [radiojavan music url]"
}

rj-download-() {
        echo Host-$2

        status=$(curl -# -w "%{http_code}" -o "$1.mp3" "https://host$2.rjmusicmedia.com/media/mp3/mp3-256/$1.mp3")

        if [ $status -ne 200 ]; then
                echo $status
                rm "$name.mp3"
        fi
}

rj-download() {
        rj-download- $1 1
        rj-download- $1 2
}

main() {
        if ! hash curl 2>/dev/null; then
                echo "This script needs curl for downloading phase"
                exit
        fi

        if [ $# -ne 1 ]; then
                usage
                exit
        fi

        name=$(basename $1)
        name=${name%%\?*}
        echo "Download $name from Radiojavan"

        rj-download $name
}

main $@
