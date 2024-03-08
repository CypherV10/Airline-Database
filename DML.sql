/*Inserting data into Tables*/

INSERT INTO airport (airport_name, no_of_terminals, age, capacity)
VALUES
    ('Kempegowda International Airport', 2, 20, 5000),
    ('John F. Kennedy International Airport', 6, 97, 59335),
    ('London Heathrow Airport', 5, 77, 80630),
    ('Haneda Airport', 4, 155, 87380),
    ('Charles de Gaulle Airport', 3, 535, 76555),
    ('Sydney Kingsford Smith Airport', 3, 92, 42620),
    ('Beijing Capital International Airport', 3, 104, 95800),
    ('Galeão - Antonio Carlos Jobim International Airport', 2, 61, 17178),
    ('Cape Town International Airport', 2, 72, 89000),
    ('Dubai International Airport', 3, 59, 89000),
    ('Sheremetyevo International Airport', 5, 64, 40350),
    ('Frankfurt Airport', 4, 90, 65416),
    ('Dallas/Fort Worth International Airport', 5, 49, 67472),
    ('Kuala Lumpur International Airport', 2, 25, 78000),
    ('Addis Ababa Bole International Airport', 3, 79, 11000);
	
INSERT INTO city (city_name, fk_airport_code, country, area, foundation_date, population)
VALUES
    ('Bengaluru', 'ARPT100', 'India', 710, '1537-07-03', 12572222),
    ('New York', 'ARPT101', 'USA', 469, '1624-05-24', 8537673),
    ('London', 'ARPT102', 'UK', 1573, '1043-12-31', 8961989),
    ('Tokyo', 'ARPT103', 'Japan', 2188, '1868-07-29', 9272690),
    ('Paris', 'ARPT104', 'France', 105, '1486-09-21', 2148271),
    ('Sydney', 'ARPT105', 'Australia', 469, '1788-01-26', 5312163),
    ('Beijing', 'ARPT106', 'China', 16411, '1919-03-04', 21542000),
    ('Rio de Janeiro', 'ARPT107', 'Brazil', 487, '1565-03-01', 6747815),
    ('Cape Town', 'ARPT108', 'South Africa', 948, '1652-04-06', 433688),
    ('Dubai', 'ARPT109', 'UAE', 412, '1971-12-02', 3332300),
    ('Moscow', 'ARPT110', 'Russia', 2511, '1147-04-11', 12615279),
	('Frankfurt', 'ARPT111', 'Germany', 248, '1936-06-21', 7633803),
	('Fort Worth', 'ARPT112', 'USA', 790, '1849-02-12', 927720),
	('Kuala Lumpur', 'ARPT113', 'Malaysia', 244, '1857-01-01', 7898700),
    ('Addis Ababa', 'ARPT114', 'Ethiopia', 530, '1886-10-19', 3400000);
	
INSERT INTO passenger (passport_no, fname, lname, age, gender, citizenship)
VALUES
    ('L77777777', 'Rahul', 'Verma', 26, 'Male', 'IN'),
    ('A12345678', 'John', 'Doe', 28, 'Male', 'US'),
    ('G98765432', 'Jane', 'Smith', 35, 'Female', 'UK'),
    ('C24681357', 'Robert', 'Johnson', 42, 'Male', 'CA'),
    ('D87654321', 'Alice', 'Brown', 22, 'Female', 'AU'),
    ('E55555555', 'Michael', 'White', 30, 'Male', 'DE'),
    ('K11111111', 'Maria', 'Garcia', 29, 'Female', 'ES'),
    ('H22222222', 'Andreas', 'Mueller', 32, 'Male', 'DE'),
    ('I33333333', 'Sophie', 'Dupont', 27, 'Female', 'FR'),
    ('B44444444', 'Makoto', 'Yamada', 31, 'Male', 'JP'),
    ('F99999999', 'Anna', 'Ivanova', 24, 'Female', 'RU');
	
INSERT INTO Air_Alliance (Alliance_Name, Founding_Airline, Age, No_of_Members, City_Name)
VALUES 
	('Star Alliance', 'Lufthansa', 27, 1, 'Frankfurt'),
	('Oneworld', 'American Airlines', 25, 1, 'Fort Worth'),
	('Skyteam', 'Delta Airlines', 23, 1, 'New York'),
	('Skyline', 'LATAM Airlines', 6, 1, 'Rio de Janeiro'),
	('Jetstream', 'Emirates', 13, 1, 'Dubai'),
	('Skyconnect', 'Indigo', 18, 1, 'Bengaluru'),
	('Airquest', 'AirAsia', 19, 1, 'Kuala Lumpur'),
	('Aeroglobe', 'Ethiopian Airlines', 29, 1, 'Addis Ababa'),
	('SwiftFly', 'ANA', 7, 1, 'Tokyo'),
	('Wingstar', 'Qantas', 24, 1, 'Sydney');
 
