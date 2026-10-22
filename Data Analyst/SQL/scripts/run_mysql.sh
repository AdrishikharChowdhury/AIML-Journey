#!/usr/bin/env bash

# Enable nullglob so empty matches don't break the array,
# and globstar so **/ matches files in subdirectories too
shopt -s nullglob globstar
SQL_FILES=(**/*.sql)

if [ ${#SQL_FILES[@]} -eq 0 ]; then
    echo "Error: No .sql files found in this directory or its subdirectories."
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
echo "Executing '$SQL_FILE' against MariaDB..."

# Execute SQL file using the local MariaDB client
mariadb -u root -p'rishi' < "$SQL_FILE"

# Check status
if [ $? -eq 0 ]; then
    echo "Successfully executed '$SQL_FILE'."
else
    echo "Error: Query execution failed."
fi
