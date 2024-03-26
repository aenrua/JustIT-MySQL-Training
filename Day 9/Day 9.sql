										/* -- Day 9 -- */
/* Stored Procedure */
-- Pre-compiled SQL statement that will be stored in the database

/* Assignment */
create database assignment;
use assignment;
create table Member(
	MemberID varchar(10) primary key,
    MemberFName varchar(20),
    MemberLName varchar(20),
    MemberLoc varchar(20)
    );
create table Vehicle(
	VehicleReg varchar(10) primary key,
    VehicleMake varchar(20),
    VehicleModel varchar(10),
    MemberID varchar(10)
    );
alter table vehicle add foreign key (memberid) references member(memberid);
create table Engineer(
	EngineerID int primary key,
    EngineerFName varchar(20),
    EngineerLName varchar(20)
    );
create table Breakdown(
	BreakdownID int primary key,
    VehicleReg varchar(10),
    EngineerID int,
    BreakdownDATE date,
    BreakdownTIME time,
    BreakdownLoc varchar(30)
    );
alter table breakdown add foreign key (vehiclereg) references vehicle(vehiclereg);
alter table breakdown add foreign key (engineerid) references engineer(engineerid);
insert into member (memberid, memberfname, memberlname, memberloc) values
	(101, "Anton", "Agejev", "London"),
    (102, "James", "Wynne", "Manchester"),
    (103, "Matthew", "Bailey", "Wantage"),
    (104, "Thomas", "Vaudin", "Altrincham"),
    (105, "Jordan", "Mucheru", "London");
insert into vehicle (vehiclereg, vehiclemake, vehiclemodel, memberid) values
	("RX21VYO", "Suzuki", "S-Cross", 101),
    ("LJ17CVU", "Lamborghini", "Huracan", 102),
    ("CH69ADB", "Volvo", "V90", 103),
    ("LP21BGV", "Lada", "Niva", 104),
    ("UPG468F", "Morris", "Minor", 105),
    ("CK07BKKU", "Honda", "Supersport", 103),
    ("LE72HXU", "Harley Davidson", "Nightster", 101),
    ("YN20XRL", "Honda", "Civic", 104);
insert into engineer (engineerid, engineerfname, engineerlname) values
	(901, "Ren", "Ramirez"),
    (902, "Matthew", "Burgess"),
    (903, "Jake", "Griffin");
-- insert into breakdown (breakdownid, vehiclereg, engineerid, breakdowndate, breadkdowntime, breakdownloc) values
-- 	(10010