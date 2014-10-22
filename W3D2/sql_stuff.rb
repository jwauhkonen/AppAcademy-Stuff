SELECT DISTINCT
a.num, a.company, transfer.name, d.num, d.company
FROM
  route a
  JOIN
  route b
  ON
  a.num = b.num AND a.company = b.company 
    JOIN
	  route c
	ON
	  c.stop = b.stop 
	JOIN
	route d
	ON 
	c.num = d.num AND c.company = d.company
	JOIN
	stops start
	ON 
	start.id = a.stop
	JOIN
	stops transfer
	ON
	c.stop = transfer.id
	JOIN stops end
	ON end.id = d.stop
	WHERE start.name = 'Craiglockhart'
	AND
	end.name = 'Sighthill'
	ORDER BY 
	start.name 