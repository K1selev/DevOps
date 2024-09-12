function stats
{
    echo HOSTNAME = $(hostname)
    echo TIMEZONE = $(printf "%s UTC %s" "$(cat /etc/timezone)" "$(date +"%z")")
    echo USER = $(whoami)
    echo OS = $(awk -F' ' '{print $1, $2, $3}' < /etc/issue | xargs)
    echo DATE = $(date +"%d %b %Y %H:%M:%S")
    echo UPTIME = $(uptime -p)
    echo UPTIME_SEC = $(awk '{print $1}' < /proc/uptime)
    echo IP = $(hostname -I | awk '{print $1}')
    echo MASK = $(ip address | ipcalc "$IP" | grep "^Netmask" | awk '{print $2}')
    echo GATEWAY = $(ip route | grep "default" | awk '{print $3}')
    echo RAM_TOTAL = $(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
    echo RAM_USED = $(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
    echo RAM_FREE = $(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
    echo SPACE_ROOT = $(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
    echo SPACE_ROOT_USED = $(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
    echo SPACE_ROOT_FREE = $(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')
}

function main()
{
    result=$(stats)
    printf "%s\n" "$result"
    read -r -p "Saving data? [Y/N] " to_save
    if [[ $to_save =~ ^\s*[Yy]\s*$ ]];
    then
        file_name=$(date +"%d_%m_%y_%H_%M_%S")
        printf "%s" "$result" > "${file_name}.status"
    fi
}

main

