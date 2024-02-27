-- Which quiz generated the most views? What type of quiz is it?
select a.quiz_type, a.quiz_id, sum(b.num_views) from public.quiz_metadata a
join public.daily_agg_quiz_metrics b
on a.quiz_id = b.quiz_id
GROUP by 1, 2
order by sum desc

-- quiz_type   quiz_id  sum
-- personality 2504196	1613481

-- Which quiz has the highest completion rate? What type of quiz is it and when was it
-- published?
SELECT * 
FROM public.quiz_metadata a
JOIN 
(SELECT
  quiz_id,
  sum(num_completes) * 1.0 / sum(num_views) as completion_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY 1) table1
ON a.quiz_id = table1.quiz_id
order by completion_rate DESC

-- 2485469	5.1247 personality 1552243095

-- Which type of quiz generated the most views? What about on average, which type of
-- quiz generates the most views?

select * from public.quiz_metadata a
JOIN
(select quiz_id, sum(num_views) as view_sum from public.daily_agg_quiz_metrics
group by 1) table1
on a.quiz_id = table1.quiz_id
order by view_sum desc

-- personality 2504196	1613481

select quiz_type, AVG(view_sum) as avg_view from public.quiz_metadata a
JOIN
(select quiz_id, sum(num_views) as view_sum from public.daily_agg_quiz_metrics
group by 1) table1
on a.quiz_id = table1.quiz_id
GROUP by quiz_type
order by avg_view desc

-- quiz_type        avg_view
-- standard,poll	114241