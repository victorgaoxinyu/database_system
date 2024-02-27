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

### JOIN ON
- The importance of separate tables

```sql
SELECT id, SUM(payment) AS revenue
FROM food.fast_food a
JOIN food.transaction b
  ON a.id = b.restaurant_id
GROUP BY 1
```

```sql
select *
from tutorial.excel_sql_inventory_data a
join tutorial.excel_sql_transaction_data b
on a.product_id = b.product_id 
```

### INNER/LEFT/RIGHT/OUTER JOIN
- by default JOIN is INNER JOIN


### JOIN Practice
```sql
select count(DISTINCT user_id) from tutorial.playbook_users
```
- Using DISTINCT is slower than join

```sql
select * from tutorial.playbook_users a
left join tutorial.playbook_events b
on a.user_id = b.user_id and b.event_name = 'login'

-- is different from
select * from tutorial.playbook_users a
left join tutorial.playbook_events b
on a.user_id = b.user_id 
where event_name = 'login'  -- this will lose the purpose of left join
```
```sql
select count(DISTINCT b.user_id)*1.0 / COUNT(DISTINCT a.user_id) from tutorial.playbook_users a
left join tutorial.playbook_events b
on a.user_id = b.user_id and b.event_name = 'login'
```

```sql
SELECT
  num_logins,
  count(*) AS num_users
FROM
  (
    SELECT
      a.user_id,
      count(b.event_name) AS num_logins
    FROM
      tutorial.playbook_users a
      LEFT JOIN tutorial.playbook_events b ON a.user_id = b.user_id
      AND b.event_name = 'login'
    GROUP BY
      1
  ) table1
GROUP BY
  1

```

### WINDOW Function
- cumulative sum, running sum, rolling total

```sql
/* rolling sum */
SUM(minutes_meditated) OVER (ORDER BY timestamp) AS agg_minutes_medidated

/* by person_id */
SUM(minutes_meditated) OVER (PARTITION BY person_id ORDER BY timestamp) AS running_total
```

```sql
select * from 
(SELECT
  company_category_code,
  company_name,
  investor_name,
  raised_amount_usd,
  ROW_NUMBER() over (PARTITION by company_category_code order by raised_amount_usd desc) as rank
FROM
  tutorial.crunchbase_investments
where raised_amount_usd is not NULL
ORDER by company_category_code, raised_amount_usd DESC) ranking_table
where rank <= 5
```

```sql
select *,
sum(amount_usd) over (PARTITION by account_id order by occurred_at) as running_sum
from tutorial.orders
```
Create a pareto chart

```sql
SELECT
  ranking * 1.0 / total_accounts AS percent_accounts,
  running_sum / total_sum AS percent_revenue
FROM
  (
    SELECT
      *,
      sum(total_usd) over(
        ORDER BY
          total_usd DESC
      ) AS running_sum,
      sum(total_usd) over() total_sum,
      count(account_id) over () AS total_accounts,
      ROW_NUMBER() over (
        ORDER BY
          total_usd DESC
      ) AS ranking
    FROM
      (
        SELECT
          account_id,
          sum(amount_usd) AS total_usd
        FROM
          tutorial.orders
        GROUP BY
          1
      ) t
    ORDER BY
      total_usd DESC
  ) f
```

### Everything Else
```sql
CAST(user_id AS STRING)
CAST(user_id AS INT)

-- DATE and TIMESTAMP
TIMESTAMP
DATE
DATETIME
UNIX_TIMESTAMP(DATETIME)
CAST(DATE AS DATETIME)


-- STRING manipulation
CONCAT: Concatenate two or more strings into a single string
LENGTH: Get a length of a string
SUBSTRING: Extract a substring starting from a position with a specific length
TRIM: Remove unwanted characters from as string
LOWER/UPPER: 
