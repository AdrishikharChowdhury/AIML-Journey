# SQL Repository — Data Analyst Journey

A collection of SQL scripts covering fundamental to intermediate SQL concepts, built on **Microsoft SQL Server** against a `dev_db` database.

## Overview

This folder contains `.sql` files organized by topic, each demonstrating specific SQL concepts with practical examples using employee demographics and salary data.

## Database Setup

- **DB Engine:** Microsoft SQL Server
- **Database:** `dev_db`
- **Run scripts:** Use `./run.sh` to interactively select and execute any `.sql` file against a local SQL Server container.

### Tables Used

| Table | Description |
|---|---|
| `EmployeeDemographics` | Core employee info (ID, FirstName, LastName, Age, Gender) |
| `EmployeeSalary` | Job title and salary per employee |
| `EmployeeDemoGraphics` | Variant demographics table |
| `WareHouseEmployeeDemographics` | Separate warehouse employee records |
| `EmployeeErrors` | Deliberately messy data for string function practice |

## Files

### Basics
| File | Concept |
|---|---|
| `create-table.sql` | `CREATE TABLE` statements |
| `insert-data.sql` | `INSERT INTO` with multiple rows and values |
| `select-table.sql` | `SELECT`, `DISTINCT`, aggregate functions (`COUNT`, `MAX`, `MIN`, `AVG`) |
| `where-table.sql` | `WHERE` clause — comparisons, `AND`/`OR`, `LIKE`, `IS NOT NULL`, `IN` |

### Joins & Combining
| File | Concept |
|---|---|
| `join-table.sql` | `INNER`, `LEFT`, `RIGHT`, `FULL OUTER JOIN` |
| `union-table.sql` | `UNION` vs `UNION ALL` |

### Filtering & Grouping
| File | Concept |
|---|---|
| `by-table.sql` | `GROUP BY`, `ORDER BY`, grouping with multiple columns |
| `clause-table.sql` | `HAVING` with `GROUP BY` |

### String Functions
| File | Concept |
|---|---|
| `string-table.sql` | `TRIM`, `LTRIM`, `RTRIM`, `REPLACE`, `SUBSTRING`, `LOWER`, `UPPER` |

### Advanced Queries
| File | Concept |
|---|---|
| `alias-table.sql` | Column and table aliases |
| `case-table.sql` | `CASE` / `WHEN` conditional logic |
| `subq-table.sql` | Subqueries (scalar, correlated, `IN`) |
| `cte-table.sql` | Common Table Expressions (`WITH` clause) |
| `part-table.sql` | `PARTITION BY` window functions |

### Data Modification
| File | Concept |
|---|---|
| `updel-table.sql` | `UPDATE` and `DELETE` |

### Objects
| File | Concept |
|---|---|
| `temp-table.sql` | Local temporary tables (`#temp`) |
| `sp-table.sql` | Stored procedures (`CREATE PROCEDURE`, `EXEC`, `ALTER`) |

## Usage

```bash
# Make run.sh executable (if needed)
chmod +x run.sh

# Run interactively
./run.sh
```

Or execute directly with `sqlcmd`:

```bash
sudo docker exec -i sqlserver /opt/mssql-tools18/bin/sqlcmd \
   -S localhost -U sa -P 'YourStrongPassword123!' -C \
   -i /dev/stdin < select-table.sql
```
