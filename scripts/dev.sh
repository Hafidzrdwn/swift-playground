#!/bin/sh

MODE=$1
TARGET=${2:-main}

run() {
    swift "src/$TARGET.swift"
}

watch() {
    LAST=""

    while true
    do
        clear

        run

        CURRENT=$(stat -c %Y "src/$TARGET.swift")

        while [ "$CURRENT" = "$LAST" ]
        do
            sleep 1
            CURRENT=$(stat -c %Y "src/$TARGET.swift")
        done

        LAST=$CURRENT
    done
}

case "$MODE" in
    watch)
        watch
        ;;
    *)
        run
        ;;
esac