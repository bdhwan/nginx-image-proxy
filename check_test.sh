#!/bin/bash
echo "ok"

echo "TARGET_HOST="${TARGET_HOST}


sed -i -e 's/__to_host__/'${TARGET_HOST}'/g' default_test
sed -i -e 's/__source_host__/'${SOURCE_HOST}'/g' default_test

echo "done"

nginx -g 'daemon off;'
