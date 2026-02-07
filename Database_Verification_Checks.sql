-- Database Verification File
-- Project: Metro Management System
-- Purpose: Validate triggers, functions, and constraints


SELECT * FROM station;
SELECT * FROM routes;

-- Added a user
INSERT INTO users (user_name, phone_number, email)
VALUES ('Tejaswini', '8522896827', 'tejaswini5@gmail.com');

--Booked a ticket to route 6 i.e, source_station_id = Ameerpet 
-- destination_station_id = Miyapur
INSERT INTO tickets(user_id,route_id) VALUES(4,6);
INSERT INTO tickets(user_id,route_id) VALUES(4,6);
INSERT INTO tickets(user_id,route_id) VALUES(4,6);

-- above rows says that user_id booked 3 tickets to Miyapur from Ameerpet
-- To check Number of tickets a user bought
-- Here our user id is 4 so let's check how many number of tickets he bought 
SELECT COUNT(ticket_id) AS Number_of_tickets FROM tickets WHERE user_id = 4; 

--Herer user 4 uses uses all his tickets 
INSERT INTO transactions(ticket_id,station_id) VALUES(5,4);
-- Now we have used our ticket so let's check whterh out trigger is validating the ticket our not by inserting the same query again
INSERT INTO transactions(ticket_id,station_id) VALUES(5,4);
-- So if we try to insert it again then an error has been raised "Ticket already used"
INSERT INTO routes(source_station_id,destination_station_id,distance, fare) 
	VALUES (1,5,25,cal_fare(25));
--Let's check whether the new route has been inserted or not
SELECT * FROM routes;

-- If you want you can print like this using joins in very well format according to the user interface

SELECT s.station_name AS source_station , s1.station_name AS destination_station , r.distance AS Distance , r.fare AS Ticket_Price
FROM routes r 
JOIN station s ON r.source_station_id = s.station_id
JOIN station s1 ON r.destination_station_id = s1.station_id;

-- If we execute the above query then we can able to see source_station , destination_station , distance between them , and cost of the ticket

-- So mistake here was i've given distance for all routes = 45 which is a huge mistake so now i'm gonna update them 
UPDATE routes SET distance = 25 WHERE route_id = 2;
COMMIT
SELECT * FROM routes;

-- Now I'll put some distances to 35 
UPDATE routes SET distance = 35 WHERE route_id = 5;
COMMIT;
SELECT * FROM routes;

-- Now I'll out one routes distance as 10 
UPDATE routes SET distance = 10 WHERE route_id = 6;
COMMIT;
SELECT * FROM routes;

UPDATE routes SET fare = cal_fare(distance) WHERE route_id = 4;
COMMIT;
SELECT * FROM routes;

--Now we've updated the table let us recheck once are they accoridng to their distances  or not
SELECT * FROM routes ORDER BY route_id;
-- THis below line will update the fare after performing updation on distance (you must implement this and then commit after every update) 
-- This update is not required if trigger on distance update is enabled

UPDATE routes
SET fare = cal_fare(distance);
COmmit;
SELECT * FROM routes ORDER BY route_id;
