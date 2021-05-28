﻿CREATE DATABASE LibraryManagement
GO

USE LibraryManagement
GO

CREATE TABLE Staff
	(
		idStaff INT IDENTITY (1,1) PRIMARY KEY,
		nameStaff NVARCHAR(MAX) NOT NULL,
		dobStaff SMALLDATETIME NOT NULL,
		addressStaff NVARCHAR(MAX) NOT NULL,
		phoneNumberStaff NVARCHAR(MAX) NOT NULL,
		accountStaff VARCHAR(255) UNIQUE NOT NULL,
		passwordStaff VARCHAR(MAX) NOT NULL,
		idPermission INT NOT NULL
	)
GO

CREATE TABLE Permission
	(
		idPermission INT IDENTITY (1,1) PRIMARY KEY,
		namePermission NVARCHAR(MAX) NOT NULL
	)
GO

select * from Permission

CREATE TABLE Book
	(
		idBook INT IDENTITY (1,1) PRIMARY KEY,
		nameBook NVARCHAR(MAX) NOT NULL,
		dateManufacture SMALLDATETIME NOT NULL,
		dateAddBook SMALLDATETIME NOT NULL,
		price INT NOT NULL,
		statusBook NVARCHAR(MAX) NOT NULL,
		idCategory INT NOT NULL,
		idPublisher INT NOT NULL,
		image NVARCHAR(MAX)
	)
GO


CREATE TABLE Category
	(
		idCategory INT IDENTITY (1,1) PRIMARY KEY,
		nameCategory NVARCHAR(MAX) NOT NULL
	)
GO


CREATE TABLE Author
	(
		idAuthor INT IDENTITY (1,1) PRIMARY KEY,
		nameAuthor NVARCHAR(MAX) NOT NULL
	)
GO
CREATE TABLE Compose
	(
		idAuthor INT,
		idBook INT,
		primary key(idAuthor, idBook)
	)

GO
CREATE TABLE Publisher
	(
		idPublisher INT IDENTITY (1,1) PRIMARY KEY,
		namePublisher NVARCHAR(MAX) NOT NULL,
	)
GO

CREATE TABLE Reader
	(
		idReader INT IDENTITY (1,1) PRIMARY KEY,
		nameReader NVARCHAR(MAX) NOT NULL,
		dobReader SMALLDATETIME NOT NULL,
		email NVARCHAR(MAX) NOT NULL,
		addressReader NVARCHAR(MAX) NOT NULL,
		createdAt SMALLDATETIME NOT NULL,
		debt INT NOT NULL,
		latestExtended SMALLDATETIME NOT NULL,
		idTypeReader INT NOT NULL
	)
GO

CREATE TABLE TypeReader
	(
		idTypeReader INT IDENTITY (1,1) PRIMARY KEY,
		nameTypeReader NVARCHAR(MAX) NOT NULL,
	)
GO



CREATE TABLE BillBorrow
	(
		idBillBorrow INT IDENTITY (1,1) PRIMARY KEY,		
		borrowDate SMALLDATETIME NOT NULL,
		idReader INT NOT NULL
	)
GO

CREATE TABLE DetailBillBorrow
	(
		idDetailBillBorrow INT IDENTITY (1,1) PRIMARY KEY,		
		idBook INT NOT NULL,
		idBillBorrow INT NOT NULL,
		returned INT NOT NULL /** add **/
	)
GO
CREATE TABLE BillReturn
	(
		idBillReturn INT IDENTITY (1,1) PRIMARY KEY,		
		returnDate SMALLDATETIME NOT NULL,
		idReader INT NOT NULL,
		sumFine INT NOT NULL /** add **/
	)
GO

CREATE TABLE DetailBillReturn
	(
		idDetailBillReturn INT IDENTITY (1,1) PRIMARY KEY,		
		idBook INT NOT NULL,
		idBillReturn INT NOT NULL,
		idBillBorrow INT NOT NULL, /** add **/
		dayBorrowed INT NOT NULL, /** add **/
		fine INT NOT NULL /** add **/
	)
GO
CREATE TABLE Payment
	(
		idPayment INT IDENTITY (1,1) PRIMARY KEY,
		idReader INT NOT NULL,
		currentDebt INT NOT NULL,
		collectedAmount INT NOT NULL,
		remainDebt INT NOT NULL,
		paymentDate SMALLDATETIME NOT NULL
	)

GO

CREATE TABLE Paramater
	(
		idParameter INT IDENTITY(1,1) PRIMARY KEY,
		nameParameter NVARCHAR(MAX) NOT NULL,
		valueParameter INT NOT NULL
	)
