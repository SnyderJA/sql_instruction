
-- Select all attributes from the enrolled table
SELECT * from enrolled;

-- Select all attributes from the enrolled table
Select * from student;

-- Select all attributes from the enrolled table
Select * from course;

-- Triple inner join on all three tables by attribute
Select ssnLastFour, firstName, lastName, courseId, subject, name, grade
	from student s
    inner join enrolled e
    on s.id = e.studentID
    inner join course c
    on c.id = e.courseid;
    
-- Triple join on all three tables for all attributes
Select *
	from student s
    inner join enrolled e
    on s.id = e.studentID
    inner join course c
    on c.id = e.courseid;

-- Inner join on Student and enrolled tables
Select firstName, lastName, courseID, grade
	from student s
    inner join  enrolled e
    on s.id = e.studentID;
    
-- Inner join on Course and Enrolled tables
Select studentID, subject, name, grade
	from course c
    inner join  enrolled e
    on c.id = e.courseID;
    
-- Counting how many students are enrolled in each course
Select name 'Course Name', subject 'Subject', 
	count(*) 'Enrollees'
	from course c
	inner join enrolled e
	on c.id = e.courseID
	Group By name, subject
	Order By Count(*) Desc;


-- Listing distinct subjects in course table and showing counts for each
Select distinct subject, 
	count(*) 'Enrollees'
	from course c
    inner join enrolled e
    on c.id = e.courseID
    group by subject
    order by Count(*) Desc;
    
    