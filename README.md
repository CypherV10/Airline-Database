INTRODUCTION AND ASSUMPTIONS: 
The Airline Database Management System's architecture is meticulously crafted to handle and organize information within the aviation sector. It incorporates airports, cities, passengers, alliances, airlines, airplanes, and airport-airline relationships, each with specific attributes to capture relevant details. The system's design is structured to streamline data storage, retrieval, and maintenance associated with various facets of air travel. 
The interconnections between these entities are thoughtfully defined, establishing meaningful links for the smooth flow of data interactions. The incorporation of primary and foreign keys enhances data integrity, facilitating accurate associations across different elements of the aviation system.
This comprehensive database design thoroughly addresses the nuanced requirements of the aviation industry and offers a robust framework for managing airport infrastructure, airline operations, passenger data, and alliance dynamics. The inclusion of triggers, sequences, and views adds depth to the system, ensuring a well-structured and effective solution for handling diverse data associated with aviation operations.


BUSINESS RULES: 
City - Airport Relationship:  
Assumption: Each city can have only one airport at the most. 
Cardinality: Airport (1): City (1) | Mandatory: Airport | Optional: City  
Rule: Each airport is exclusively associated with one city, creating a one-to-one relationship. Conversely, as per the assumption, a city can accommodate only one airport, making it a one-to-one relationship. 
 
City - Air Alliance Relationship:  
Assumption: None. 
Cardinality: City (1): Air Alliance (M) | Mandatory: Air Alliance | Optional: City  
Rule: Each air alliance designates one city as its headquarters, forming a one-to-one relationship. Meanwhile, a city can serve as the base headquarters for multiple air alliances, establishing a one-to-many relationship. 
  
Airport - Passenger Relationship:  
Assumption:  
1.	An airport will cease to operate without passengers. 
2.	Each layover creates a new trip. Hence, a Passenger can only fly to a single airport on a single trip. 
Cardinality: Airport (1): Passenger (M) | Mandatory: Airport, Passenger
Rule: A Passenger can choose a single airport to fly to. An airport can have Multiple Passengers. This establishes a one-to-many relationship. 
  
Passenger - Airline Relationship:  
Assumptions:  
1.	Airlines should have passengers to run; the airlines would cease to exist without passengers.  
2.	Each layover creates a new trip. Hence, a Passenger can only fly a single airline on a single trip. 
Cardinality: Airline (1): Passenger (M) | Mandatory: Airline, Passenger  
Rule: Passengers can choose a single airline for a trip, while an airline serves multiple passengers. This establishes a one-to-many relationship. 
  


Airport - Airline Relationship:  
Assumption: None. 
Cardinality: Airport (M): Airline (M) | Mandatory: Airline	 | Optional: Airport  
Rule: Airports can permit multiple airlines, creating a one-to-many relationship. Conversely, airlines can fly to various airports, forming another many-to-many (M: M) relationship. 
To solve the M: M relationship, we will be using a bridge entity “Airport_Airline” here:  
Airport - Airport_Airline Entity Relationship:  
Cardinality: Airport (1): (Airport_Airline) (M)  
Optional: Airport  
Rule: An airport can permit multiple airlines to operate. This creates a 1:M relationship between Airport and Airport_airline bridge entity. It is optional for the airport to permit an airline to operate.
Airport_Airline - Airline Entity Relationship:  
Cardinality: (Airport_Airline) (M): Airline (1)  
Mandatory: Airport_Airline, Airline  
Rule: The "Airport_Airline" represents a specific arrangement between an airport and an airline, 	allowing for a one-to-many relationship with airlines. Airlines are mandatory in this context, 		meaning each Airport_Airline corresponds to a specific airline's operation at an airport. 
 
Air Alliance - Airline Relationship:  
Assumption: An Air Alliance has to have a minimum of 1 Airline as member.
Cardinality: Air Alliance (1): Airline (M) | Mandatory: Air Alliance | Optional: Airline 
Rule: An Airline can be a part of only One Air Alliance. An Air Alliance can have Multiple Airlines as its members. An airline choosing an Air_Alliance is Optional. However, an Air_Alliance having Airlines as its members is mandatory. 
 Airline-Airplane Relationship:
Assumption: None.
Cardinality: Airline (1): Airplane (M)	Mandatory: Airline, Airplane
Rule: An airline is mandatory and can have multiple airplanes, creating a one-to-many relationship. Each aircraft can belong to only one airline at a time, making it mandatory for airplanes. This relationship signifies that each plane is exclusively associated with a single airline, ensuring that an airline can operate multiple planes while each is operated by a single airline.
  ENTITY DESCRIPTIONS: 
1.	Entity Name: PASSENGER 
Entity Description: A "PASSENGER" is an individual who utilizes transportation services and holds attributes that help identify and classify them for travel purposes. 
Attributes of PASSENGER:  
·	Passport_No (Primary Key): A unique identifier associated with the passenger, typically provided by a government or relevant authority. The passport number serves as a primary identification document for international travel. Passport_No format is unique to each country. In the Passenger entity, this is used as a primary key, which acts as a unique identifier of this entity. 
·	FName: The first name of the passenger. This attribute is crucial for identification and booking purposes. 
·	LName: The last name of the passenger. This attribute is crucial for identification and booking purposes.
·	Age: The age of the passenger, expressed in years. Age information is essential for various purposes, including fare calculation, eligibility for specific discounts, and travel restrictions. 
·	Gender: The gender of the passenger, which can be categorized as male, female, or other. This attribute helps provide personalized services and adhere to gender-specific regulations if applicable. 
·	Citizenship: The nationality or citizenship status of the passenger, indicating the country to which the passenger belongs. This information is significant for immigration and customs processes and compliance with travel restrictions and visa requirements.  
  
