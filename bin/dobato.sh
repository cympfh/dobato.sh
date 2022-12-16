#!/bin/bash

usage() {
    cat <<EOM
dobato.sh

SYNOPSIS
    dobato.sh setup
        setup ~/.dobato

    dobato.sh setup --local
        setup ./.dobato (relative file)

    dobato.sh notify "<message>"
    dobato.sh notify longmessage.txt
        File name must ends with .txt
EOM
}

DISCORD_URL=

load() {
    if [ -s ./.dobato ]; then
        source ./.dobato
    elif [ -s ~/.dobato ]; then
        source ~/.dobato
    fi
}

setup() {
    LOCAL=0
    while [ $# -gt 0 ]; do
        if [ "$1" = "--local" ]; then
            LOCAL=1
            shift
        fi
    done
    CONFIGFILE=
    if [ $LOCAL = 0 ]; then
        CONFIGFILE=~/.dobato
    else
        CONFIGFILE=./.dobato
    fi
    EXISTS=0
    if [ -s "$CONFIGFILE" ]; then
        EXISTS=1
    fi
    if [ $EXISTS = 1 ]; then
        echo "[WARNING] config file ($CONFIGFILE) found." >&2
        echo -n "This operation will overwrite it. OK? [y/N] " >&2
        read ok
        if [ "$ok" != y ] && [ "$ok" != Y ]; then
            echo "Aborted." >&2
            exit 1
        fi
    fi
    echo -n "Discord webhook url: "
    read DISCORD_URL
    cat <<EOM >$CONFIGFILE
DISCORD_URL=$DISCORD_URL
EOM
    echo "Done! (check $CONFIGFILE)"
}

notify() {
    load
    MESSAGE=
    FILE=
    while [ $# -gt 0 ]; do
        case "$1" in
            *.txt )
                if [ -s "$1" ]; then
                    MESSAGE=
                    FILE="$1"
                    break
                else
                    MESSAGE="$1"
                fi
                shift
                ;;
            * )
                MESSAGE="$1"
                shift
                ;;
        esac
    done
    if [ ! "$FILE" ] && [ ! "$MESSAGE" ]; then
        echo "[Error] No message text or file" >&2
        exit 1
    fi
    if [ ! "$FILE" ] && [ "$MESSAGE" ]; then
        FILE=/tmp/dobato.txt
        echo "$MESSAGE" >$FILE
    fi
    if [ "$DISCORD_URL" ]; then
        echo "Notify to Discord" >&2
        notify-discord "$FILE"
    else
        echo "[Error] No idea" >&2
        exit 1
    fi
}

notify-discord() {
    FILE="$1"
    curl \
        -H "Content-Type: multipart/form-data" \
        -X POST \
        -F "file=@$FILE" \
        "$DISCORD_URL"
}

case "$1" in
    help | --help | -h )
        usage
        ;;
    setup | config )
        shift 1
        setup $@
        ;;
    notify )
        shift 1
        notify $@
        ;;
esac
