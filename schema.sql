------Station
CREATE TABLE station(
	station_id SERIAL NOT NULL PRIMARY KEY,
	station_name VARCHAR(100) NOT NULL UNIQUE
);

-------Routes
CREATE TABLE routes (
	route_id SERIAL PRIMARY KEY,
	source_station_id INT NOT NULL,
	destination_station_id INT NOT NULL,
	distance NUMERIC(6,2) NOT NULL,
	fare NUMERIC(5,2) NOT NULL,

	FOREIGN KEY (source_station_id) REFERENCES station(station_id),
	FOREIGN KEY (destination_station_id) REFERENCES station(station_id),

	CHECK (source_station_id <> destination_station_id),
	UNIQUE (source_station_id, destination_station_id)
);


------Trains
CREATE TABLE trains(
	train_id SERIAL PRIMARY KEY,
	train_name VARCHAR(100) NOT NULL UNIQUE,
	route_id INT NOT NULL,

FOREIGN KEY(route_id) REFERENCES routes(route_id)
);

------Train Index
CREATE INDEX idx_trains_route ON trains(route_id);


------Train_Stops
CREATE TABLE train_stops(
	stop_id SERIAL PRIMARY KEY,
	train_id INT NOT NULL,
	station_id INT NOT NULL,
 	platform_no INT NOT NULL,
	arrival_time TIMESTAMP NOT NULL,
	departure_time TIMESTAMP NOT NULL,

FOREIGN KEY(train_id) REFERENCES trains(train_id),
FOREIGN KEY(station_id) REFERENCES station(station_id),

CHECK(arrival_time < departure_time),
UNIQUE (train_id, station_id),
CHECK (platform_no > 0)
);

------Users--
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(150) NOT NULL,
	phone_number VARCHAR(10) NOT NULL,
	email VARCHAR(200) UNIQUE
);

------Ticket Status
CREATE TYPE ticket_status AS ENUM (
    'VALID',
    'USED',
    'EXPIRED'
);

------Tickets
CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	route_id INT NOT NULL,
	issue_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	expiry_time TIMESTAMP NOT NULL,
	status ticket_status NOT NULL DEFAULT 'VALID',
FOREIGN KEY (route_id) REFERENCES routes(route_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
CHECK (expiry_time > issue_time)
);

------Transactions
CREATE TABLE transactions(
	log_id SERIAL PRIMARY KEY,
	ticket_id INT NOT NU
	station_id INT NOT NULL,
	entry_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
FOREIGN KEY (station_id) REFERENCES station(station_id)
);
