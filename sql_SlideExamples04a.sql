
psql -U postgres
postgres=#
postgres=#\l

--then quit
postgres=#\q


psql -U postgres -d dvdrental

-- See prompt
dvdrental=#

-- then quit
dvdrental=#\q


-- ## %%
psql -U postgres
postgres=#



SELECT CURRENT_USER:

SELECT current_database();
SELECT current_schema();





CREATE DATABASE play_schema;


CREATE SCHEMA sales;					

CREATE TABLE staff(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);


SELECT * FROM staff;



-- ## TASK: will this work
SELECT * FROM sales.staff;  -- fails: why?

-- ## Try: 
SELECT * FROM public.staff;  




-- ## So:
-- ## Check understanding

CREATE TABLE test(
	id SERIAL PRIMARY KEY,
	test varchar(30)
);

-- show/see where created in pgAdmin


CREATE TABLE sales.test(
	id SERIAL PRIMARY KEY,
	test varchar(30)
);

-- show/see where created in pgAdmin





-- ## TASK:
-- ## Insert 'sales test' into sales.test table
-- ##  & 'public test' into public.test table
-- ## THEN: select * from each table

INSERT INTO public.test(test) 
VALUES ('public data');

INSERT INTO sales.test(test) 
VALUES ('sales data');


SELECT * FROM public.test;

SELECT * FROM sales.test;




-- ## DEMO
SELECT *
FROM pg_catalog.pg_namespace
ORDER BY nspname;






-- ## %% CREATE USER
psql -U postgres
postgres=#

\du

CREATE ROLE bob;

SELECT rolname FROM pg_roles;



\du





CREATE ROLE alice
WITH LOGIN 
PASSWORD 'alice1';




SELECT rolname, rolcanlogin FROM pg_roles WHERE rolname = 'alice';



-- \\ psql client
postgres=# \q

psql -U alice
Password: >alice1



-- ## SEE error
psql: error: connection to server at "localhost" (::1), port 5432 failed: FATAL:  database "alice" does not exist

-- BY default psql tries to log 'alice' into db 'alice'
-- (as it does with '-U posgres' into db 'postgres' which works)

-- ## TRY:
psql -U alice -d postgres

-- ## see logged-in now with prompt
postgres=>





-- ## ROLE permission DEFAULT  none 
-- ## TRY:
postgres=> CREATE DATABASE testAliceCreateDB;
-- ERROR:  permission denied to create database



-- ## default permission none doesn't include CREATEDB permission
postgres=> \q


psql -U postgres
=# ALTER ROLE alice WITH CREATEDB;
ALTER ROLE


postgres=# \c postgres alice


postgres=> \du
 
postgres=> CREATE DATABASE testNow;
CREATE DATABASE

postgrs=> \l




postgres=> DROP DATABASE xyz;
ERROR:  must be owner of database xyz
postgres=>



ALTER ROLE alice VALID UNTIL '2026-03-03 20:30:00';










CREATE USER testuser PASSWORD 'test123';
postgres=#\du
-- see user created

--then quit
postgres=#\q

-- ## cmd:
-- psql -U testuser
-- ...password: test123
--
-- SEE ERROR
-- 	psql: error: connection to server at "localhost" (::1), port  failed: FATAL:  
--  password authentication  user "testuser"






-- ## %%
-- ## cmd
psql -U postgres
postgres=#

-- ## connect to dvdrental
postgres=#\c dvdrental

-- ## from this "context"
-- ## GRANT permissions
GRANT SELECT ON ALL TABLES IN SCHEMA public to testuser;

--then quit
postgres=#\q

-- ## cmd:
psql -U testuser -d dvdrental

-- ## dvdrental=> 
SELECT * FROM staff;

-- ## dvdrental=> 
UPDATE staff SET first_name = 'Michael' where first_name = 'Mike';
--see error
ERROR:  permission denied for table staff


-- ## dvdrental=> 
\c postgres
\dt
\l

-- ## but...
postgres=> select * from booking;
-- see error
ERROR:  permission denied for table booking



-- ## %%
-- ## python to postgres
-- ## with psycopg2 adapter
-- ## follow sequence within...
-- test_psycopg2.ipynb

-- ## %%
-- ## GRANT UPDATE
GRANT UPDATE ON staff TO testuser;


-- ## %%
-- ## Test with psql
\c dvdrental testuser


-- ## dvdrental=> 
SELECT * FROM staff;

UPDATE staff SET first_name = 'Michael' where first_name = 'Mike';
SELECT * FROM staff;


-- ## 'rollback' concept (manually)
UPDATE staff SET first_name = 'Mike' where first_name = 'Michael';
SELECT * FROM staff;



-- ## %%
-- ## Revert back to Python .ipynb file demo



















