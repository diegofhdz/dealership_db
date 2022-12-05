--Diego Hernandez
--SQL to insert data

CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone_num VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO customer(customer_id,first_name,last_name,phone_num)
	VALUES(_customer_id, _first_name, _last_name, _phone_num);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(1, 'Diego', 'Hernandez', '123-4556-7890');

CREATE OR REPLACE FUNCTION add_car(_car_id INTEGER, _customer_id INTEGER, _make VARCHAR, _model VARCHAR, _year INTEGER)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO car(car_id, customer_id, make, model, year)
	VALUES(_car_id, _customer_id, _make, _model, _year);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(1, 1, 'Toyota', 'Supra', 1993);