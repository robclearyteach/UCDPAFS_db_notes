-- **Postgres**
--  See 'sql_SlideExamples03b.sql'
-- (Assuming created from previously)
-- (If not: Create the facilities/members/bookings
--          tables from the clubdata.sql
-- https://pgexercises.com/gettingstarted.html  
-- (@See link: 'download the SQL')



-- 1: After the table facilities and bookings
--    are created and some data inserted:
--    Experiment with a JOIN of the 
--    bookings and facilities table to see
--    what facilities are booked for each booking 


-- 1.b:
-- 	 To achieve the above, follow this tutorial:
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-joins/

-- (Recommend: experiment with creating the joins using 
--       a WHERE clause instead of the JOIN keyword)


-- 1.c
--	See and attempt a selection of exercises from:
--	* https://pgexercises.com/questions/basic/
--  * https://pgexercises.com/questions/updates/
--  * https://pgexercises.com/questions/joins/





-- ## ===================
-- ## **SQLITE**

-- 2: Create the same database tables from above in SQLite
--		(Recommend: make a note of all the steps you perform.)

-- 2.a Try out some JOIN's in SQLITE


-- 3: Using the DreamHome staff and branch tables
--    (See SlideExamples03b.sql for SQL)
--    Experiment with creating the tables where
--	  You specify TABLE constraints that you name
--    As opposed to the Column constraints currently used.
--	  Try In: SQLITE
--	  Try In: Postgres 


-- 4. Create a virtual environment in your working folder
--    e.g.
--    		py -m venv .venv
--    Activate it:
--    e.g.
--    		source ./.venv/Scripts/Activate
--          [Reminder:]
--			deactivate
--           [to deactivate it]
--	Once active:
--  pip install sqlalchemy
--
--  And then try this python example:
--  that assumes you have
--  a test.db file created at the
--  beginning of...
"""
from sqlalchemy import create_engine, text

connection_string = "sqlite:///test.db"
engine = create_engine(connection_string, echo=True)

with engine.connect() as conn:
    result = conn.execute( text("SELECT * FROM booking") )
    rows = result.all()

print(rows)
"""