GO

ALTER TABLE Reader ADD FOREIGN KEY(idTypeReader) REFERENCES TypeReader(idTypeReader)
GO
ALTER TABLE Book ADD FOREIGN KEY(idCategory) REFERENCES Category(idCategory)
GO
ALTER TABLE Book ADD FOREIGN KEY(idPublisher) REFERENCES Publisher(idPublisher)
GO
ALTER TABLE Compose ADD FOREIGN KEY(idBook) REFERENCES Book(idBook)
GO
ALTER TABLE Compose ADD FOREIGN KEY(idAuthor) REFERENCES Author(idAuthor)
GO
ALTER TABLE Staff ADD FOREIGN KEY(idPermission) REFERENCES Permission(idPermission)
GO
ALTER TABLE DetailBillBorrow ADD FOREIGN KEY(idBook) REFERENCES Book(idBook)
GO
ALTER TABLE DetailBillBorrow ADD FOREIGN KEY(idBillBorrow) REFERENCES BillBorrow(idBillBorrow)
GO
ALTER TABLE BillBorrow ADD FOREIGN KEY(idReader) REFERENCES Reader(idReader)
GO
ALTER TABLE DetailBillReturn ADD FOREIGN KEY(idBook) REFERENCES Book(idBook)
GO
ALTER TABLE DetailBillReturn ADD FOREIGN KEY(idBillReturn) REFERENCES BillReturn(idBillReturn)
GO
ALTER TABLE DetailBillReturn ADD FOREIGN KEY(idBillBorrow) REFERENCES BillBorrow(idBillBorrow)
GO
ALTER TABLE BillReturn ADD FOREIGN KEY(idReader) REFERENCES Reader(idReader)
GO
ALTER TABLE Payment ADD FOREIGN KEY(idReader) REFERENCES Reader(idReader)
GO
ALTER TABLE Book ADD CHECK (statusBook = N'đã mượn' OR statusBook = N'có sẵn')
GO



/* insert Data */
insert into TypeReader values(N'Học sinh')
insert into TypeReader values(N'Sinh viên')
insert into TypeReader values(N'Tự do')

insert into Reader values(N'Lê Anh Tuấn', '01/01/2000', 'email1@gmail.com', N'Gia Lai', '01/01/2020', 0, '01/01/2020', 2)
insert into Reader values(N'Lê Xuân Tùng', '01/02/2000', 'email2@gmail.com', N'Quảng Bình', '01/02/2020', 0, '01/02/2020', 1)
insert into Reader values(N'Nguyễn Thanh Tuấn', '01/03/2000', 'email3@gmail.com', N'Quảng Ngãi', '01/03/2020', 0,'01/03/2020', 2)
insert into Reader values(N'Nguyễn Xuân Tú', '01/04/2000', 'email4@gmail.com', N'Hà Tĩnh', '01/04/2020', 0, '01/04/2020', 3)


insert into Publisher values(N'Nhà xuất bản 1')
insert into Publisher values(N'Nhà xuất bản 2')
insert into Publisher values(N'Nhà xuất bản 3')
insert into Publisher values(N'Nhà xuất bản 4')
insert into Publisher values(N'Nhà xuất bản 5')

insert into Author values(N'Tác giả 1')
insert into Author values(N'Tác giả 2')
insert into Author values(N'Tác giả 3')
insert into Author values(N'Tác giả 4')
insert into Author values(N'Tác giả 5')
 
insert into Category values(N'Thể loại 1')
insert into Category values(N'Thể loại 2')
insert into Category values(N'Thể loại 3')
insert into Category values(N'Thể loại 4')
insert into Category values(N'Thể loại 5')

insert into Book values(N'Sách 1', '01/01/2010', '01/01/2020', 20000, N'có sẵn', 1, 1, '/')
insert into Book values(N'Sách 2', '01/02/2010', '01/01/2020', 30000, N'có sẵn', 2, 2, '/')
insert into Book values(N'Sách 3', '01/03/2010', '01/01/2020', 40000, N'có sẵn', 3, 3, '/')
insert into Book values(N'Sách 4', '01/04/2010', '01/01/2020', 50000, N'có sẵn', 4, 4, '/')
insert into Book values(N'Sách 5', '01/05/2010', '01/01/2020', 60000, N'có sẵn', 5, 5, '/')

