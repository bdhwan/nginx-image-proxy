#!/bin/bash
echo "ok"

echo "TARGET_HOST="${TARGET_HOST}
echo "TARGET_HOST="${SOURCE_HOST}


sed -i -e 's/__to_host__/'${TARGET_HOST}'/g' /etc/nginx/sites-available/default
sed -i -e 's/__source_host__/'${SOURCE_HOST}'/g' /etc/nginx/sites-available/default

echo "done"

nginx -g 'daemon off;'