--Inserting Values into Airline Table
INSERT INTO Airline (Airline_Name, Country, Age, Airline_Fleet_Size, Alliance_Code)
VALUES 
	('Air France',	'France',	90,	243,	'ALL100'),
	('Lufthansa',	'Germany',	68,	274,	'ALL100'),
	('British Airways',	'United Kingdom',	49,	257,	'ALL100'),
	('Japan Airlines',	'Japan',	72,	145,	'ALL200'),
	('TAP Air Portugal',	'Portugal',	77,	75,	'ALL200'),
	('Etihad',	'United Arab Emirates',	20,	90,	'ALL200'),
	('American Airlines',	'United States',	87,	944,	'ALL200'),
	('Alaska Airlines',	'United States',	79,	305,	'ALL300'),
	('Delta Airlines',	'United States',	94,	945,	'ALL300'),
	('Spirit Airlines',	'United States',	33,	197,	'ALL300'),
	('LATAM Airlines',	'Brazil',	91,	149,	'ALL400'),
	('Qatar Airways',	'Qatar',	29,	253,	'ALL500'),
	('Emirates',	'United Arab Emirates',	38,	260,	'ALL500'),
	('Air India',	'India',	77,	123,	'ALL600'),
	('Indigo',	'India',	17,	335,	'ALL600'),
	('Vistara',	'India',	8,	63,	'ALL600'),
	('AirAsia',	'Malaysia',	26,	255,	'ALL700'),
	('Cebu Pacific',	'Phillipines',	27,	63,	'ALL700'),
	('Vietnam Airlines',	'Vietnam',	67,	97,	'ALL700'),
	('Ethiopian Airlines',	'Ethiopia',	77,	140,	'ALL800'),
	('Kenya Airways',	'Kenya',	46,	34,	'ALL800'),
	('EgyptAir',	'Egypt',	90,	78,	'ALL800'),
	('ANA',	'Japan',	70,	212,	'ALL900'),
	('Asiana Airlines',	'Korea',	34,	78,	'ALL900'),
	('Air China',	'China',	35,	492,	'ALL900'),
	('Qantas',	'Australia',	101,	125,	'ALL1000'),
	('Aerolineas Argentinas',	'Argentina',	74,	82,	'ALL400'),
	('Air New Zealand',	'New Zealand',	58,	106,	'ALL1000');

--Insert values into Airplane
INSERT INTO Airplane (Airline_Code, Manufacturer, Model, Airplane_Age, Capacity)
VALUES 
	('AIR101', 'Boeing', '737', 5, 150),
	('AIR111', 'Airbus', 'A320', 4, 180),
	('AIR131', 'Boeing', '777', 8, 300),
	('AIR141', 'Airbus', 'A350', 3, 250),
	('AIR151', 'Embraer', 'E190', 6, 100),
	('AIR161', 'Boeing', '787', 2, 240),
	('AIR171', 'Airbus', 'A330', 7, 220),
	('AIR181', 'Boeing', '747', 10, 400),
	('AIR191', 'Airbus', 'A321', 4, 130),
	('AIR201', 'Bombardier', 'Q400', 5, 90),
	('AIR211', 'Airbus', 'A380', 6, 550),
	('AIR221', 'Boeing', '767', 9, 280),
	('AIR231', 'Airbus', 'A321', 3, 170),
	('AIR241', 'Embraer', 'E175', 4, 80),
	('AIR251', 'Bombardier', 'Q400', 7, 90),
	('AIR261', 'Airbus', 'A320', 5, 120),
	('AIR271', 'Boeing', '737', 1, 160),
	('AIR281', 'Airbus', 'A330neo', 2, 240),
	('AIR291', 'Embraer', 'E195', 3, 110),
	('AIR301', 'Bombardier', 'CRJ700', 6, 75),
	('AIR311', 'Boeing', '757', 12, 200),
	('AIR321', 'Airbus', 'A320', 15, 180),
	('AIR331', 'Embraer', 'E170', 7, 80),
	('AIR341', 'Bombardier', 'Global 6000', 4, 20),
	('AIR351', 'Airbus', 'A340', 18, 350),
	('AIR361', 'Boeing', '737', 20, 150),
	('AIR121', 'Boeing', '737', 20, 166),
	('AIR371', 'Embraer', 'E145', 9, 50);
	
INSERT INTO Airport_Airline (Airport_code, Airline_Code)
VALUES 
	('ARPT100',	'AIR101'),
	('ARPT101',	'AIR111'),
	('ARPT102',	'AIR131'),
	('ARPT103',	'AIR141'),
	('ARPT104',	'AIR151'),
	('ARPT105',	'AIR161'),
	('ARPT106',	'AIR171'),
	('ARPT107',	'AIR181'),
	('ARPT108',	'AIR191'),
	('ARPT109',	'AIR201'),
	('ARPT110',	'AIR211'),
	('ARPT111',	'AIR221'),
	('ARPT112',	'AIR231'),
	('ARPT113',	'AIR241'),
	('ARPT114',	'AIR251'),
	('ARPT100',	'AIR261'),
	('ARPT101',	'AIR271'),
	('ARPT102',	'AIR281'),
	('ARPT103',	'AIR291'),
	('ARPT104',	'AIR301'),
	('ARPT105',	'AIR311'),
	('ARPT106',	'AIR321'),
	('ARPT107',	'AIR331'),
	('ARPT108',	'AIR341'),
	('ARPT109',	'AIR351'),
	('ARPT110',	'AIR361'),
	('ARPT111',	'AIR121'),
	('ARPT112',	'AIR371');