insert into Book values(N'Sách 6', '01/05/2010', '01/01/2020', 60000, N'có sẵn', 1, 3, '/')
insert into Book values(N'Sách 7', '01/05/2010', '01/01/2020', 70000, N'có sẵn', 2, 4, '/')
insert into Book values(N'Sách 8', '01/05/2010', '01/01/2020', 80000, N'có sẵn', 3, 5, '/')
insert into Book values(N'Sách 9', '01/05/2010', '01/01/2020', 90000, N'có sẵn', 4, 1, '/')
insert into Book values(N'Sách 10', '01/05/2010', '01/01/2020', 100000, N'có sẵn', 5, 2, '/')
insert into Book values(N'Sách 11', '01/05/2010', '01/01/2020', 110000, N'có sẵn', 1, 3, '/')
insert into Book values(N'Sách 12', '01/05/2010', '01/01/2020', 53000, N'có sẵn', 2, 4, '/')
insert into Book values(N'Sách 13', '01/05/2010', '01/01/2020', 54000, N'có sẵn', 3, 5, '/')
insert into Book values(N'Sách 14', '01/05/2010', '01/01/2020', 55000, N'có sẵn', 4, 1, '/')
insert into Book values(N'Sách 15', '01/05/2010', '01/01/2020', 56000, N'có sẵn', 5, 2, '/')
insert into Book values(N'Sách 16', '01/05/2010', '01/01/2020', 60000, N'có sẵn', 1, 3, '/')
insert into Book values(N'Sách 17', '01/05/2010', '01/01/2020', 57000, N'có sẵn', 2, 4, '/')
insert into Book values(N'Sách 18', '01/05/2010', '01/01/2020', 58000, N'có sẵn', 3, 5, '/')
insert into Book values(N'Sách 19', '01/05/2010', '01/01/2020', 59000, N'có sẵn', 4, 1, '/')
insert into Book values(N'Sách 20', '01/05/2010', '01/01/2020', 60000, N'có sẵn', 5, 2, '/')
insert into Book values(N'Sách 21', '01/05/2010', '01/01/2020', 61000, N'có sẵn', 1, 3, '/')
insert into Book values(N'Sách 22', '01/05/2010', '01/01/2020', 62000, N'có sẵn', 2, 4, '/')
insert into Book values(N'Sách 23', '01/05/2010', '01/01/2020', 63000, N'có sẵn', 3, 5, '/')
insert into Book values(N'Sách 24', '01/05/2010', '01/01/2020', 64000, N'có sẵn', 4, 1, '/')
insert into Book values(N'Sách 25', '01/05/2010', '01/01/2020', 65000, N'có sẵn', 5, 2, '/')
insert into Book values(N'Sách 26', '01/05/2010', '01/01/2020', 66000, N'có sẵn', 1, 3, '/')
insert into Book values(N'Sách 27', '01/05/2010', '01/01/2020', 67000, N'có sẵn', 2, 4, '/')
insert into Book values(N'Sách 28', '01/05/2010', '01/01/2020', 68000, N'có sẵn', 3, 5, '/')
insert into Book values(N'Sách 29', '01/05/2010', '01/01/2020', 69000, N'có sẵn', 4, 1, '/')
insert into Book values(N'Sách 30', '01/05/2010', '01/01/2020', 40000, N'có sẵn', 5, 2, '/')
insert into Book values(N'Sách 31', '01/05/2010', '01/01/2020', 41000, N'có sẵn', 1, 3, '/')
insert into Book values(N'Sách 32', '01/05/2010', '01/01/2020', 42000, N'có sẵn', 2, 4, '/')
insert into Book values(N'Sách 33', '01/05/2010', '01/01/2020', 43000, N'có sẵn', 3, 5, '/')

update Book
set image = 'default-image.png' 


insert into Compose values(1, 1);
insert into Compose values(2, 2);
insert into Compose values(3, 3);
insert into Compose values(4, 3);
insert into Compose values(5, 3);
insert into Compose values(4, 4);
insert into Compose values(5, 4);
insert into Compose values(5, 5);


insert into Paramater values(N'ageMin', 18);
insert into Paramater values(N'ageMax', 55);
insert into Paramater values(N'expiryDate', 6);
insert into Paramater values(N'distancePublish', 8);
insert into Paramater values(N'bookBorrowMax', 5);
insert into Paramater values(N'moneyPenalty', 1000);
insert into Paramater values(N'dateBorrowMax', 4);

insert into Permission values(N'Quản trị viên')
insert into Permission values(N'Nhân viên')

INSERT INTO Staff VALUES(N'Admin', '07/24/2000', N'Quảng Bình', '0965678164', 'admin', '2b2K2nI2Klrw29mD3odrmFoNmEo4kuoksTRuvOfMreNgQfhJ73QzhQxsvWJBGD7/dwJRPYnp8/fztPQamoZWNw==', 1)
