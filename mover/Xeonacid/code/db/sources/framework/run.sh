#!/bin/sh

sed -i \
  -E 's/(host[[:space:]]+all[[:space:]]+all[[:space:]]+127.0.0.1\/32[[:space:]]+)scram-sha-256/\1trust/' \
  /etc/postgresql/16/main/pg_hba.conf

sed -i \
  -E 's/(host[[:space:]]+all[[:space:]]+all[[:space:]]+::1\/128[[:space:]]+)scram-sha-256/\1trust/' \
  /etc/postgresql/16/main/pg_hba.conf

/etc/init.d/postgresql restart

sudo -u postgres psql postgres -c "ALTER ROLE postgres WITH SUPERUSER LOGIN PASSWORD 'postgrespw';"
sudo -u postgres psql postgres -c "CREATE DATABASE sui_indexer_v2;" -c "ALTER SYSTEM SET max_connections = 500;"

cargo r --release
