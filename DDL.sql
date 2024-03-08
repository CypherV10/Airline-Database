set search_path to public;
/* DROP statements to clean up objects from previous run */
-- Triggers
DROP TRIGGER IF EXISTS aa1_trig ON airport_airline;
DROP TRIGGER IF EXISTS tail_no_trig ON airplane;
DROP TRIGGER IF EXISTS fleet_trig ON airplane;
DROP TRIGGER IF EXISTS airline_code_trig ON airline;
DROP TRIGGER IF EXISTS alliance_code_trig ON air_alliance;
DROP TRIGGER IF EXISTS airport_code_trig ON airport;

-- Sequences
DROP SEQUENCE IF EXISTS alliance_seq;
DROP SEQUENCE IF EXISTS airline_seq;
DROP SEQUENCE IF EXISTS airport_code_seq;
DROP SEQUENCE IF EXISTS tail_no_seq;
DROP SEQUENCE IF EXISTS aa_seq;

-- Views
DROP VIEW IF EXISTS airplaneinfo;
DROP VIEW IF EXISTS routeinfo;

-- Drop the existing schema if it exists
DROP SCHEMA IF EXISTS airdb CASCADE;

-- Create a new schema with the same name (Run this first time)
CREATE SCHEMA airdb;

set search_path to airdb;

-- Tables
DROP TABLE IF EXISTS airplane CASCADE;
DROP TABLE IF EXISTS airline CASCADE;
DROP TABLE IF EXISTS air_alliance CASCADE;
DROP TABLE IF EXISTS passenger CASCADE;
DROP TABLE IF EXISTS city CASCADE;
DROP TABLE IF EXISTS airport CASCADE;
DROP TABLE IF EXISTS airport_airline CASCADE;

/* Create tables based on entities */
--Creation of Airport Table
CREATE TABLE airport (
   airport_code 	VARCHAR(10) PRIMARY KEY NOT NULL,
   airport_name 	VARCHAR,
   no_of_terminals 	INT,
   age 				INT,
   capacity 		INT
);
--Creation of City Table
CREATE TABLE City (
	city_name 		varchar(50) NOT NULL,
	fk_airport_code varchar		NOT NULL,
	country 		varchar(50),
	area 			int,
	foundation_date date,
	population 		int,
	PRIMARY KEY		(city_name, fk_airport_code),
	FOREIGN KEY 	(fk_airport_code) 	REFERENCES airport(airport_code),
	CONSTRAINT UC_City_City_Name UNIQUE (City_name)
);
--Creation of Passenger Table
CREATE TABLE Passenger (
	passport_no varchar(9) PRIMARY KEY NOT NULL,
	fname char(100),
	lname char(100),
	age int,
	gender char(20),
	citizenship char(20)
);
--Creation of Air_Alliance Table
CREATE TABLE Air_Alliance (
	Alliance_Code		VARCHAR(10)	NOT NULL,	
	Alliance_Name		VARCHAR(40) NOT NULL,
	Founding_Airline	VARCHAR(50) NOT NULL,
	Age					INTEGER 	NOT NULL,
	No_of_Members		INTEGER		NOT NULL,
	City_Name			VARCHAR(50)	NOT NULL,
	CONSTRAINT PK_Air_Alliance		PRIMARY KEY (Alliance_Code),
	FOREIGN KEY (city_name) REFERENCES City (city_name)	
);
--Creation of Airline Table
CREATE TABLE Airline (
	Airline_Code		VARCHAR(7)	NOT NULL,	
	Airline_Name		VARCHAR(40) NOT NULL,
	Country 			VARCHAR(50) NOT NULL,
	Age					INTEGER 	NOT NULL,
	Airline_Fleet_Size  INTEGER		NOT NULL,
	Alliance_Code		VARCHAR(10),
	CONSTRAINT PK_Airline			PRIMARY KEY (Airline_Code),
	FOREIGN KEY (Alliance_Code) REFERENCES Air_Alliance		
);
-- Creation of Airplane Table
CREATE TABLE Airplane (
    Tail_No         VARCHAR(10)     NOT NULL,
    Airline_Code    VARCHAR(7)      NOT NULL,
    Manufacturer    VARCHAR(50)     NOT NULL,
    Model           VARCHAR(50)     NOT NULL,
    Airplane_Age    INTEGER         NOT NULL,
    Capacity        INTEGER         NOT NULL,
	PRIMARY KEY		(Tail_No, Airline_Code),
    FOREIGN KEY (Airline_Code) REFERENCES Airline(Airline_Code)
);
--Creation of Airport_Airline Bridge Table
CREATE TABLE airport_airline (
	ROUTE 			INT			PRIMARY KEY,
	airport_code varchar(10),
	airline_code varchar(7),
	FOREIGN KEY (airport_code) REFERENCES airport(airport_code),
	FOREIGN KEY (airline_code) REFERENCES airline(airline_code)
);

