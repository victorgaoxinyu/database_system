/* Which device type generates the most views? */
SELECT
  device_type,
  sum(num_views)
FROM
  public.daily_agg_quiz_metrics
GROUP BY 1
ORDER BY 2 desc

-- device_type	sum
-- desktop	68442083
-- mobile	68193244
-- tablet	8167154


/* Are there specific days where another device type generates more views than the
device from the answer above? */

SELECT
  date,
  device_type,
  sum(num_views)
FROM
  public.daily_agg_quiz_metrics
GROUP BY 1, 2
ORDER BY 3 desc


/* Which device type has the highest completion rate? Why do you think that is? */

SELECT
  device_type,
  sum(num_completes) / sum(num_views) as completion_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY 1
ORDER BY 2 desc

/* Which device type has the highest share rate? Why do you think that is? */

SELECT
  device_type,
  sum(num_shares) / sum(num_views) as share_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY 1
ORDER BY 2 desc

/* Which day had to most views? */

SELECT
  date,
  sum(num_views)
FROM
  public.daily_agg_quiz_metrics
GROUP BY 1
ORDER BY 2 desc

/* visualisation tasks */ 
SELECT
  quiz_type,
  sum(num_questions)
FROM
  public.quiz_metadata
GROUP BY
  quiz_type
  
select date, sum(num_views) from public.daily_agg_quiz_metrics
group by 1

select device_type, sum(num_completes) / sum(num_views) as completion_rate, 
sum(num_shares) / sum(num_views) as share_rate
from public.daily_agg_quiz_metrics
GROUP by 1
