#!/bin/bash

# Start MySQL service
service mysql start

# Wait for MySQL to be ready
echo "Waiting for MySQL to start..."
until mysqladmin ping --silent; do
    sleep 1
done

# Set root password and native authentication plugin
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'phage'; FLUSH PRIVILEGES;"

MYSQL_CMD="mysql -u root -pphage"

DB_URL="${DB_URL:-http://databases.hatfull.org/Actino_Draft/Actino_Draft.sql}"

echo "Loading database from ${DB_URL} into Actino_Draft..."
$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS Actino_Draft;"
curl -s "${DB_URL}" | $MYSQL_CMD Actino_Draft
echo "Database loaded."

echo "MySQL root password set to 'phage' with native plugin. Ready for pdm_utils."

# Activate Conda environment
eval "$(/opt/conda/bin/conda shell.bash hook)"
conda activate pdm_utils

# Run the user's command, or start bash if none provided
if [ $# -eq 0 ]; then
    exec bash
else
    exec "$@"
fi
