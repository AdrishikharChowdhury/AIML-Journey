#!/usr/bin/env bash

# Prompt user for the SQL file
read -r -p "Enter the SQL file path: " SQL_FILE

# Check if input is empty
if [ -z "$SQL_FILE" ]; then
    echo "Error: No file path provided."
    exit 1
fi

# Check if the specified file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "Error: File '$SQL_FILE' does not exist."
    exit 1
fi

echo "Executing '$SQL_FILE' against SQL Server..."

# Execute SQL file inside container
sudo docker exec -i sqlserver /opt/mssql-tools18/bin/sqlcmd \
   -S localhost \
   -U sa \
   -P 'YourStrongPassword123!' \
   -C \
   -i /dev/stdin < "$SQL_FILE"

# How to verify: Check return code of sqlcmd
if [ $? -eq 0 ]; then
    echo "Successfully executed '$SQL_FILE'."
else
    echo "Error: Query execution failed."
fi