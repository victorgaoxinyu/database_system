select Students.student_id, Students.student_name, Subjects.subject_name, IFNULL(table1.number, 0) as attended_exams
from Students
cross join Subjects
left join
(
select student_id, subject_name, count(*) number
from Examinations
group by 1,2
) table1
on Students.student_id = table1.student_id and Subjects.subject_name = table1.subject_name
order by Students.student_id, Subjects.subject_name