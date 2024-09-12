source ./stat.sh


function valid_args()
{
    if (( $# != 4 ));
    then
        echo Need 4 integer codes for color
        exit 1
    fi
    for arg in "$@"
    do
        if [[ $arg -lt 1 || $arg -gt 6 ]];
        then
            echo $arg invalid argument
            exit 2
        fi
    done
    if [[ $1 -eq $2 ]];
    then
        echo Colors are the same
        exit 3
    fi
    if [[ $3 -eq $4 ]];
    then
        echo Colors are the same
        exit 4
    fi
}


function main()
{
    valid_args "$@"
    print_colorised_stats "$@"
}


main "$@"
