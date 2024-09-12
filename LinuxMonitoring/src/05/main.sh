source ./stat.sh


function check_args()
{
    if [ "$#" -ne 1 ]
    then
        printf "Needs path to the directory.\n"
        exit 1
    else
        if [ ! -d "$1" ]
        then
            printf 'Directory "%s" does not exist.\n' "$1"
            exit 2
        fi
        if [[ "${1: -1}" != "/" ]]; then
            printf 'Path "%s" does not end with a slash (/) character.\n' "$1"
            exit 3
        fi
    fi
}


function main()
{
    check_args "$@"
    print_stat "$1"
}


main "$@"
