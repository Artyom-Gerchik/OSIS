#!/bin/zsh

function get_digit_via_symbols {
    case $1 in
    0)
        echo "/‾‾‾\ "
        echo "|   | "
        echo "|   | "
        echo "|   | "
        echo "\___/ "
        ;;
    1)
        echo " /|   "
        echo "/ |   "
        echo "  |   "
        echo "  |   "
        echo "  |   "
        ;;
    2)
        echo "‾‾‾‾\ "
        echo "    | "
        echo " ___/ "
        echo "/     "
        echo "\____ "
        ;;
    3)
        echo "‾‾‾‾\ "
        echo "    | "
        echo "----| "
        echo "    | "
        echo "____/ "
        ;;
    4)
        echo "|   | "
        echo "|   | "
        echo "\___| "
        echo "    | "
        echo "    | "
        ;;
    5)
        echo "/‾‾‾‾ "
        echo "|     "
        echo "\___  "
        echo "    \ "
        echo "____/ "
        ;;
    6)
        echo "/‾‾‾\ "
        echo "|     "
        echo "|‾‾‾\ "
        echo "|   | "
        echo "\___/ "
        ;;
    7)
        echo "‾‾‾‾\ "
        echo "    | "
        echo "    | "
        echo "    | "
        echo "    | "
        ;;
    8)
        echo "/‾‾‾\ "
        echo "|   | "
        echo "|---| "
        echo "|   | "
        echo "\___/ "
        ;;
    9)
        echo "/‾‾‾\ "
        echo "|   | "
        echo "\___| "
        echo "    | "
        echo "____/ "
        ;;
    esac
}

function random_number() {

    random_number=$(((RANDOM % (100 + 1))))

    echo "$random_number"
}

function get_left_indent() {
    local counter=$1
    spaces=""
    for ((i = 0; i < counter; i++)); do
        spaces="${spaces} "
    done
    echo "$spaces"
}

function get_row() {
    local string="$1"
    local index="$2"
    echo "$string" | sed -n "${index}p"
}

function create_clock() {
    string1="$1"
    string2="$2"
    string3="$3"
    string4="$4"

    # left space
    left_indent=$(get_left_indent $(random_number))

    # top space
    for ((i = 1; i <= $(random_number); i++)); do
        echo ""
    done

    final_string=""

    # add row by row
    for ((i = 1; i <= 5; i++)); do
        if [ $i -eq 2 ]; then
            space_between_digits="  .  "
        elif [ $i -eq 4 ]; then
            space_between_digits="  .  "
        else
            space_between_digits="     "
        fi
        final_string="${final_string}${left_indent}$(get_row "$string1" "$i")  $(get_row "$string2" "$i")${space_between_digits}$(get_row "$string3" "$i")  $(get_row "$string4" "$i")
"
    done

    echo "$final_string"
}

while true; do
    clear
    hour=$(date +%H)
    minute=$(date +%M)

    first_hour_digit=$(get_digit_via_symbols $(expr $hour / 10))
    second_hour_digit=$(get_digit_via_symbols $(expr $hour % 10))

    first_minute_digit=$(get_digit_via_symbols $(expr $minute / 10))
    second_minute_digit=$(get_digit_via_symbols $(expr $minute % 10))

    create_clock "$first_hour_digit" "$second_hour_digit" "$first_minute_digit" "$second_minute_digit"

    sleep 0.5
done

# вопросы
# по поводу $COLUMNS не работает, в zsh работает, в sh/bash нет.
