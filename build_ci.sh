#!/bin/sh
set -x
cd app
npm install
cd ..
cd test
npm install
VCAP_SERVICES='{ "redis": [{"name": "teenyurl-redis-cache", "credentials": { "host": "localhost", "port": 6379, "password": "" } }]}'
TEST_FILES="$@"
[ -z "$TEST_FILES" ] && TEST_FILES="$(find . -name '*-test.js' -not -name 'Mongo*')"
./node_modules/.bin/mocha --reporter nyan -r mootools $TEST_FILES
