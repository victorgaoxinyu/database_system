## Subqueries
- No limit to the number of subqueries
- Performance slows when you nest too deeply
- Subquery select can only retrieve a single col


## String
- concatenate
  - + or ||
- substring
  - SUBSTR(string_name, string_position, number_of_char_to_return)
- Trim, Trim the leading or trailing spaces from a string
  - TRIM
  - RTRIM
  - LTRIM
- UPPER
  - UPPER/UCASE
- LOWER

## DATETIME
```SQLite
DATE(timestring, modifier, ....)
TIME(timestring, modifier, ....)
DATETIME(timestring, modifier, ....)
JULIANDAY(timestring, modifier, ....)
STRFTIME(timestring, modifier, ....)
```
```sql
SELECT Birthdate,
STRFTIME('%Y', Birthdate) AS Year,
STRFTIME('%m', Birthdate) AS Month,
STRFTIME('%d', Birthdate) AS Day
FROM employees
```
```sql
SELECT DATE('now')
SELECT STRFTIME('%Y %m %d', 'now')
SELECT STRFTIME('%H %M %S %s', 'now')
```
```sql
SELECT Birthdate,
STRFTIME('now' - Birthdate) as Age
From employees
```

## CASE
```sql
CASE <input_expression>
WHEN C1 THEN E1
WHEN C2 THEN E2
...
ELSE [result else]
END
```
Example
```sql
SELECT
trackid, name, bytes,
CASE
WHEN bytes < 3000 THEN 'small'
WHEN bytes >= 3000 AND bytes <5000 THEN 'medium'
ELSE 'Other'
END bytescategory
FROM
tracks;
```

## Views
```sql
CREATE [temp] VIEW [if not exists]
view_name (col_name_list)
AS
select-statement;
```

```sql
CREATE VIEW my_view
AS
SELECT
r.regiondescription,
t.territorydescription,
e.Lastname,
e.Firstname,
...
FROM Region r
INNER JOIN Terriroties t on r.regionid = t.regionid
INNER JOIN Employeeterritories et on t.TerrirtoryID = et.TerritoryID
INNER JOIN Employee e n et.employeid = e.EmployeeId

-- display
SELECT * FROM my view
DROP VIEW my_view
```
