--Diego Hernandez

--Creating customer table first because it has a primary key that is referenced in the car, invoice table
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_num VARCHAR(15)
);

--Creating car table second because invoice, ticket, and salesperson reference its primary key
CREATE TABLE car (
    car_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    make VARCHAR(20),
    model VARCHAR(25),
    year INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

--Creating salesperson because invoice references its primary key
CREATE TABLE salesperson (
    staff_id SERIAL PRIMARY KEY,
    car_id INTEGER NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
    FOREIGN KEY(car_id) REFERENCES car(car_id)
);

--Creating invoice table because it has a primary key
CREATE TABLE invoice (
    invoice_id SERIAL PRIMARY KEY,
    staff_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    amount NUMERIC(8,2),
    FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

--Creating ticket because it also has a primary key
CREATE TABLE ticket (
    ticket_id SERIAL PRIMARY KEY,
    car_id INTEGER NOT NULL,
    serivice_desc VARCHAR(1000),
    service_cost NUMERIC(8,2),
    FOREIGN KEY(car_id) REFERENCES car(car_id)
);

--Creating mechanic because it also has a primary key
CREATE TABLE mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

--Creating part table last because it doesnt have a primary key
CREATE TABLE part (
    ticket_id INTEGER NOT NULL,
    part_name VARCHAR(150),
    part_cost NUMERIC(5,2)
);
