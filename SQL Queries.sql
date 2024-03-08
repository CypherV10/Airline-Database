/*SQL FILE*/
--Q1 Select all columns and all rows from one table
SELECT * FROM Airline;

--Q2 Select five columns and all rows from one table
SELECT Passport_No, fname, lname, Age, Citizenship FROM Passenger;

--Q3 Select all columns from all rows from one view
select * from RouteInfo;

--Q4 Using a join on 2 tables, select all columns and all rows from the tables without the use of a Cartesian product
select *
from airline ar
left outer join airplane ap on ar.airline_code = ap.airline_code;

--Q5 Select and order data retrieved from one table
select * from airport
order by age desc;

--Q6 Using a join on 3 tables, select 5 columns from the 3 tables. Use syntax that would limit the output to 10 rows 
select ap.tail_no, ap.manufacturer, ar.airline_code, ar.airline_name, al.alliance_name
from airplane ap
left outer join airline ar on ap.airline_code = ar.airline_code
left outer join air_alliance al on ar.alliance_code = al.alliance_code
limit 10;

--Q7 Select distinct rows using joins on 3 tables 
select distinct ap.manufacturer
from airplane ap
left outer join airline ar on ap.airline_code = ar.airline_code
left outer join air_alliance al on ar.alliance_code = al.alliance_code
where al.alliance_name = 'Skyteam';

--Q8 Use GROUP BY and HAVING in a select statement using one or more tables 
select ar.airline_name, al.alliance_name, al.no_of_members
from air_alliance al
left outer join airline ar on al.alliance_code = ar.alliance_code
group by ar.airline_name, al.alliance_name, al.no_of_members
having al.no_of_members > 3;

--Q9 Use IN clause to select data from one or more tables
select tail_no, model 
from airplane 
where manufacturer in ('Boeing','Airbus');

--Q10 Select length of one column from one table
select length(passport_no)
from passenger;

--Q11 Delete one record from one table. Use select statements to demonstrate the table contents before and after the DELETE statement. Make sure you use ROLLBACK afterwards so that the data will not be physically removed (
---before deletion
select * from passenger;
--deletion
begin transaction;
delete from passenger where fname='Jane';
--after deletion
rollback;
select * from passenger;

--Q12 Update one record from one table. Use select statements to demonstrate the table contents before and after the UPDATE statement. Make sure you use ROLLBACK afterwards so that the data will not be physically removed
---before updation
select * from passenger;
--updation
begin transaction;
update passenger set citizenship = 'US', passport_no='A87654321'
where fname='Rahul';
--after deletion
rollback;
select * from passenger;

--Q13 Advanced Query 1
--THIS SHOWS THE INFO OF DESTINATION ROUTE
select aa.route, aa.airline_code, ar.airline_name, aa.airport_code, ci.city_name
from airline ar
left outer join airport_airline aa on ar.airline_code = aa.airline_code
left outer join city ci on aa.airport_code = ci.fk_airport_code;

--Q14 Advanced Query 2
-- DISPLAY THE FIRST RECORD WITH TAIL_NUMBER, ALLIANCE_NAME, AND MANUFACTURER OF ALL THE AIRPLANES WHOSE AIRLINES ARE BASED IN THE U.S.A AND ARE MANUFACTURED BY THE COMPANY ‘BOEING.’ 
select ap.tail_no, al.alliance_name, ap.manufacturer
from airplane ap 
left outer join airline ar on ap.airline_code = ar.airline_code
left outer join air_alliance al on ar.alliance_code = al.alliance_code
where ar.country in (select country from airline where country = 'United States')
group by ap.tail_no, al.alliance_name, ap.manufacturer
having ap.manufacturer = 'Boeing'
limit 1; 






