CREATE DATABASE Otel
USE Otel

CREATE TABLE Manager(
Id int identity primary key,
Name nvarchar(50),
ReservecionId int foreign key references  Reservecion(Id),

CustomerId int foreign key references Customer(Id)
)


CREATE TABLE Reservecion (
Id int identity primary key,
PaymentId int foreign key references Payment(Id),
 SpendingsId  int foreign key references Spendings(Id)  
 CustomerId int foreign key references Customer(Id)
)


CREATE TABLE Customer(
Id int identity primary key,
Name nvarchar(50),
Surname nvarchar(50),
Age int,

RoomsTypesId int foreign key references RoomsType(Id)
)
 
CREATE TABLE Spending(

Id int identity primary key,
howmuch int

)

CREATE TABLE Payments(

Id int identity primary key,
howmuch int

)
CREATE TABLE Rooms(
Id int identity primary key,
Name nvarchar(50)
)
CREATE TABLE RoomsTypes(
Id int identity primary key,
RoomsId int references Rooms(Id) 
)

CREATE VIEW get_meetingdetail AS
SELECT 
c.Age'Customers Age',
c.Name 'Customers Name',
c.Surname 'Customers Surname',
rt.Id 'RoomType Id',
r.PaymentsId 'Reservecion PaymentsId',
r.SpendingId 'Resesrvecion Spending'

FROM Customer c
JOIN RoomsType rt
ON rt.Id=c.RoomsTypeId
JOIN Reservecion r
ON r.SpendingId =r.Id
JOIN Spending s
ON s.Id=r.SpendingId

JOIN Manager m
 ON m.ReservecionId=r.Id
 JOIN Customer 
 ON C.Id=M.CustomerId


SELECT * FROM get_meetingdetail



CREATE PROCEDURE GetCustomersWithAge122112w @age int =50
AS
SELECT*FROM Customer 
WHERE Age>@age

EXEC GetCustomersWithAge122w @age=20


CREATE FUNCTION GetCustomerByAge (@Age int)
RETURNS int
AS
BEGIN
DECLARE @COUNT INT
SELECT  * FROM Customer 
WHERE Age >25
RETURN @COUNT
END
GO

SELECT dbo.GetCustomerByAge (25)



CREATE FUNCTION GetCustomrsCountWithAge(@age int)
RETURNS int
AS
BEGIN 
DECLARE @Count int 
SELECT @Count= Count(*) FROM Customer 
WHERE Age >=@age
RETURN @COUNT
END

SELECT dbo.GetCustomrsCountWithAge(20) 

 
 CREATE FUNCTION GetCustomrsAGEWITHNAMESS(@Age int)
RETURNS nvarchar(50)
AS
BEGIN 
DECLARE @Name nvarchar(50) 
SELECT @Name=Customer.Name FROM Customer 
WHERE Age >=@age
RETURN @Name
END

SELECT dbo.GetCustomrsAGEWITHNAMESS(54)



CREATE FUNCTION GetCustomersIdWithName(@ID int)
RETURNS nvarchar(50)
AS
BEGIN
DECLARE  @Name nvarchar(50) 
SELECT  @Name=Customer.Name FROM Customer
WHERE Id>=@ID
RETURN @Name
END


SELECT dbo.GetCustomersIdWithName(8)


CREATE FUNCTION GetCustomersNameWithSurnameww(@Surname nvarchar)
RETURNS nvarchar(50)
AS
BEGIN
DECLARE  @Name nvarchar(50) 
SELECT  @Name=Customer.Name FROM Customer
WHERE Surname!=@Surname
RETURN @Name
END


SELECT dbo.GetCustomersNameWithSurnameww('nn')