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
        1) printf "%s" "$F_WHITE_COLOR";;
        2) printf "%s" "$F_RED_COLOR";;
        3) printf "%s" "$F_GREEN_COLOR";;
        4) printf "%s" "$F_BLUE_COLOR";;
        5) printf "%s" "$F_PURPLE_COLOR";;
        6) printf "%s" "$F_BLACK_COLOR";;
        *) printf "%s" "$DEFAULT_COLOR";;
    esac
}
