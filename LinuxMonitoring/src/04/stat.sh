source ./colors.sh

HOSTNAME_=$(hostname)
TIMEZONE_=$(printf "%s UTC %s" "$(cat /etc/timezone)" "$(date +"%z")")
USER_=$(whoami)
OS_=$(awk -F' ' '{print $1, $2, $3}' < /etc/issue | xargs)  # xargs trims
DATE_=$(date +"%d %b %Y %H:%M:%S")
UPTIME_=$(uptime -p)
UPTIME_SEC_=$(awk '{print $1}' < /proc/uptime)
IP_=$(hostname -I | awk '{print $1}')  # there may be several IPs
MASK_=$(ip address | ipcalc "$IP_" | grep "^Netmask" | awk '{print $2}')
GATEWAY_=$(ip route | grep "default" | awk '{print $3}')
RAM_TOTAL_=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED_=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE_=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

function print_colorised_stats
{
    bg_name=$(get_background "$1")
    font_name=$(get_font "$2")
    bg_value=$(get_background "$3")
    font_value=$(get_font "$4")
    bg_def=$(get_background 0)
    font_def=$(get_font 0)

    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "HOSTNAME" "$bg_def" "$font_def" "$bg_value" "$font_value" "$HOSTNAME_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "TIMEZONE" "$bg_def" "$font_def" "$bg_value" "$font_value" "$TIMEZONE_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "USER" "$bg_def" "$font_def" "$bg_value" "$font_value" "$USER_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "OS" "$bg_def" "$font_def" "$bg_value" "$font_value" "$OS_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "DATE" "$bg_def" "$font_def" "$bg_value" "$font_value" "$DATE_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "UPTIME" "$bg_def" "$font_def" "$bg_value" "$font_value" "$UPTIME_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "UPTIME_SEC" "$bg_def" "$font_def" "$bg_value" "$font_value" "$UPTIME_SEC_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "IP[s]" "$bg_def" "$font_def" "$bg_value" "$font_value" "$IP_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "MASK[s]" "$bg_def" "$font_def" "$bg_value" "$font_value" "$MASK_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "GATEWAY" "$bg_def" "$font_def" "$bg_value" "$font_value" "$GATEWAY_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "RAM_TOTAL" "$bg_def" "$font_def" "$bg_value" "$font_value" "$RAM_TOTAL_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "RAM_USED" "$bg_def" "$font_def" "$bg_value" "$font_value" "$RAM_USED_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "RAM_FREE" "$bg_def" "$font_def" "$bg_value" "$font_value" "$RAM_FREE_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "SPACE_ROOT" "$bg_def" "$font_def" "$bg_value" "$font_value" "$SPACE_ROOT_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "SPACE_ROOT_USED" "$bg_def" "$font_def" "$bg_value" "$font_value" "$SPACE_ROOT_USED_" "$bg_def" "$font_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$font_name" "SPACE_ROOT_FREE" "$bg_def" "$font_def" "$bg_value" "$font_value" "$SPACE_ROOT_FREE_" "$bg_def" "$font_def"
}
