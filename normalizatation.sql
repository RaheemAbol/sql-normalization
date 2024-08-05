create database olympicsDB;


use olympicsDB;

CREATE TABLE OlympicRecordsUnnormalized (
    AthleteID INT,            
    AthleteName VARCHAR(255), 
    Country VARCHAR(255),     
    CountryCode VARCHAR(3),
    EventID INT,    		
    EventName VARCHAR(255),
    EventDate DATE,
    Medal VARCHAR(10),
    CoachName VARCHAR(255),
    CoachPhone VARCHAR(15)
);




INSERT INTO OlympicRecordsUnnormalized (AthleteID, AthleteName, Country, CountryCode, EventID, EventName, EventDate, Medal, CoachName, CoachPhone) VALUES
(1, 'John Doe', 'USA', 'USA', 101, '100m Sprint', '2024-07-23', 'Gold', 'Coach A', '123-456-7890'),
(2, 'Jane Smith', 'UK', 'GBR', 102, 'Long Jump', '2024-07-24', 'Silver', 'Coach B', '234-567-8901'),
(1, 'John Doe', 'USA', 'USA', 103, '200m Sprint', '2024-07-25', 'Bronze', 'Coach A', '123-456-7890'),
(3, 'Alice Brown', 'Canada', 'CAN', 101, '100m Sprint', '2024-07-23', 'Silver', 'Coach C', '345-678-9012');


select * from OlympicRecordsUnnormalized;


CREATE TABLE OlympicResults1NF (
    AthleteID INT,
    AthleteName VARCHAR(255),
    Country VARCHAR(255),
    CountryCode VARCHAR(3),
    EventID INT,
    Medal VARCHAR(10),
    CoachID INT,
    PRIMARY KEY (AthleteID, EventID)
);



INSERT INTO OlympicResults1NF (AthleteID, AthleteName, Country, CountryCode, EventID, Medal, CoachID) VALUES
(1, 'John Doe', 'USA', 'USA', 101, 'Gold', 1),
(2, 'Jane Smith', 'UK', 'GBR', 102, 'Silver', 2),
(1, 'John Doe', 'USA', 'USA', 103, 'Bronze', 1),
(3, 'Alice Brown', 'Canada', 'CAN', 101, 'Silver', 3);


select * from OlympicResults1NF;


CREATE TABLE Events (
    EventID INT,
    EventName VARCHAR(255),
    EventDate DATE,
    PRIMARY KEY (EventID)
);


CREATE TABLE Coaches (
    CoachID INT,
    CoachName VARCHAR(255),
    CoachPhone VARCHAR(15),
    PRIMARY KEY (CoachID)
);

INSERT INTO Events (EventID, EventName, EventDate) VALUES
(101, '100m Sprint', '2024-07-23'),
(102, 'Long Jump', '2024-07-24'),
(103, '200m Sprint', '2024-07-25');


INSERT INTO Coaches (CoachID, CoachName, CoachPhone) VALUES
(1, 'Coach A', '123-456-7890'),
(2, 'Coach B', '234-567-8901'),
(3, 'Coach C', '345-678-9012');



select * from coaches;
select * from events;


CREATE TABLE OlympicResults1NF (
    AthleteID INT,
    AthleteName VARCHAR(255),
    Country VARCHAR(255),
    CountryCode VARCHAR(3),
    EventID INT,
    Medal VARCHAR(10),
    CoachID INT,
    PRIMARY KEY (AthleteID, EventID)
);



CREATE TABLE OlympicResults2NF (
    AthleteID INT,
    EventID INT,
    Medal VARCHAR(10),
    CoachID INT,
    PRIMARY KEY (AthleteID, EventID)
);



INSERT INTO OlympicResults2NF (AthleteID, EventID, Medal, CoachID) VALUES
(1, 101, 'Gold', 1),
(2, 102, 'Silver', 2),
(1, 103, 'Bronze', 1),
(3, 101, 'Silver', 3);


select * from OlympicResults2NF where athleteID = 1;


CREATE TABLE Athletes (
    AthleteID INT,
    AthleteName VARCHAR(255),
    Country VARCHAR(255),
    CountryCode VARCHAR(3),
    PRIMARY KEY (AthleteID)
);


INSERT INTO Athletes (AthleteID, AthleteName, Country, CountryCode) VALUES
(1, 'John Doe', 'USA', 'USA'),
(2, 'Jane Smith', 'UK', 'GBR'),
(3, 'Alice Brown', 'Canada', 'CAN');

select * from athletes;

CREATE TABLE Countries (
    CountryID INT,
    CountryName VARCHAR(255),
    CountryCode VARCHAR(3),
    PRIMARY KEY (CountryID)
);


INSERT INTO Countries (CountryID, CountryName, CountryCode) VALUES
(1, 'USA', 'USA'),
(2, 'UK', 'GBR'),
(3, 'Canada', 'CAN');

select * from countries;
