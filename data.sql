--Stations--
INSERT INTO station(station_name) VALUES
	('Gachibowli'),
	('MG bus station'),
	('LB Nagar'),
	('Ameerpet'),
	('Miyapur');

SELECT * FROM station;

--ROUTES
INSERT INTO 
	routes(source_station_id,
			destination_station_id,
			distance,fare)
VALUES
	(1,2,45,cal_fare(45)),
	(1,3,45,cal_fare(25)),
	(2,1,45,cal_fare(45)),
	(2,3,45,cal_fare(15)),
	(3,1,45,cal_fare(25)),
	(4,5,45,cal_fare(15));

SELECT * FROM routes;

--USERS

INSERT INTO 
	users(user_name,phone_number,email)
VALUES
	('Ravi Kumar', '9876543210', 'ravi@gmail.com'),
	('Anita Sharma', '9876543211', 'anita@gmail.com'),
	('Suresh Reddy', '9876543212', 'suresh@gmail.com');

SELECT * FROM users;

--TRAINS

INSERT INTO 
	trains(train_name,route_id)
VALUES 
	('Blue Line Express', 1),
	('Green Line Rapid', 2),
	('Red Line Metro', 3);

SELECT * FROM trains;

--TRAIN STOPS 

INSERT INTO 
	train_stops(train_id
				,station_id
				,platform_no
				,arrival_time)
VALUES
	(1, 1, 1, '2026-02-07 10:00:00'),
	(1, 2, 2, '2026-02-07 10:30:00'),
	(2, 1, 3, '2026-02-07 11:00:00'),
	(3, 2, 1, '2026-02-07 11:30:00');

SELECT * FROM train_stops;

--TICKETS
INSERT INTO tickets(user_id,route_id)
VALUES
	(1,1),
	(1,1),
	(2,2),
	(3,3);

SELECT * FROM tickets;

--Transactions
INSERT INTO transactions (ticket_id, station_id)
VALUES (1, 1);

SELECT * FROM transactions;


