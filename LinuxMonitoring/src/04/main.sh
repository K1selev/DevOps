source ./stat.sh


function check_the_default_scheme()
{
    code_pattern="^[1-6]$"
    for idx in {0..3}
    do
        if ! [[ "${default_color_scheme[$idx]}" =~ $code_pattern ]]
        then
            printf "The code %s is out of the [1-6] segment.\n" "${default_color_scheme[$idx]}"
            exit 1
        fi
    done
    for idx in 0 2
    do
        if [ "${default_color_scheme[$idx]}" -eq "${default_color_scheme[$idx + 1]}" ]
        then
            printf "The codes[%d] = %d and codes[%d] = %d are the same.\n" "$idx" "${default_color_scheme[$idx]}" $(( idx + 1 )) "${default_color_scheme[$idx + 1]}"
            exit 2
        fi
    done
}


function configure()
{
    if (( $# != 0 ));
    then
        printf "[ATTENTION]: no parametres are needed.\n"
    fi
    code_pattern="^[1-6]$"
    for idx in {0..3}
    do
        arg="${color_scheme[$idx]}"
        if ! [[ "$arg" =~ $code_pattern ]]
        then
            color_scheme[idx]="${default_color_scheme[$idx]}"
        fi
    done
    for idx in 0 2
    do
        if [ "${color_scheme[$idx]}" -eq "${color_scheme[$idx + 1]}" ]
        then
            printf "The codes[%d] = %d and codes[%d] = %d are the same.\n" "$idx" "${color_scheme[$idx]}" $(( idx + 1 )) "${color_scheme[$idx + 1]}"
            exit 2
        fi
    done
}


function main()
{
    check_the_default_scheme
    configure "$@"
    print_colorised_stats "${color_scheme[0]}" "${color_scheme[1]}" "${color_scheme[2]}" "${color_scheme[3]}"
    print_used_colors
}


main "$@"
