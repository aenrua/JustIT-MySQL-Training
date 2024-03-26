/* Task */
create database task3;
use task3;
create table article(
    ID int primary key,
    Title varchar(30) not null,
    Text varchar(40),
    PublishStatus boolean,
    Topic varchar(30),
    Author varchar(30),
    PublicationDate date
    );
create table Topic(
	Name varchar(30) primary key,
    Description varchar(60)
    );
create table Author(
	Username varchar(30) primary key,
    DisplayName varchar(30)
    );
create table Course(
	ShortName varchar(30) primary key,
    Course varchar(30)
    );
create table Relevant_For(
	ArticleID int,
    Course varchar(30),
    primary key (ArticleID, Course)
    );
alter table article add foreign key (topic) references topic(name);
alter table article add foreign key (author) references author(username);
alter table relevant_for add foreign key (articleid) references article(id);
alter table relevant_for add foreign key (course) references course(shortname);