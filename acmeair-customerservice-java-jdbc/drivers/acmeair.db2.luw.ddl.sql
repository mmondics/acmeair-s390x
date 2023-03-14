--
-- db2 -tf acmeair.db2.luw.ddl.sql
-- 
connect reset;
deactivate db acmeair;
drop database acmeair;
create database acmeair;
activate db acmeair;
connect to acmeair;
--grant all on acmeair.* to 'acmeair'@'%' identified by 'acmeair';
create table AirportCodeMapping (
   id CHAR(3) NOT NULL,
   name VARCHAR(20),
   PRIMARY KEY(id)
);
create table Customer (
    id VARCHAR(20) NOT NULL,
    password VARCHAR(20),
    status VARCHAR(10),
    total_miles INT,
    miles_ytd INT,
    phoneNumber VARCHAR(15),
    phoneNumberType VARCHAR(10),
    streetAddress1 VARCHAR(20),
    streetAddress2 VARCHAR(20),
    city VARCHAR(20),
    stateProvince VARCHAR(20),
    country VARCHAR(20),
    postalCode VARCHAR(10),
    PRIMARY KEY(id)
);
-- create index cus_id on Customer(id) ;
--
create table CustomerSession (
    id VARCHAR(40) NOT NULL,
    customerid VARCHAR(20),
    lastAccessedTime TIMESTAMP,
    timeoutTime TIMESTAMP,
    PRIMARY KEY(id)
);
--create index cs_cid on table CustomerSession (customerid);
create table FlightSegment (
    id VARCHAR(6) NOT NULL,
    originPort CHAR(3),
    destPort CHAR(3),
    miles int,
    PRIMARY KEY(id)
);
--ALTER TABLE FlightSegment ADD INDEX fs_o_d(originPort, destPort);
--ALTER TABLE FlightSegment ADD INDEX fs_o(destPort);
create table Flight (
    id VARCHAR(40) NOT NULL,
    flightSegmentId VARCHAR(6),
    scheduledDepartureTime TIMESTAMP,
    scheduledArrivalTime TIMESTAMP,
    firstClassBaseCost numeric(8,2),
    economyClassBaseCost numeric(8,2),
    numFirstClassSeats int,
    numEconomyClassSeats int,
    airplaneTypeId VARCHAR(10),
    PRIMARY KEY(id)
);
--ALTER TABLE Flight ADD INDEX f_fsid(flightSegmentId);
create table Booking (
    id VARCHAR(40) NOT NULL,
    customerId VARCHAR(20),
    flightId VARCHAR(40),
    flightSegmentId VARCHAR(6),
    dateOfBooking TIMESTAMP,
    PRIMARY KEY(id)
);
--ALTER TABLE Booking ADD INDEX b_cid(customerId);
import FROM  customer.table.csv OF DEL SKIPCOUNT 1 INSERT INTO CUSTOMER ;
select distinct count(*) from customer ;
terminate ;
--