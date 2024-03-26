/* Task */
-- CREATE a schema based on the image
create database world2;
use world2;
create table country(
	code int primary key,
    name varchar(50) not null,
    continent enum("Asia", "Oceania", "Europe", "North America", "South Amerca"),
    population int,
    capital int
    );
create table city(
	id int primary key,
    name varchar(20) not null,
    countryCode int,
    population decimal(20,2)
    );
create table countryLanguage(
	countryCode int,
    language varchar(30),
    isOfficial boolean,
    percentage decimal(4,1),
    primary key (countryCode, language) -- combine columns into one primary key
    );
alter table country add foreign key (capital) references city(id);
alter table city add foreign key (countrycode) references country(code);
alter table countryLanguage add foreign key (countryCode) references country(code);

/* Additional info - RELATIONSHIPS */
-- One to One
-- One to Many
-- Many to Many