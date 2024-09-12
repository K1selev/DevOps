if [ $# -ne 1 ]
then
    echo Only single argument.
else
    num="^\s*[+-]?[0]*([0-9]+|[0-9]+\.[0-9]*|[0-9]*\.[0-9]+|[1-9]\.[0-9]*[eE][+-]?[0-9]+)\s*$"
    if [[ "$1" =~ $num ]]
    then
        echo Error: $1 is a number.
        else
        echo $1
    fi
fi
