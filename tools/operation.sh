#!/bin/bash
# usage
# make new_post or new_page or more operate

WORK_DIR=$(dirname $(dirname $(realpath "$0")))
HEAD_POST="---\ntitle: "$2"\nauthor: quan-ouyang\ndate: $(date +'%Y-%m-%d %H%M%S')\ncategories: []\ntags: []\n---"
POST_DIR=${WORK_DIR}/_posts/
File_Name="$(date +%Y-%m-%d)-$(ch2py "$2" -s -).md"

_help() {
    echo "Usage:"
    echo
    echo "   bash operating.sh [options]"
    echo
    echo "Options:"
    echo "   -new_post, -- <URL>      The site relative url that start with slash, e.g. '/project'"
    echo "   -h, -help               Print the help information"
    echo "   -new_page,   <DIR>  Destination directory (defaults to ./_site)"
}

_new_post() {
    if [ "$1" == "" ]; then
        echo "请输入参数 --help"
    else
        touch $POST_DIR$File_Name
        echo -e $HEAD_POST >$POST_DIR$File_Name
        echo "$(date +%Y-%m-%d)-$(ch2py "$2" -s -).md 创建成功"
    fi

}

main() {
    while [[ $# -gt 0 ]]; do
        opt="$1"
        case $opt in
        -new_post)
            _new_post "$@"
            exit 0
            ;;
        -h | --help)
            _help
            exit 0
            ;;
        *)
            _help
            exit 1
            ;;
        esac
    done
}

main "$@"
