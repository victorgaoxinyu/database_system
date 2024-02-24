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

