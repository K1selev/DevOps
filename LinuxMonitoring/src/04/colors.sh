source ./config.conf


default_color_scheme=(1 2 4 2)

color_scheme=(
    "$column1_background"
    "$column1_font_color"
    "$column2_background"
    "$column2_font_color"
)


function get_color_name()
{
    case "$1" in
        1) printf "white";;
        2) printf "red";;
        3) printf "green";;
        4) printf "blue";;
        5) printf "purple";;
        6) printf "black";;
    esac
}


function get_color_type()
{
    color_name=$(get_color_name "$1")
    default_color_name=$(get_color_name "${default_color_scheme[$2]}")
    if [[ "$color_name" == "$default_color_name" ]]
    then
        printf "default (%s)" "$color_name"
    else
        printf "%d (%s)" "$1" "$color_name"
    fi
}


function print_used_colors()
{
    color_type=$(get_color_type "${color_scheme[0]}" 0)
    printf "Column 1 background = %s\n" "$color_type"

    color_type=$(get_color_type "${color_scheme[1]}" 1)
    printf "Column 1 font color = %s\n" "$color_type"

    color_type=$(get_color_type "${color_scheme[2]}" 2)
    printf "Column 3 background = %s\n" "$color_type"

    color_type=$(get_color_type "${color_scheme[3]}" 3)
    printf "Column 2 font color = %s\n" "$color_type"
}

DEFAULT_COLOR='\033[0m'

BG_BLACK_COLOR='\033[40m'
BG_RED_COLOR='\033[41m'
BG_GREEN_COLOR='\033[42m'
BG_PURPLE_COLOR='\033[45m'
BG_BLUE_COLOR='\033[46m'
BG_WHITE_COLOR='\033[47m'

F_BLACK_COLOR='\033[30m'
F_RED_COLOR='\033[31m'
F_GREEN_COLOR='\033[32m'
F_PURPLE_COLOR='\033[35m'
F_BLUE_COLOR='\033[36m'
F_WHITE_COLOR='\033[37m'


function get_background()
{
    case "$1" in
        1) printf "%s" "$BG_WHITE_COLOR";;
        2) printf "%s" "$BG_RED_COLOR";;
        3) printf "%s" "$BG_GREEN_COLOR";;
        4) printf "%s" "$BG_BLUE_COLOR";;
        5) printf "%s" "$BG_PURPLE_COLOR";;
        6) printf "%s" "$BG_BLACK_COLOR";;
        *) printf "%s" "$DEFAULT_COLOR";;
    esac
}

function get_font()
{
    case "$1" in
        1) printf "%s" "$FG_WHITE_COLOR";;
        2) printf "%s" "$FG_RED_COLOR";;
        3) printf "%s" "$FG_GREEN_COLOR";;
        4) printf "%s" "$FG_BLUE_COLOR";;
        5) printf "%s" "$FG_PURPLE_COLOR";;
        6) printf "%s" "$FG_BLACK_COLOR";;
        *) printf "%s" "$DEFAULT_COLOR";;
    esac
}
