#!/bin/sh
`npm bin`/postgraphile -n 0.0.0.0 -c "postgres://$USER:$PASS@$HOST:$PORT/$DB" --schema "${SCHEMA-public}" -o -a -j -M --append-plugins postgraphile-plugin-connection-filter
