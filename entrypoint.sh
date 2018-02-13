#! /bin/bash
postgraphile -n 0.0.0.0 -c postgres://$USER:$PASS@$HOST:$PORT/$DB -o -a -j -M --append-plugins /plugins/connection-filter/index.js