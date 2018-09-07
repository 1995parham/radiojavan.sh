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
        echo "$(basename $0) [-o] [radiojavan music url, e.g. https://www.radiojavan.com/mp3s/mp3/Bahram-24-Saat?start=768&index=0]"
        echo "  -o   create mp3 file in specific directory"

}

rj-download-() {
        echo Host-$2

        status=$(curl -# -w "%{http_code}" -o "$1.mp3" "https://host$2.rjmusicmedia.com/media/mp3/mp3-256/$1.mp3")

        if [ $status -ne 200 ]; then
                echo $status
                rm "$name.mp3"
                return 1
        fi
        return 0
}

rj-download() {
        rj-download- $1 1 || rj-download- $1 2
}

main() {
        if ! hash curl 2>/dev/null; then
                echo "This script needs curl for downloading phase"
                exit
        fi

        output_dir="."
        while getopts 'o:' argv; do
                case $argv in
                        o)
                                output_dir=$OPTARG
                                ;;
                esac
        done

        for ((i=2; i<=OPTIND; i++)); do
                shift
        done

        if [ -z $1 ]; then
                usage
                exit
        fi

        name=$(basename $1)
        name=${name%%\?*}
        echo "Download $name from Radiojavan to $output_dir"

        if [ ! -d $output_dir ]; then
                echo "invalid directory name: $output_dir"
                exit 1
        fi
        rj-download $name && mv "$name.mp3" "$output_dir/$name.mp3"
}

main $@
