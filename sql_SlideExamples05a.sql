-- ## Taking Postgres sample database `dreamhome`

-- ## GROUP BY (ORDER BY recap)

SELECT * FROM propertyforrent;

SELECT postcode, type, rooms
FROM propertyforrent;

SELECT postcode, type, rooms
FROM propertyforrent
ORDER BY type;


-- Queries about...
-- Count of flats/houses

-- Count of flats 3 bed


SELECT type, COUNT(postcode)
FROM propertyforrent
GROUP BY type;

-- exploratory select
SELECT postcode, type, rooms
FROM propertyforrent

-- leads to
SELECT type, rooms, COUNT(rooms)
FROM propertyforrent
GROUP BY type, rooms


-- improved display
SELECT type, rooms, COUNT(rooms)
FROM propertyforrent
GROUP BY type, rooms
ORDER BY type, rooms;




-- Render.com postgres instance --
-- demo --






-- ## Taking Postgres sample database `dvdrental`
-- ## ER Diagram (.pdf) in .zip folder
-- ## Looking at: 

-- ## Relationship
-- ## Customer->0---||-Address


-- ## Cardinality
-- ##	MANY - look at the many
-- ## Customer (Many) 

SELECT customer_id, first_name, last_name, address.address_id, address
FROM 	customer INNER JOIN address
		ON
		customer.address_id = address.address_id
		
		
-- ## boils down to...
SELECT customer_id, address.address_id
FROM 	customer INNER JOIN address
		ON
		customer.address_id = address.address_id
	




-- ## observe the following...
dvdrental=# 
SELECT customer.customer_id, address.address_id, address.address
FROM customer RIGHT JOIN address
	ON
	customer.address_id = address.address_id
WHERE customer.customer_id IS NULL;






-- ## TASK:
-- ## Diagram:
--    Staff -||-----0|-Store
--    TASK: examine this for the next session


	
