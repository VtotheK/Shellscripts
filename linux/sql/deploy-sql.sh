#!/bin/bash

sql=$1

if [ -z $sql ]; then
    echo "Add the path of the sql-file as command line argument."
    exit 1
fi

if [ ! -f .env ]; then
    echo "No credentials found for MYSQL-connection"
    exit 1
fi

export $(grep -v '^#' .env|xargs)

user=$DB_USER
db=$DB_DATABASE
password=$DB_PASSWORD

mysql -u $user -p$password -D $db < $sql
