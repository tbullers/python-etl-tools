#! /bin/bash

FILE=dsn-data.json

if test -f "$FILE"; then
    echo "*** '$FILE' exists - please move this file in order to create a new blank '$FILE'"
    echo
    exit 1
fi

cat > $FILE <<EOF
{
    "uid": "db2inst1",
    "pwd": "password",
    "hostname": "db hostname",
    "port": "50000",
    "database": "sample"
}
EOF
