-- Functions to input data

-- Create insert_customer function
CREATE OR REPLACE FUNCTION insert_customer(
	_customer_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR,
    _email VARCHAR,
    _phone_number VARCHAR,
    _address VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO customer (customer_id, first_name, last_name, email, phone_number, address)
    VALUES (_customer_id, _first_name, _last_name, _email, _phone_number, _address);
END;
$MAIN$
LANGUAGE plpgsql;

-- Insert data into customer table
SELECT insert_customer(1001,'Kenai', 'Epps', 'k.epps23@gmail.com', 
					   '770-123-4567', '123 Anywhere St, Sacramento CA 94563');
SELECT insert_customer(1002,'Michael', 'Smith', 'msmith1459@yahoo.com', 
					   '510-321-7658', '342 Rancho Cucamonga Blvd, Los Angeles CA 95687');
SELECT insert_customer(1003,'Christina', 'Timpleton', 'christinaiscool@gmail.com', 
					   '313-230-4566', '1245 Hollywood Blvd, Los Angeles CA 95689');
SELECT insert_customer(1004,'Jared', 'Jones', 'doublej24@online.com', 
					   '214-678-4446', '1099 Laredo Road, San Antonio, TX 78015');
SELECT insert_customer(1005,'Sherry', 'Jackson', 'sjackson85@gmail.com', 
					   '510-213-0089', '2042 Sunnyside Drive, Fremont, CA 95432');
SELECT insert_customer(1006,'Pat', 'Crenshaw', 'crenshawpat34@hotmail.com', 
					   '909-765-4487', '972 Rainbow Road, Chico, CA 93690');
					   
SELECT *
FROM customer;

-- Create add_car function
CREATE OR REPLACE FUNCTION insert_car_info(
	_car_id INTEGER,
    _dealership_serial VARCHAR,
    _make VARCHAR,
    _model VARCHAR,
    _year INTEGER,
    _color VARCHAR,
	_mileage INTEGER,
	_vin VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO car (car_id, dealership_serial,  make, model, year, color, mileage, vin)
    VALUES (_car_id, _dealership_serial, _make, _model, _year, _color, _mileage, _vin);
END;
$MAIN$
LANGUAGE plpgsql;

-- Insert data into car table
SELECT insert_car_info(2000, 'CA1200', 'Dodge', 'Ram 2500', 2000, 
					  'Green', 100256,'3B7KF2363YG116285');
SELECT insert_car_info(2001, 'None', 'Mercedes', 'Benz E Class', 2017, 
					  'Green', 57845,'WDBJF65J1YB039105');
SELECT insert_car_info(2002, 'None', 'Lexus', 'IS 350C', 2010, 
					  'Green', 57845,'JTHFE2C24A2504933');
SELECT insert_car_info(2003, 'CA1201', 'Subaru', 'Forester', 2013, 
					  'Green', 57845,'JF2SHADC3DG417185');
SELECT insert_car_info(2004, 'CA1202', 'Honda', 'Accord', 2023, 
					  'Red', 12,'1HGCG2254WA015540');
SELECT insert_car_info(2005, 'CA1203', 'Chevrolet', 'Silverado', 2023, 
					  'White', 25,'1GBJK34G32E254979');
					  
-- Update values because i messed some up
UPDATE car
SET color ='Blue'
WHERE car_id = 2001;

UPDATE car
SET mileage = 4330
WHERE car_id = 2001;

UPDATE car
SET color ='Orange'
WHERE car_id = 2002;

UPDATE car
SET mileage = 67984
WHERE car_id = 2002;

UPDATE car
SET color ='Silver'
WHERE car_id = 2003;

UPDATE car
SET mileage = 19003
WHERE car_id = 2003;

					  
SELECT * 
FROM car;


-- Create salesperson function
CREATE OR REPLACE FUNCTION add_salesperson(
	_salesperson_id INTEGER,
   	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO salesperson (salesperson_id, first_name, last_name)
    VALUES (_salesperson_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- Add values to salesperson
SELECT add_salesperson(9000, 'Keith', 'Hamilton');
SELECT add_salesperson(9001, 'Mary', 'Finkle');
SELECT add_salesperson(9002, 'Bill', 'Thomas');
SELECT add_salesperson(9003, 'Laura', 'Guiterrez');

SELECT *
FROM salesperson;


-- Create car sale invoice function
CREATE OR REPLACE FUNCTION insert_car_sale(
	_invoice_id INTEGER,
    _date_sold DATE,
    _car_id INTEGER,
    _customer_id INTEGER,
   	_salesperson_id INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO car_sale_invoice (invoice_id, date_sold, car_id, customer_id, salesperson_id)
    VALUES (_invoice_id, _date_sold, _car_id, _customer_id, _salesperson_id);
END;
$MAIN$
LANGUAGE plpgsql;

-- Add values to car sale invoice
SELECT insert_car_sale(8000, '2023-03-09', 2000, 1001, 9000);
SELECT insert_car_sale(8001, '2022-11-15', 2004, 1005, 9003);
SELECT insert_car_sale(8003, '2023-09-01', 2005, 1003, 9002);


-- Updating car_id in this table
UPDATE car_sale_invoice
SET car_id = 2001
WHERE invoice_id = 8001;


UPDATE car_sale_invoice
SET car_id = 2003
WHERE invoice_id = 8002;

DELETE from car_sale_invoice
WHERE invoice_id = 8003;

DELETE from car_sale_invoice
WHERE invoice_id = 8001;

SELECT *
FROM car_sale_invoice;

-- Adding mechanic function
CREATE OR REPLACE FUNCTION add_mechanic(
	_mechanic_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO mechanic (mechanic_id, first_name, last_name)
    VALUES (_mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- Adding mechanics
SELECT add_mechanic (7000, 'Norman', 'Green');
SELECT add_mechanic (7001, 'Adrian', 'Love');
SELECT add_mechanic (7002, 'Jessie', 'Delgado');
SELECT add_mechanic (7003, 'Cody', 'Burke');
SELECT add_mechanic (7004, 'Amirah', 'Mckenzie');

SELECT *
FROM mechanic;

-- Adding services function
CREATE OR REPLACE FUNCTION add_services(
	_service_id INTEGER,
    _service_name VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO services (service_id, service_name)
    VALUES (_service_id, _service_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- Adding services
SELECT add_services (6000, 'Oil Change');
SELECT add_services (6001, 'Tire Rotation');
SELECT add_services (6002, 'Coolant Flush');
SELECT add_services (6003, 'Tune Up');
SELECT add_services (6004, 'AC Service');
SELECT add_services (6005, 'Vehicle Inspection');

SELECT *
FROM services;

-- adding service invoice function
CREATE OR REPLACE FUNCTION add_service_invoice(
	_service_invoice_id INTEGER,
    _car_id INTEGER,
	_dealership_serial BOOLEAN,
	_arrival_date DATE,
	_service_comments VARCHAR,
	_pickup_date DATE
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO service_invoice (service_invoice_id, car_id, dealership_serial, arrival_date,
								 service_comments, pickup_date)
    VALUES (_service_invoice_id, _car_id, _dealership_serial, _arrival_date, _service_comments,
			_pickup_date);
END;
$MAIN$
LANGUAGE plpgsql;

-- Adding service invoices
SELECT add_service_invoice(4000,2000,TRUE,'2023-07-03','Car needs a routine oil change.','2023-07-07');
SELECT add_service_invoice(4001,2000,TRUE,'2023-08-06','Routine tire rotation.','2023-08-06');
SELECT add_service_invoice(4002,2001,FALSE,'2021-10-23','Customer stated they needed an annual inspection.',
						   '2021-10-23');
SELECT add_service_invoice(4003,2002,FALSE,'2022-05-09','Customer needed AC repair.',
						   '2022-05-12');

SELECT *
FROM service_invoice;

-- adding part used function
CREATE OR REPLACE FUNCTION add_part_used(
	_partused_id INTEGER,
	_service_invoice_id INTEGER,
	_price NUMERIC(6,2)
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO part_used (partused_id, service_invoice_id, price)
    VALUES (_partused_id, _service_invoice_id, _price);
END;
$MAIN$
LANGUAGE plpgsql;

-- Adding parts used
SELECT add_part_used(300, 4000, 59.99);
SELECT add_part_used(303, 4000, 64.99);
SELECT add_part_used(301, 4003, 199.99);
SELECT add_part_used(302, 4003, 40.99);

SELECT *
FROM part_used;

-- Adding service mechanic function
CREATE OR REPLACE FUNCTION add_service_mechanic(
	_service_mechanic_id INTEGER,
	_service_invoice_id INTEGER,
	_mechanic_id INTEGER,
	_mechanic_hours INTEGER,
	_service_id INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO service_mechanic (service_mechanic_id, service_invoice_id, mechanic_id,
								 mechanic_hours, service_id)
    VALUES (_service_mechanic_id, _service_invoice_id, _mechanic_id, _mechanic_hours, _service_id);
END;
$MAIN$
LANGUAGE plpgsql;

-- Adding service mechanics
SELECT add_service_mechanic(700, 4000,7000,3,6000);
SELECT add_service_mechanic(701, 4001,7001,3,6001);
SELECT add_service_mechanic(702, 4002,7002,2,6004);
SELECT add_service_mechanic(703, 4002,7003,2,6004);

SELECT *
FROM service_mechanic;

--is_serviced column
ALTER TABLE car
ADD column is_serviced BOOLEAN;

SELECT *
FROM car;

--Update purchased vehicle's service boolean if it comes in for an oil change but had not
--received service before

CREATE OR REPLACE PROCEDURE update_is_serviced_status(
	_car_id INTEGER
)
AS $$
BEGIN
	IF NOT EXISTS(SELECT 2005 FROM service_invoice WHERE service_invoice.car_id= _car_id) THEN
		UPDATE car
		SET is_serviced = TRUE
		WHERE car.car_id = _car_id;
	END IF;
END;
$$ LANGUAGE plpgsql;

CALL update_is_serviced_status(2005);

-- Testing procedure to see if it added true
SELECT *
FROM car 
WHERE car_id = 2005;

SELECT *
FROM car;
	
	

	


