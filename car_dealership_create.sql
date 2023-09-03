CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255),
    address VARCHAR(255)
);


CREATE TABLE Car (
    car_id SERIAL PRIMARY KEY,
    dealership_serial VARCHAR(255),
    make VARCHAR(255),
    model VARCHAR(255),
    year INT,
    color VARCHAR(255),
    mileage INT,
    vin VARCHAR(17) 
);


CREATE TABLE Salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);


CREATE TABLE Services (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(255)
);


CREATE TABLE Mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);



CREATE TABLE Service_Invoice (
    service_invoice_id SERIAL PRIMARY KEY,
    car_id INT REFERENCES Car(car_id),
    dealership_serial VARCHAR(255),
    arrival_date DATE,
    service_comments TEXT,
    pickup_date DATE
);

CREATE TABLE Car_Sale_Invoice (
    invoice_id SERIAL PRIMARY KEY,
    date_sold DATE,
    car_id INT REFERENCES Car(car_id),
    customer_id INT REFERENCES Customer(customer_id),
    salesperson_id INT REFERENCES Salesperson(salesperson_id)
);


CREATE TABLE Service_Mechanic (
    service_mechanic_id SERIAL PRIMARY KEY,
    service_invoice_id INT REFERENCES Service_Invoice(service_invoice_id),
    mechanic_id INT REFERENCES Mechanic(mechanic_id),
    mechanic_hours DECIMAL(5, 2),
    service_id INT REFERENCES Services(service_id)
);


CREATE TABLE Part_Used (
    partUsed_id SERIAL PRIMARY KEY,
    service_invoice_id INT REFERENCES Service_Invoice(service_invoice_id),
    price DECIMAL(10, 2)
);

