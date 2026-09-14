#!/usr/bin/env bash

# Enable nullglob so empty matches don't break the array
shopt -s nullglob
SQL_FILES=(*.sql)

if [ ${#SQL_FILES[@]} -eq 0 ]; then
    echo "Error: No .sql files found in current directory."
    exit 1
fi

echo "Available SQL files:"
echo "-------------------"

PS3="Select a file number: "
select SQL_FILE in "${SQL_FILES[@]}"; do
    if [ -n "$SQL_FILE" ]; then
        break
    else
        echo "Invalid selection. Please try again."
    fi
done

echo ""
echo "Executing '$SQL_FILE' against SQL Server..."

# Execute SQL file inside container
sudo docker exec -i sqlserver /opt/mssql-tools18/bin/sqlcmd \
   -S localhost \
   -U sa \
   -P 'YourStrongPassword123!' \
   -C \
   -i /dev/stdin < "$SQL_FILE"

# Check status
if [ $? -eq 0 ]; then
    echo "Successfully executed '$SQL_FILE'."
else
    echo "Error: Query execution failed."
fi