2.	Entity Name: AIR ALLIANCE  
Entity Description: An "AIR ALLIANCE" represents a collaborative group or alliance of multiple airlines working together to offer seamless travel worldwide. 
Attributes of AIR ALLIANCE:  
·	Alliance_Code (Primary Key): A unique code or identifier distinguishing the air alliance from others. This code serves as a primary key for database management and differentiation of partnerships. 
·	Alliance_Name: The official name or title of the air alliance. This attribute provides a recognizable identity for the partnership in the industry. 
·	Age: The age of the Air Alliance indicates the number of years since its establishment. This attribute helps us understand the alliance's history and experience in the aviation sector. 
·	Founding_Airline: The airline that initiated or founded the Air Alliance. This attribute identifies the key airline responsible for creating the alliance and is essential for historical context. 
·	No_of_Members: The total count of airlines that are part of the air alliance. This attribute quantifies the size and membership of the coalition, reflecting its scale and influence. 
·	FK_City_Name (Foreign Key): The location or city where the Air Alliance has its central administrative office or headquarters. This attribute serves as a reference point for the alliance's operational center. 

3.	Entity Name: AIRPORT 
Entity Description: An “Airport” is an airfield with a site and installation for the takeoff and 	landing of an aircraft.
·	Airport Code (Primary Key): A unique code assigned to the airport, such as the International Air Transport Association (IATA) code or the International Civil Aviation Organization (ICAO) code. 
·	Airport_Name: The name of the airport. 
·	Age: The age of the airport indicates the number of years since its establishment. This attribute helps us understand the airport's history and experience in the aviation sector. 
·	Capacity: This attribute represents the maximum number of passengers the airport can accommodate at any given time, which may vary based on the size and facilities of the airport. 
·	No_of_Terminals: This attribute represents the total count of terminal buildings or facilities at the airport. It is typically an integer value indicating the airport's number of separate terminals. 
·	FK_City_Name (Foreign Key): This attribute represents the city’s name where the airport is located. It is typically a text or string data type. 
 
4. Entity Name: AIRLINE 
Entity Description: An airline is a commercial entity that offers freight and passenger air transportation services. Airlines are businesses that move people and cargo locally and abroad by using a fleet of aircraft, including airplanes and helicopters. 
·	Airline Code (Primary Key): A unique identifier for the airline, often using an industry-standard code. 
·	Airline_Name: The official name of the airline. 
·	Age: The age of the airline indicates the number of years since its establishment. This attribute helps us understand the airline's history and experience in the aviation sector. 
·	Country: The country where the airline is based or registered. 
·	Airline_Fleet_Size: The total number of aircraft in the airline's fleet. 
·	FK_Alliance_Code (Foreign Key): The unique code of the air alliance that the airline is a member of. This attribute provides a recognizable identity for the partnership in the industry. 
 
5.	Entity Name: CITY 
Entity Description: A “CITY” in this context is a pivotal airport location, providing a geographical reference point for air travel operations. 
·	Country: The country to which the city belongs, indicating its national affiliation. This information is significant for international travel, regulatory compliance, and demographic analysis. 
·	City Name (Primary Key): The city’s name, identifying its specific location. This attribute is crucial for establishing associations with airports and providing context for air travel operations. 
·	FK Airport_Code (FK_Primary Key): A unique code assigned to the airport, such as the International Air Transport Association (IATA) code or the International Civil Aviation Organization (ICAO) code. 
·	Foundation_Date: The date the city was officially established or founded. This attribute provides historical context and allows for analysis of the city's development over time. 
·	Population: The total number of people residing in the city. This demographic information is significant to each town. 
·	Area: Size of the city in which there is an airport.
  
6.	Entity Name: AIRPLANE 
Entity Description: An "AIRPLANE" refers to a powered flying vehicle. In the context of this database, airplanes are essential assets owned and operated by airlines for air transportation services. 
·	FK Airline Code (FK_Primary Key): The unique identifier of the airline that owns or operates the airplane. This attribute establishes a direct relationship between the aircraft and the airline, indicating ownership and operational responsibility. 
·	Tail No (Primary Key): A unique identifier assigned to each airplane, typically displayed on the aircraft's tail. This identifier serves as a primary means of identifying and tracking individual aircraft. 
·	Manufacturer: The company or entity responsible for designing and producing the airplane. This attribute provides information about the origin and manufacture of the aircraft. 
·	Model: The specific model or type of the airplane, indicating its design characteristics and capabilities. 
·	Airplane_Age: The age of the airplane denotes the number of years since its initial manufacture or entry into service.
·	Capacity: The number of people an airplane can accommodate.

7.	Entity Name: AIRPORT_AIRLINE
Entity Description: The entity is a bridge/intersect entity as the AIRPORT and AIRLINE relationship is M: N.
·	ROUTE (Primary Key): The unique identifier of the AIRPORT_AIRLINE that signifies the route associated between the airport and the airline.
·	FK_Airport_Code: A unique code assigned to the airport, such as the International Air Transport Association (IATA) code or the International Civil Aviation Organization (ICAO) code. This references the primary key of the AIRPORT entity.
·	FK_Airline_Code: A unique identifier for the airline, often using an industry-standard code. This references the primary key of the AIRLINE entity.
