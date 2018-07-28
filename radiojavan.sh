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


rj-download() {
        curl -# -o "$name.mp3" "https://host2.rjmusicmedia.com/media/mp3/mp3-256/$1.mp3"
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
        echo "Download $name from Radiojavan"

        rj-download $name
}

main $@
