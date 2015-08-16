#!/bin/sh

$NGINX -p $PWD -c server.conf &
sleep 1

curl -s -S -H "Host: example.com" --digest -u "test:test" "http://127.0.0.1:9090/remote_user_set"
curl -s -S -H "Host: example.com" --digest -u "test:test" "http://127.0.0.1:9090/remote_user_unset"
curl -s -S -H "Host: example.com" "http://127.0.0.1:9090/remote_user_unset"

kill `cat test.pid`
sleep 1
