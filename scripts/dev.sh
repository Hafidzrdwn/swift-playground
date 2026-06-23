#!/bin/sh

MODE=$1
TARGET=${2:-main}

run() {
    if [ "$TARGET" = "test" ]; then
        echo "⏳ Mengkompilasi semua file .swift..."
        swiftc src/*.swift -o run_test && ./run_test
    else
        swift "src/$TARGET.swift"
    fi
}

watch() {
    LAST=""

    while true
    do
        clear
        run

        CURRENT=$(stat -c %Y src/*.swift 2>/dev/null | sort -nr | head -n 1)

        while [ "$CURRENT" = "$LAST" ]
        do
            sleep 1
            CURRENT=$(stat -c %Y src/*.swift 2>/dev/null | sort -nr | head -n 1)
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