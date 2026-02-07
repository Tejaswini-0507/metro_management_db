--Fare Calculation--
CREATE OR REPLACE FUNCTION cal_fare(distance DECIMAL)
RETURNS DECIMAL AS $$
DECLARE 
	fare DECIMAL;
BEGIN 
	IF distance > 50 THEN 
		fare := 45;
	ELSIF distance > 35 THEN
		fare := 35;
	ELSIF distance > 25 THEN
		fare := 25;
	ELSIF  distance > 15 THEN 
		fare := 15;
	ELSIF  distance > 10 THEN
		fare := 10;
	ELSE
		fare := 5;
	END IF;
	
	RETURN fare;
END;
$$ LANGUAGE plpgsql;