/* Create Sequences */
--Creating Sequence for Airport_Code
CREATE SEQUENCE airport_code_seq
START 100
INCREMENT 1;
--Creating Sequence for Air_Alliance_Code
CREATE SEQUENCE alliance_seq
start with 100
increment by 100;
--Creating Sequence for Airline_Code
CREATE SEQUENCE airline_seq
start with 101
increment by 10;
--Creating Sequence for Tail_No
CREATE SEQUENCE tail_no_seq
START WITH 1001
INCREMENT BY 1;
--Creating Sequence for Airport_Airline_Seq
CREATE SEQUENCE aa_seq
START WITH 1
INCREMENT BY 1;

/*Create Triggers*/
--Creating trigger for Airport_Code
--Function
CREATE OR REPLACE FUNCTION airport_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
   NEW.airport_code = 'ARPT' || nextval('airport_code_seq');
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Trigger
CREATE TRIGGER airport_code_trig
BEFORE INSERT ON airport
FOR EACH ROW
EXECUTE FUNCTION airport_insert_trigger();
--Creating trigger for alliance_code
--Function
CREATE OR REPLACE FUNCTION alliance_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
	NEW.alliance_code = 'ALL'||nextval('alliance_seq');
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--Trigger
CREATE TRIGGER alliance_code_trig
BEFORE INSERT ON Air_Alliance
FOR EACH ROW
EXECUTE FUNCTION alliance_insert_trigger();
--Creating Function and trigger for airline_code
CREATE OR REPLACE FUNCTION airline_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
	NEW.airline_code = 'AIR'||nextval('airline_seq');
	--Updating Air_Alliance Table
	IF NOT EXISTS (SELECT FROM Air_Alliance WHERE NEW.airline_name=Air_Alliance.Founding_Airline) THEN
		UPDATE Air_Alliance
		SET No_of_Members=No_of_Members+1
		WHERE NEW.alliance_code=Air_Alliance.alliance_code;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--Trigger
CREATE TRIGGER airline_code_trig
BEFORE INSERT ON Airline
FOR EACH ROW
EXECUTE FUNCTION airline_insert_trigger();

--Create function for Tail_No
CREATE OR REPLACE FUNCTION airplane_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
    new.tail_no = 'TN' || nextval('tail_no_seq');
	--Updating Airline Table
		UPDATE Airline
		SET Airline_Fleet_size=Airline_Fleet_size+1
		WHERE NEW.airline_code=Airline.airline_code;
	RETURN new;
END;
$$ LANGUAGE plpgsql;
--Trigger
CREATE TRIGGER tail_no_trig
BEFORE INSERT ON Airplane
FOR EACH ROW
EXECUTE FUNCTION airplane_insert_trigger();

--Creating Function and Trigger for Deleting Airplane Entry
CREATE OR REPLACE FUNCTION airplane_delete_trigger()
RETURNS TRIGGER AS $$
BEGIN
   	--Updating Airline Table
		UPDATE Airline
		SET Airline_Fleet_size=Airline_Fleet_size-1
		WHERE OLD.airline_code=Airline.airline_code;
	RETURN OLD;
END;
$$ LANGUAGE plpgsql;
--Trigger
CREATE TRIGGER fleet_trig
BEFORE DELETE ON Airplane
FOR EACH ROW
EXECUTE FUNCTION airplane_delete_trigger();

--Creating Function and Trigger for Deleting Airline Entry
CREATE OR REPLACE FUNCTION airline_delete_trigger()
RETURNS TRIGGER AS $$
BEGIN
   	--Updating Air_Alliance Table
		UPDATE Air_Alliance
		SET No_of_Members=No_of_Members-1
		WHERE OLD.alliance_code=Air_Alliance.Alliance_code;
	RETURN OLD;
END;
$$ LANGUAGE plpgsql;
--Trigger
CREATE TRIGGER member_trig
BEFORE DELETE ON Airline
FOR EACH ROW
EXECUTE FUNCTION airline_delete_trigger();

--Creating Trigger and Function for Airline_Airport Entity
CREATE OR REPLACE FUNCTION airline_airport_trigger()
RETURNS TRIGGER AS $$
BEGIN
   	NEW.Route = nextval('aa_seq');
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--Trigger
CREATE TRIGGER aa1_trig
BEFORE INSERT ON airport_airline
FOR EACH ROW
EXECUTE FUNCTION airline_airport_trigger();


/*Creating Views*/
--Shows the info of Airplane
create or replace view airplaneInfo as
select tail_no, airline_code, manufacturer, model from airplane;

-- Shows the info of Destination Route
create or replace view routeinfo as
select aa.route, aa.airline_code, ar.airline_name, aa.airport_code, ci.city_name
from airline ar
left outer join airport_airline aa on ar.airline_code = aa.airline_code
left outer join city ci on aa.airport_code = ci.fk_airport_code;

 