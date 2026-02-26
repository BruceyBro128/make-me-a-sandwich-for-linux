#!/bin/bash

# Check if the first three arguments are exactly "me a sandwich"
if [[ "$1" == "me" && "$2" == "a" && "$3" == "sandwich" ]]; then
    if [ "$EUID" -ne 0 ]; then
        echo "fuck off"
    else
        # 50/50 Chance Logic
        if [ $(( $RANDOM % 2 )) -eq 0 ]; then
            echo "ok"
        else
            echo "no"
        fi
    fi
else
    # If the words don't match, run the REAL 'make' command
    # 'command' prevents the script from calling itself in an infinite loop
    command make "$@"
fi
