select * 
	from customer 
-- single line comment
-- where state = 'OH' 
-- or state = 'IN'
-- another single line comment
where state in ('OH', 'IN')
Order by name;
