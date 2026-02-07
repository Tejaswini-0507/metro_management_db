---Calculate Ticket Expiry_Time

CREATE OR REPLACE FUNCTION calculate_expiry_time()
RETURNS TRIGGER AS $$
BEGIN
	NEW.expiry_time := NEW.issue_time + INTERVAL '2 hours';
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_expriy_time
BEFORE INSERT on tickets
FOR EACH ROW
EXECUTE FUNCTION calculate_expiry_time();

---Calculate Departure Time

CREATE OR REPLACE FUNCTION calculate_departure_time()
RETURNS TRIGGER AS $$
BEGIN  
	NEW.departure_time := NEW.arrival_time + INTERVAL '2 minutes';
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_departure_time
BEFORE INSERT on train_stops 
FOR EACH ROW
EXECUTE FUNCTION calculate_departure_time();

---Validates the status of the ticket

CREATE OR REPLACE FUNCTION validate_ticket_usage()
RETURNS TRIGGER AS $$
DECLARE 
	t_status ticket_status;
	t_expiry TIMESTAMP;
BEGIN
	--fetches the ticket status and expiry date
	SELECT status, expiry_time
	INTO t_status,t_expiry
	FROM tickets
	WHERE ticket_id = NEW.ticket_id;

	--if ticket does not exists
	IF t_status IS NULL THEN 
		RAISE EXCEPTION 'Invalid Ticket';
	END IF;
	
	--if ticket is already used
	IF t_status = 'USED' THEN
		RAISE EXCEPTION 'Ticket already used';
	END IF;

	--if ticket expired
	IF NOW() > t_expiry THEN
		UPDATE tickets
		SET status = 'EXPIRED'
		WHERE ticket_id = NEW.ticket_id;
		
		RAISE EXCEPTION 'Ticket expired';
	END IF;
	
	--mark ticket as USED after succesful entry
	UPDATE tickets 
	SET status = 'USED'
	WHERE ticket_id = NEW.ticket_id;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

 		
CREATE TRIGGER trg_change_ticket_status
BEFORE INSERT on transactions
FOR EACH ROW 
EXECUTE FUNCTION validate_ticket_usage();	