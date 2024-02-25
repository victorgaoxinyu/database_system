## SELECT and FROM
```sql
SELECT
  date as ddate,
  open as price,
FROM
  tutorial.aapl_historical_stock_price
```

## WHERE and LIMIT

order of clauses:

```sql
SELECT [cols]
FROM [table name]
WHERE [conditions]
LIMIT [number]
```

### Comparison Operators

```
= != > < >= <=
  <>

```

## LIKE and ILIKE
- LIKE <- case sensitive
- ILIKE <- not case sensitive
```sql
SELECT *
FROM food.fast_food
WHERE name LIKE 'Burger%' -- % is wildcard
```

## IN
```sql
SELECT *
FROM food.fast_food
WHERE name IN ('Taco Bell', 'Subway', 'KFC')
```

## IS NULL
```sql
SELECT *
FROM food.fast_food
WHERE sanity_rating IS NULL -- IS NOT NULL
```

## ORDER BY
```sql
SELECT *
FROM food.fast_food
ORDER BY revenue DESC
```
```sql
SELECT
  CAST(SPLIT_PART(date, '/', 2) as INT) as day, *
FROM
  tutorial.aapl_historical_stock_price
WHERE
  OPEN IS NOT NULL
ORDER BY year, month, day ASC
```

### Assignment_filtering
```sql
SELECT
  *
FROM
  public.daily_agg_quiz_metrics
WHERE
  quiz_id IN (
    SELECT
      quiz_id
    FROM
      public.quiz_metadata
    WHERE
      quiz_type = 'image checklist'
  )
ORDER BY
  date DESC
```
```sql
select SUM(num_views) from public.daily_agg_quiz_metrics where quiz_id = '2557125'

select * from public.daily_agg_quiz_metrics order by num_views DESC
```

### Aggregation Functions

- COUNT
- SUM
- MIN/MAX
- AVG

```sql
SELECT COUNT(1), SUM(revenue)
FROM food.fast_food
WHERE name ILIKE '%pizza%'
```

### GROUP BY
```sql
SELECT type, SUM(revenue)
FROM food.fast_food
GROUP BY type

SELECT type, SUM(revenue)
FROM food.fast_food
GROUP BY 1

```

### HAVING

- `WHERE` only works on row level, cannot work on aggregated level
- `HAVING` is to filter the query, aggregated rows.

```sql
SELECT type, SUM(revenue)
from food.fast_food
GROUP BY type
HAVING SUM(revenue) > 1000000
```



```sql
SELECT
  category,
  COUNT(1) AS count
FROM
  tutorial.sf_crime_incidents_2014_01
GROUP BY
  category
HAVING
  count(1) < 10
```

### DISTINCT

```sql
SELECT DISTINCT city_origin
FROM food.fast_food
WHERE type = 'burger'
```

```sql
SELECT
  company_name,
  count(1) AS investment_count
FROM
  tutorial.crunchbase_investments
GROUP BY
  1
ORDER BY
  investment_count DESC
```

```sql
select count(*) from (
select DISTINCT company_name, investor_name from tutorial.crunchbase_investments
) table1
```

```sql
select company_name, investor_name, COUNT(1) from tutorial.crunchbase_investments GROUP by 1, 2 order by 3 desc
```



### CASE WHEN ... THEN ... ELSE ... END

```sql
SELECT
  CASE
    WHEN weight > 250 THEN 'heavyweight'
    WHEN weight > 200 THEN 'middleweight'
    WHEN weight > 175 THEN 'lightweight'
    ELSE 'featherweight'
  END AS weight_class,
  COUNT(1)
FROM
  benn.college_football_players
GROUP BY weight_class
```

### UNION

- each union query must have the same number of columns
- UNION only append distinct rows, use UNION ALL to keep all

```sql
SELECT
  school_name,
  count(1) AS num_players
FROM
  benn.college_football_players
WHERE
  school_name = 'UC Davis'
  OR school_name = 'Nevada'
GROUP BY
  1
UNION
SELECT
  school_name,
  count(1) AS num_players
FROM
  benn.college_football_players
WHERE
  school_name = 'Texas State'
  OR school_name = 'Holy Cross'
GROUP BY
  1
```



