-- create database
CREATE DATABASE `thisbank` /*!40100 DEFAULT CHARACTER SET latin1 */;

-- create Roles table
CREATE TABLE `thisbank`.`roles` (
  `RoleID` INT NOT NULL AUTO_INCREMENT,
  `RoleDescription` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`RoleID`));
  
-- create Persons table
CREATE TABLE `thisbank`.`persons` (
  `PersonID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(150) NOT NULL,
  `LastName` VARCHAR(150) NOT NULL,
  `DoB` DATE NOT NULL,
  `EmailAddress` VARCHAR(150) NOT NULL,
  `Phone` VARCHAR(13) NULL,
  `Mobile` VARCHAR(12) NULL,
  `Active` TINYINT NOT NULL,
  PRIMARY KEY (`PersonID`))
COMMENT = '			';

-- Create Users table
CREATE TABLE `thisbank`.`users` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `PersonID` INT NOT NULL,
  `Role` INT NOT NULL,
  `Login` VARCHAR(200) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  `Active` TINYINT NOT NULL,
  PRIMARY KEY (`UserID`),
  INDEX `UserPersonID_idx` (`PersonID` ASC),
  INDEX `UserRoleID_idx` (`Role` ASC),
  CONSTRAINT `UserPersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `thisbank`.`persons` (`PersonID`)
      ON DELETE RESTRICT
	ON UPDATE RESTRICT,
  CONSTRAINT `UserRoleID`
    FOREIGN KEY (`Role`)
    REFERENCES `thisbank`.`roles` (`RoleID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

-- Create customers table	
CREATE TABLE `thisbank`.`customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CreateDate` DATETIME,
  `Active` TINYINT,
  `PersonID` INT,
  PRIMARY KEY (`CustomerID`),
  INDEX `CustPersonID_idx` (`PersonID` ASC),
  CONSTRAINT `CustPersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `thisbank`.`persons` (`PersonID`)
      ON DELETE RESTRICT
	ON UPDATE RESTRICT);
	
-- Create Addresses table
CREATE TABLE `thisbank`.`addresses` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `AddressLine1` VARCHAR(200),
  `AddressLine2` VARCHAR(200),
  `Postcode` VARCHAR(4),
  `State` VARCHAR(4),
  PRIMARY KEY (`AddressID`));
  
 -- Create Transaction Types table
 CREATE TABLE `thisbank`.`transactiontypes` (
  `TransactionTypeID` INT NOT NULL AUTO_INCREMENT,
  `TransactionTypeDesc` VARCHAR(200),
  PRIMARY KEY (`TransactionTypeID`));
  
 -- Create Branches table
 CREATE TABLE `thisbank`.`branches` (
  `BranchID` INT NOT NULL AUTO_INCREMENT,
  `BranchName` VARCHAR(200),
  `BranchPhone` VARCHAR(13),
  PRIMARY KEY (`BranchID`));
  
 -- Create Account Types
CREATE TABLE `thisbank`.`accounttypes` (
`AccountTypeID` INT NOT NULL AUTO_INCREMENT,
`AccountTypeDescription` VARCHAR(200),
`AccountInterest` DECIMAL(5,4),
PRIMARY KEY (`AccountTypeID`));
  
  -- Create Loan Types
CREATE TABLE `thisbank`.`loantypes` (
`LoanTypeID` INT NOT NULL AUTO_INCREMENT,
`LoanTypeDescription` VARCHAR(200),
`LoanInterest` DECIMAL(5,4),
PRIMARY KEY (`LoanTypeID`));

-- Create Accounts

CREATE TABLE `thisbank`.`accounts` (
  `AccountID` INT NOT NULL AUTO_INCREMENT,
  `OpenBranch` INT NOT NULL,
  `Active` TINYINT NOT NULL,
  `OpenDate` DATETIME NOT NULL,
  `AccountType` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`AccountID`),
  INDEX `BranchAccount_idx` (`OpenBranch` ASC),
  INDEX `CustomerAccount_idx` (`CustomerID` ASC),
  INDEX `AccountTypeAccount_idx` (`AccountType` ASC),
  CONSTRAINT `BranchAccount`
    FOREIGN KEY (`OpenBranch`)
    REFERENCES `thisbank`.`branches` (`BranchID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `CustomerAccount`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `thisbank`.`customers` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `AccountTypeAccount`
    FOREIGN KEY (`AccountType`)
    REFERENCES `thisbank`.`accounttypes` (`AccountTypeID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

-- Create Transactions

 CREATE TABLE `thisbank`.`transactions` (
  `TransactionID` INT NOT NULL AUTO_INCREMENT,
  `TransactionType` INT,
  `AccountID` INT,
  `TransactionDate` DATETIME,
  `Amount` DECIMAL(13,4)
  ,PRIMARY KEY (`TransactionID`),
  INDEX `TransactionType_idx` (`TransactionType` ASC),
  INDEX `TransactionAccount_idx` (`AccountID` ASC),
  CONSTRAINT `TransactionType`
    FOREIGN KEY (`TransactionType`)
    REFERENCES `thisbank`.`transactiontypes` (`TransactionTypeID`)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT,
  CONSTRAINT `TransactionAccount`
    FOREIGN KEY (`AccountID`)
    REFERENCES `thisbank`.`accounts` (`AccountID`)
      ON DELETE RESTRICT
	ON UPDATE RESTRICT  
  );
  
 -- loans
 CREATE TABLE `thisbank`.`loans` (
  `LoanID` INT NOT NULL AUTO_INCREMENT,
  `LoanDescription` VARCHAR(200) NULL,
  `LoanType` INT NOT NULL,
  `LoanDuration` VARCHAR(10) NOT NULL,
  `StartDate` DATE NOT NULL,
  `AccountID` INT NOT NULL,
  PRIMARY KEY (`LoanID`),
  INDEX `LoanType_idx` (`LoanType` ASC),
  INDEX `AccountLoan_idx` (`AccountID` ASC),
  CONSTRAINT `LoanType`
    FOREIGN KEY (`LoanType`)
    REFERENCES `thisbank`.`loantypes` (`LoanTypeID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `AccountLoan`
    FOREIGN KEY (`AccountID`)
    REFERENCES `thisbank`.`accounts` (`AccountID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

  
 -- addressperson
 
 
 CREATE TABLE `thisbank`.`personaddresses` (
  `PersonAddressID` INT NOT NULL AUTO_INCREMENT,
  `PersonID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`PersonAddressID`),
  INDEX `PersonAddress_idx` (`PersonID` ASC),
  INDEX `AddressAddressID_idx` (`AddressID` ASC),
  CONSTRAINT `PersonAddress`
    FOREIGN KEY (`PersonID`)
    REFERENCES `thisbank`.`persons` (`PersonID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `AddressAddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `thisbank`.`addresses` (`AddressID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

	
	
 USE thisbank;

-- INSERT SOME VALUES INTO THE DATABASE
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Rose', 'Cook', '1945-11-07', 'rcook0@google.com.br', '(02)9131-3954', '0404-167-868', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Mary', 'Robertson', '1926-01-17', 'mrobertson1@liveinternet.ru', '(02)3364-9998', '0415-938-999', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Johnny', 'Hanson', '1933-10-24', 'jhanson2@unicef.org', '(07)4444-3333', '0409-330-000', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Paula', 'George', '1959-01-17', 'pgeorge3@usa.gov', '(07)4152-4725', '0409-303-000', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Craig', 'Lynch', '1975-05-02', 'clynch4@mozilla.com', '(07)4152-4309', '0403-099-888', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Phillip', 'Gilbert', '1977-08-10', 'pgilbert5@artisteer.com', '(07)4031-0339', '0490-000-999', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Earl', 'Mccoy', '1950-02-27', 'emccoy6@zdnet.com', '(07)4031-0339', '0420-000-999', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Ronald', 'Perkins', '1966-08-28', 'rperkins7@etsy.com', '(03)8559-3993', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Teresa', 'Bailey', '1978-02-23', 'tbailey8@qq.com', '(07)4390-5555', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Robert', 'Bryant', '1921-05-07', 'rbryant9@tmall.com', '(02)9433-9689', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Michael', 'Graham', '1929-12-17', 'mgrahama@weather.com', '(07)3332-0049', '0403-000-211', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Eugene', 'Dunn', '1971-09-23', 'edunnb@is.gd', '(03)8349-5550', '0415-153-095', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Ryan', 'Greene', '1991-02-12', 'rgreenec@omniture.com', '(07)4799-5233', '0419-930-952', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Wanda', 'Sullivan', '1928-11-11', 'wsullivand@nature.com', '(08)8590-3390', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Julie', 'Robinson', '1974-07-07', 'jrobinsone@bing.com', '(07)3152-9932', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Howard', 'Fox', '1924-07-18', 'hfoxf@wikispaces.com', '', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Paul', 'Wilson', '1994-08-07', 'pwilsong@nifty.com', '', '0427-950-499', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Denise', 'Hart', '1922-01-01', 'dharth@vkontakte.ru', '', '0423-490-903', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Robert', 'Clark', '1921-10-12', 'rclarki@studiopress.com', '(02)9422-0099', '0402-003-095', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Louise', 'Woods', '1928-08-23', 'lwoodsj@ycombinator.com', '', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Mildred', 'Montgomery', '1981-04-06', 'mmontgomeryk@examiner.com', '', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Shirley', 'Watson', '1990-12-19', 'swatsonl@cyberchimps.com', '', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Catherine', 'Olson', '1972-01-29', 'colsonm@meetup.com', '', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Margaret', 'Griffin', '1939-11-14', 'mgriffinn@economist.com', '(07)4309-0958', '0490-023-102', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Lillian', 'Jacobs', '1961-07-14', 'ljacobso@myspace.com', '(02)9490-0876', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Jacqueline', 'Allen', '1945-03-15', 'jallenp@purevolume.com', '', '0430-493-085', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Shirley', 'Evans', '1934-09-21', 'sevansq@xinhuanet.com', '', '0428-088-983', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Todd', 'Mitchell', '1995-03-27', 'tmitchellr@odnoklassniki.ru', '(07)3328-0932', '0402-999-182', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Linda', 'Rogers', '1922-11-12', 'lrogerss@harvard.edu', '(07)4393-0455', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Kenneth', 'Long', '1924-02-22', 'klongt@huffingtonpost.com', '(07)3152-3332', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Julie', 'Cooper', '1991-06-20', 'jcooperu@businesswire.com', '(07)3156-9998', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Todd', 'Garcia', '1943-02-01', 'tgarciav@nasa.gov', '', '0413-444-383', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Gloria', 'Williams', '1940-03-19', 'gwilliamsw@hhs.gov', '(07)3338-0844', '0415-839-493', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Mary', 'Lawrence', '1934-05-23', 'mlawrencex@nymag.com', '(07)3321-0983', '0409-031-8192', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Laura', 'Rivera', '1982-07-14', 'lriveray@ucoz.ru', '(07)4339-2987', '0435-220-784', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Wayne', 'Rogers', '1933-07-02', 'wrogersz@whitehouse.gov', '(07)3321-1229', '4703-719-362', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Maria', 'Gilbert', '1960-02-23', 'mgilbert10@huffingtonpost.com', '', '0443-416-6117', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Maria', 'Cole', '1933-03-25', 'mcole11@sphinn.com', '(07)4339-2928', '0432-904-0625', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Teresa', 'Pierce', '1981-10-23', 'tpierce12@ask.com', '(07)3321-0887', '9-(840)077-1934', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Fred', 'Rice', '1929-11-17', 'frice13@shutterfly.com', '(07)4339-2983', '0433-137-7897', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Dennis', 'Hayes', '1973-05-01', 'dhayes14@dot.gov', '0-(483)512-4389', '0470-692-1272', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Douglas', 'Mendoza', '1962-02-13', 'dmendoza15@bloomberg.com', '(07)4339-2939', '0406-706-2849', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Raymond', 'Ross', '1956-09-22', 'rross16@sciencedirect.com', '(07)3321-0988', '0428-599-3718', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Ruth', 'Black', '1935-02-26', 'rblack17@amazon.com', '(07)4339-2982', '0428-989-7361', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Kathleen', 'Stewart', '1957-08-14', 'kstewart18@privacy.gov.au', '(07)3321-0283', '0403-229-183', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Amy', 'Watkins', '1985-07-27', 'awatkins19@deliciousdays.com', '', '0480-796-4120', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Jeffrey', 'Jones', '1968-03-06', 'jjones1a@cornell.edu', '(07)3321-0938', '0448-583-2438', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Arthur', 'Jordan', '1975-07-02', 'ajordan1b@washingtonpost.com', '(07)3321-1111', '0479-856-1511', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Carlos', 'Austin', '1943-04-29', 'caustin1c@over-blog.com', '(07)4339-2982', '0454-343-2699', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Scott', 'Walker', '1928-10-08', 'swalker1d@baidu.com', '(07)3321-0987', '0403-229-119', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Antonio', 'Lee', '1994-05-07', 'alee1e@aol.com', '(07)4339-2982', '0440-277-8583', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Janice', 'Nelson', '1967-02-14', 'jnelson1f@simplemachines.org', '(07)3321-0938', '0403-229-283', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Jimmy', 'Duncan', '1964-07-09', 'jduncan1g@sohu.com', '5-(127)041-0048', '0495-141-1418', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Steve', 'Richardson', '1995-10-07', 'srichardson1h@hhs.gov', '(07)3321-0123', '0416-850-4374', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Earl', 'Greene', '1986-02-21', 'egreene1i@state.tx.us', '(02)9092-9387', '0411-242-6543', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Anna', 'Rice', '1970-10-29', 'arice1j@yellowpages.com', '(07)4599-4983', '0403-229-193', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Kathleen', 'Oliver', '1930-07-24', 'koliver1k@shutterfly.com', '(07)3321-0112', '0446-897-8366', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Wayne', 'Hawkins', '1974-07-07', 'whawkins1l@time.com', '(02)9092-9298', '0403-229-181', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Paul', 'Robinson', '1964-12-18', 'probinson1m@usgs.gov', '(02)9092-1928', '0455-393-3826', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Laura', 'Barnes', '1954-02-24', 'lbarnes1n@jimdo.com', '(07)4599-4929', '0403-229-183', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Joe', 'Cole', '1989-07-12', 'jcole1o@pen.io', '(07)3321-0388', '0440-265-5379', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Larry', 'Frazier', '1941-09-22', 'lfrazier1p@yahoo.com', '(02)9092-9328', '0471-046-0286', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Carol', 'Anderson', '1935-10-21', 'canderson1q@yandex.ru', '(07)4599-1938', '0403-292-428', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Rachel', 'Wilson', '1952-06-09', 'rwilson1r@ucoz.ru', '(07)3321-0229', '0472-589-3688', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Bobby', 'Chavez', '1928-06-09', 'bchavez1s@istockphoto.com', '(02)9092-9192', '0403-292-418', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Steven', 'Morgan', '1978-05-02', 'smorgan1t@amazon.com', '(07)4599-4288', '0450-297-9825', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Brian', 'Cruz', '1967-11-04', 'bcruz1u@tumblr.com', '(07)3321-2938', '0406-809-8184', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Margaret', 'Ortiz', '1933-06-27', 'mortiz1v@google.de', '(02)9092-9298', '0403-292-410', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Nicholas', 'Miller', '1945-06-20', 'nmiller1w@bravesites.com', '(07)4599-4287', '0433-662-6299', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Bonnie', 'Garcia', '1979-07-22', 'bgarcia1x@engadget.com', '(07)3321-0182', '0471-014-9740', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Andrea', 'Morgan', '1958-12-31', 'amorgan1y@imageshack.us', '(07)4599-4388', '0403-292-411', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Brenda', 'Howell', '1978-01-23', 'bhowell1z@bloglines.com', '(02)9092-1938', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Helen', 'Wright', '1932-07-16', 'hwright20@msn.com', '(07)3321-0921', '0403-292-491', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Eugene', 'Lewis', '1962-01-19', 'elewis21@miibeian.gov.cn', '(02)9092-9329', '0403-293-292', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Clarence', 'Allen', '1955-02-21', 'callen22@studiopress.com', '(07)4599-4187', '0403-293-291', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Amy', 'Ellis', '1957-01-21', 'aellis23@ihg.com', '', '0-(224)443-3987', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Christopher', 'Fisher', '1941-09-23', 'cfisher24@google.ru', '(07)3321-0192', '0403-293-382', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Brenda', 'Alexander', '1939-04-26', 'balexander25@apple.com', '(02)9092-9210', '0405-037-282', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Christine', 'Morris', '1922-06-02', 'cmorris26@msu.edu', '(07)3321-0192', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Jesse', 'Perez', '1994-09-12', 'jperez27@woothemes.com', '(07)4599-4287', '0405-038-382', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Christina', 'Owens', '1946-03-19', 'cowens28@phpbb.com', '(07)3321-0210', '0405-004-387', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Jason', 'Edwards', '1983-03-06', 'jedwards29@ft.com', '(02)9092-9389', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Stephanie', 'Alexander', '1971-05-31', 'salexander2a@nba.com', '(02)9092-2275', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Stephen', 'Graham', '1967-03-22', 'sgraham2b@msn.com', '(02)9871-8207', '0430-099-123', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Paula', 'Rodriguez', '1944-03-20', 'prodriguez2c@skype.com', '(07)4321-2944', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Craig', 'Wagner', '1938-09-08', 'cwagner2d@ucoz.ru', '(07)4599-4928', '0435-393-382', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Louise', 'Evans', '1987-01-03', 'levans2e@list-manage.com', '', '0439-156-069', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Catherine', 'Phillips', '1992-07-19', 'cphillips2f@china.com.cn', '', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Scott', 'Washington', '1967-06-18', 'swashington2g@booking.com', '(02)9152-3331', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Sean', 'Welch', '1933-11-03', 'swelch2h@pcworld.com', '', '0403-004-358', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Brenda', 'Reynolds', '1988-12-19', 'breynolds2i@bandcamp.com', '', '0427-636-548', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Donna', 'Larson', '1932-04-01', 'dlarson2j@home.pl', '(02)9403-1929', '0415-157-708', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Clarence', 'Murray', '1960-10-16', 'cmurray2k@mayoclinic.com', '', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Joe', 'Flores', '1923-08-06', 'jflores2l@blogger.com', '', '0405-004-555', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Henry', 'Wells', '1959-12-18', 'hwells2m@google.pl', '', '0411-112-301', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Eric', 'Brown', '1935-11-29', 'ebrown2n@intel.com', '(02)9333-0444', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Bobby', 'Mitchell', '1927-02-13', 'bmitchell2o@clickbank.net', '(07)4152-4000', '0403-005-111', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Paula', 'Lewis', '1971-08-17', 'plewis2p@newyorker.com', '(02)9144-3339', '', 0);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Dorothy', 'Harris', '1920-02-15', 'dharris2q@go.com', '(07)3443-0000', '', 1);
insert into persons (FirstName, LastName, DoB, EmailAddress, Phone, Mobile, Active) values ('Kevin', 'Stewart', '1976-03-06', 'kstewart2r@narod.ru', '(02)9110-3993', '', 1);

-- ADDRESSES

insert into addresses (addressline1, postcode, state) values ('55 Meadow Ridge Point', 3451, 'VIC');
insert into addresses (addressline1, postcode, state) values ('6031 Clemons Road', 4205, 'QLD');
insert into addresses (addressline1, postcode, state) values ('6553 Oneill Pass', 2487, 'NSW');
insert into addresses (addressline1, postcode, state) values ('27 Spenser Parkway', 4155, 'QLD');
insert into addresses (addressline1, postcode, state) values ('4229 Sauthoff Parkway', 2203, 'NSW');
insert into addresses (addressline1, postcode, state) values ('2551 Vernon Drive', 2485, 'NSW');
insert into addresses (addressline1, postcode, state) values ('799 Emmet Trail', 2029, 'NSW');
insert into addresses (addressline1, postcode, state) values ('12 Esker Alley', 4992, 'QLD');
insert into addresses (addressline1, postcode, state) values ('72 Northwestern Avenue', 3442, '');
insert into addresses (addressline1, postcode, state) values ('997 Lotheville Lane', 2482, 'NSW');
insert into addresses (addressline1, postcode, state) values ('90237 Myrtle Road', 4285, 'QLD');
insert into addresses (addressline1, postcode, state) values ('618 Green Pass', 2122, 'NSW');
insert into addresses (addressline1, postcode, state) values ('950 Debra Drive', 4579, 'QLD');
insert into addresses (addressline1, postcode, state) values ('25620 Fuller Hill', 4621, 'QLD');
insert into addresses (addressline1, postcode, state) values ('08383 Spenser Point', 2472, 'NSW');
insert into addresses (addressline1, postcode, state) values ('3 Pine View Drive', 4127, 'QLD');
insert into addresses (addressline1, postcode, state) values ('31 Melvin Parkway', 4055, 'QLD');
insert into addresses (addressline1, postcode, state) values ('2360 Fairview Pass', 4435, 'QLD');
insert into addresses (addressline1, postcode, state) values ('41 Kinsman Park', 4763, 'QLD');
insert into addresses (addressline1, postcode, state) values ('6 Carey Trail', 2299, 'NSW');
insert into addresses (addressline1, postcode, state) values ('620 Algoma Place', 4760, 'QLD');
insert into addresses (addressline1, postcode, state) values ('2 Forest Avenue', 4592, 'QLD');
insert into addresses (addressline1, postcode, state) values ('49381 Commercial Park', 4079, 'QLD');
insert into addresses (addressline1, postcode, state) values ('499 Carberry Street', 3030, 'VIC');
insert into addresses (addressline1, postcode, state) values ('65080 Lien Center', 4762, 'QLD');
insert into addresses (addressline1, postcode, state) values ('8423 Susan Trail', 3687, 'VIC');
insert into addresses (addressline1, postcode, state) values ('54781 Declaration Place', 2620, 'NSW');
insert into addresses (addressline1, postcode, state) values ('6 Boyd Street', 2557, 'NSW');
insert into addresses (addressline1, postcode, state) values ('508 Marcy Hill', 2445, 'NSW');
insert into addresses (addressline1, postcode, state) values ('7219 Utah Parkway', 3682, 'VIC');
insert into addresses (addressline1, postcode, state) values ('71150 Boyd Park', 3782, 'VIC');
insert into addresses (addressline1, postcode, state) values ('248 8th Court', 4254, 'QLD');
insert into addresses (addressline1, postcode, state) values ('9 Bellgrove Point', 3314, 'VIC');
insert into addresses (addressline1, postcode, state) values ('54 Cardinal Pass', 2950, 'NSW');
insert into addresses (addressline1, postcode, state) values ('0838 Spaight Circle', 4474, 'QLD');
insert into addresses (addressline1, postcode, state) values ('58205 Melrose Center', 3084, 'VIC');
insert into addresses (addressline1, postcode, state) values ('2 Stoughton Park', 4435, 'QLD');
insert into addresses (addressline1, postcode, state) values ('2 Sauthoff Drive', 4039, 'QLD');
insert into addresses (addressline1, postcode, state) values ('379 Iowa Street', 3775, 'VIC');
insert into addresses (addressline1, postcode, state) values ('36 Gale Center', 4453, 'QLD');
insert into addresses (addressline1, postcode, state) values ('50639 Helena Street', 3346, 'VIC');
insert into addresses (addressline1, postcode, state) values ('549 Warrior Place', 3994, 'VIC');
insert into addresses (addressline1, postcode, state) values ('82587 Dapin Drive', 4822, 'QLD');
insert into addresses (addressline1, postcode, state) values ('2368 Ridgeview Alley', 2921, '');
insert into addresses (addressline1, postcode, state) values ('46 Portage Road', 4869, 'QLD');
insert into addresses (addressline1, postcode, state) values ('5076 Bay Court', 2377, 'NSW');
insert into addresses (addressline1, postcode, state) values ('6 Heffernan Way', 3291, 'VIC');
insert into addresses (addressline1, postcode, state) values ('468 Nova Plaza', 4597, 'QLD');
insert into addresses (addressline1, postcode, state) values ('354 Crest Line Hill', 3796, 'VIC');
insert into addresses (addressline1, postcode, state) values ('6 Meadow Valley Plaza', 4470, 'QLD');
insert into addresses (addressline1, postcode, state) values ('5976 Rieder Junction', 4480, 'QLD');
insert into addresses (addressline1, postcode, state) values ('56 Macpherson Junction', 3958, 'VIC');
insert into addresses (addressline1, postcode, state) values ('985 Graceland Park', 4001, 'QLD');
insert into addresses (addressline1, postcode, state) values ('5947 Village Parkway', 3049, 'VIC');
insert into addresses (addressline1, postcode, state) values ('346 Crowley Place', 3360, 'VIC');
insert into addresses (addressline1, postcode, state) values ('6560 Farmco Place', 3460, 'VIC');
insert into addresses (addressline1, postcode, state) values ('3885 Nelson Center', 3269, 'VIC');
insert into addresses (addressline1, postcode, state) values ('5 Thompson Road', 2841, 'NSW');
insert into addresses (addressline1, postcode, state) values ('9730 Surrey Plaza', 4464, 'QLD');
insert into addresses (addressline1, postcode, state) values ('25 Cottonwood Avenue', 2571, 'NSW');
insert into addresses (addressline1, postcode, state) values ('85103 Melody Street', 2371, 'NSW');
insert into addresses (addressline1, postcode, state) values ('61 Trailsway Hill', 4906, 'QLD');
insert into addresses (addressline1, postcode, state) values ('029 Maple Crossing', 2584, 'NSW');
insert into addresses (addressline1, postcode, state) values ('92425 Comanche Avenue', 4745, 'QLD');
insert into addresses (addressline1, postcode, state) values ('23 Lawn Pass', 4802, 'QLD');
insert into addresses (addressline1, postcode, state) values ('149 Lillian Alley', 2329, 'NSW');
insert into addresses (addressline1, postcode, state) values ('30 Judy Park', 2344, 'NSW');
insert into addresses (addressline1, postcode, state) values ('53955 Nevada Place', 2908, 'NSW');
insert into addresses (addressline1, postcode, state) values ('3849 Burning Wood Road', 4613, 'QLD');
insert into addresses (addressline1, postcode, state) values ('66 Carberry Park', 2427, 'NSW');
insert into addresses (addressline1, postcode, state) values ('838 Elmside Street', 4416, 'QLD');
insert into addresses (addressline1, postcode, state) values ('746 Swallow Place', 4800, 'QLD');
insert into addresses (addressline1, postcode, state) values ('80 Sutteridge Center', 4256, 'QLD');
insert into addresses (addressline1, postcode, state) values ('5066 Kingsford Plaza', 4787, 'QLD');
insert into addresses (addressline1, postcode, state) values ('592 Kenwood Hill', 4392, 'QLD');
insert into addresses (addressline1, postcode, state) values ('92330 Amoth Drive', 4444, 'QLD');
insert into addresses (addressline1, postcode, state) values ('1 Delaware Park', 4229, 'QLD');
insert into addresses (addressline1, postcode, state) values ('14 Esker Place', 2481, 'NSW');
insert into addresses (addressline1, postcode, state) values ('2 Spaight Center', 4512, 'QLD');
insert into addresses (addressline1, postcode, state) values ('9972 Brown Hill', 4761, 'QLD');
insert into addresses (addressline1, postcode, state) values ('54 Bartillon Hill', 4489, 'QLD');
insert into addresses (addressline1, postcode, state) values ('516 Bayside Road', 4002, 'QLD');
insert into addresses (addressline1, postcode, state) values ('6787 Sherman Junction', 2135, 'NSW');
insert into addresses (addressline1, postcode, state) values ('333 Pennsylvania Street', 2438, 'NSW');
insert into addresses (addressline1, postcode, state) values ('6 Barby Junction', 4537, 'QLD');
insert into addresses (addressline1, postcode, state) values ('3 Doe Crossing Pass', 2838, 'NSW');
insert into addresses (addressline1, postcode, state) values ('0 Rutledge Alley', 2508, 'NSW');
insert into addresses (addressline1, postcode, state) values ('03 Ludington Place', 4361, 'QLD');
insert into addresses (addressline1, postcode, state) values ('49703 Buena Vista Place', 2136, 'NSW');
insert into addresses (addressline1, postcode, state) values ('260 Mandrake Hill', 4865, 'QLD');
insert into addresses (addressline1, postcode, state) values ('17109 Clemons Street', 2026, 'NSW');
insert into addresses (addressline1, postcode, state) values ('601 Commercial Drive', 4534, 'QLD');
insert into addresses (addressline1, postcode, state) values ('9989 Ruskin Junction', 4315, 'QLD');
insert into addresses (addressline1, postcode, state) values ('1 Service Park', 4824, 'QLD');
insert into addresses (addressline1, postcode, state) values ('7836 Hanover Junction', 3729, 'VIC');
insert into addresses (addressline1, postcode, state) values ('77731 Manufacturers Lane', 2715, 'NSW');
insert into addresses (addressline1, postcode, state) values ('2958 Warbler Place', 2434, 'NSW');
insert into addresses (addressline1, postcode, state) values ('646 Ilene Street', 2179, 'NSW');
insert into addresses (addressline1, postcode, state) values ('99 Grasskamp Circle', 4588, 'QLD');
insert into addresses (addressline1, postcode, state) values ('35 Coleman Street', 4550, 'QLD');

-- person addresses


insert into personaddresses (addressid, personid) values (81, 105);
insert into personaddresses (addressid, personid) values (1, 113);
insert into personaddresses (addressid, personid) values (83, 107);
insert into personaddresses (addressid, personid) values (72, 163);
insert into personaddresses (addressid, personid) values (46, 129);
insert into personaddresses (addressid, personid) values (78, 163);
insert into personaddresses (addressid, personid) values (99, 194);
insert into personaddresses (addressid, personid) values (89, 105);
insert into personaddresses (addressid, personid) values (12, 200);
insert into personaddresses (addressid, personid) values (21, 116);
insert into personaddresses (addressid, personid) values (1, 181);
insert into personaddresses (addressid, personid) values (28, 147);
insert into personaddresses (addressid, personid) values (69, 162);
insert into personaddresses (addressid, personid) values (18, 114);
insert into personaddresses (addressid, personid) values (7, 193);
insert into personaddresses (addressid, personid) values (17, 130);
insert into personaddresses (addressid, personid) values (77, 105);
insert into personaddresses (addressid, personid) values (95, 138);
insert into personaddresses (addressid, personid) values (56, 135);
insert into personaddresses (addressid, personid) values (77, 188);
insert into personaddresses (addressid, personid) values (89, 168);
insert into personaddresses (addressid, personid) values (78, 155);
insert into personaddresses (addressid, personid) values (28, 147);
insert into personaddresses (addressid, personid) values (23, 167);
insert into personaddresses (addressid, personid) values (59, 177);
insert into personaddresses (addressid, personid) values (51, 179);
insert into personaddresses (addressid, personid) values (12, 117);
insert into personaddresses (addressid, personid) values (53, 172);
insert into personaddresses (addressid, personid) values (65, 149);
insert into personaddresses (addressid, personid) values (53, 194);
insert into personaddresses (addressid, personid) values (92, 161);
insert into personaddresses (addressid, personid) values (69, 126);
insert into personaddresses (addressid, personid) values (67, 145);
insert into personaddresses (addressid, personid) values (2, 128);
insert into personaddresses (addressid, personid) values (38, 168);
insert into personaddresses (addressid, personid) values (94, 145);
insert into personaddresses (addressid, personid) values (48, 125);
insert into personaddresses (addressid, personid) values (13, 163);
insert into personaddresses (addressid, personid) values (26, 151);
insert into personaddresses (addressid, personid) values (71, 187);
insert into personaddresses (addressid, personid) values (40, 166);
insert into personaddresses (addressid, personid) values (66, 182);
insert into personaddresses (addressid, personid) values (30, 134);
insert into personaddresses (addressid, personid) values (63, 141);
insert into personaddresses (addressid, personid) values (60, 183);
insert into personaddresses (addressid, personid) values (54, 184);
insert into personaddresses (addressid, personid) values (89, 177);
insert into personaddresses (addressid, personid) values (97, 167);
insert into personaddresses (addressid, personid) values (60, 142);
insert into personaddresses (addressid, personid) values (14, 158);
insert into personaddresses (addressid, personid) values (13, 124);
insert into personaddresses (addressid, personid) values (29, 160);
insert into personaddresses (addressid, personid) values (4, 116);
insert into personaddresses (addressid, personid) values (84, 139);
insert into personaddresses (addressid, personid) values (24, 125);
insert into personaddresses (addressid, personid) values (46, 188);
insert into personaddresses (addressid, personid) values (98, 160);
insert into personaddresses (addressid, personid) values (76, 125);
insert into personaddresses (addressid, personid) values (92, 171);
insert into personaddresses (addressid, personid) values (2, 184);
insert into personaddresses (addressid, personid) values (37, 143);
insert into personaddresses (addressid, personid) values (81, 129);
insert into personaddresses (addressid, personid) values (4, 187);
insert into personaddresses (addressid, personid) values (87, 200);
insert into personaddresses (addressid, personid) values (67, 197);
insert into personaddresses (addressid, personid) values (96, 117);
insert into personaddresses (addressid, personid) values (17, 153);
insert into personaddresses (addressid, personid) values (75, 149);
insert into personaddresses (addressid, personid) values (4, 174);
insert into personaddresses (addressid, personid) values (96, 161);
insert into personaddresses (addressid, personid) values (28, 142);
insert into personaddresses (addressid, personid) values (39, 165);
insert into personaddresses (addressid, personid) values (22, 117);
insert into personaddresses (addressid, personid) values (48, 172);
insert into personaddresses (addressid, personid) values (48, 142);
insert into personaddresses (addressid, personid) values (19, 171);
insert into personaddresses (addressid, personid) values (58, 176);
insert into personaddresses (addressid, personid) values (13, 175);
insert into personaddresses (addressid, personid) values (7, 157);
insert into personaddresses (addressid, personid) values (17, 195);
insert into personaddresses (addressid, personid) values (32, 139);
insert into personaddresses (addressid, personid) values (50, 140);
insert into personaddresses (addressid, personid) values (50, 170);
insert into personaddresses (addressid, personid) values (9, 179);
insert into personaddresses (addressid, personid) values (86, 194);
insert into personaddresses (addressid, personid) values (36, 150);
insert into personaddresses (addressid, personid) values (51, 149);
insert into personaddresses (addressid, personid) values (36, 175);
insert into personaddresses (addressid, personid) values (23, 146);
insert into personaddresses (addressid, personid) values (42, 132);
insert into personaddresses (addressid, personid) values (3, 175);
insert into personaddresses (addressid, personid) values (27, 163);
insert into personaddresses (addressid, personid) values (14, 138);
insert into personaddresses (addressid, personid) values (11, 108);
insert into personaddresses (addressid, personid) values (11, 121);
insert into personaddresses (addressid, personid) values (71, 175);
insert into personaddresses (addressid, personid) values (36, 167);
insert into personaddresses (addressid, personid) values (7, 178);
insert into personaddresses (addressid, personid) values (6, 145);
insert into personaddresses (addressid, personid) values (9, 112);

-- bank account types
insert into accounttypes (accounttypedescription, accountinterest) values ('Savings', 0.03);
insert into accounttypes (accounttypedescription, accountinterest) values ('Cheque', 0.03);
insert into accounttypes (accounttypedescription, accountinterest) values ('Loan', 0.00);
insert into accounttypes (accounttypedescription, accountinterest) values ('Term Deposit', 0.04);

-- branches`
insert into branches (branchname, branchphone) values ('Brisbane', '(07)3194-4944');
insert into branches (branchname, branchphone) values ('Sydney', '(02)9222-9999');

-- customers
insert into customers (createdate, active, personID) values (now(), 1, 102);
insert into customers (createdate, active, personID) values (now(), 1, 105);
insert into customers (createdate, active, personID) values (now(), 1, 110);
insert into customers (createdate, active, personID) values (now(), 1, 102);
insert into customers (createdate, active, personID) values (now(), 1, 112);
insert into customers (createdate, active, personID) values (now(), 1, 120);
insert into customers (createdate, active, personID) values (now(), 1, 141);
insert into customers (createdate, active, personID) values (now(), 1, 158);
insert into customers (createdate, active, personID) values (now(), 1, 171

-- roles
insert into roles (roledescription) values ('Admin'),('Customer');

-- users (please update with your Details)
insert into persons (firstname, lastname, dob, emailaddress, active) values ('Lara','Wilson','1985-05-16','larissa.wilkinson@gmail.com', 1);
insert into persons (firstname, lastname, dob, emailaddress, active) values ('Brett','Ayre','1985-05-16','larissa.wilkinson@gmail.com', 1);
insert into persons (firstname, lastname, dob, emailaddress, active) values ('Melissa','Thompson','1985-05-16','larissa.wilkinson@gmail.com', 1);

insert into users (personid, role, login, password, active) values (201, 1, 'lwilson','password', 1);
insert into users (personid, role, login, password, active) values (202, 1, 'bayre','password', 1);
insert into users (personid, role, login, password, active) values (203, 1, 'mthompson','password', 1);

-- loan types
insert into loantypes (loantypedescription, loaninterest) values ('Personal', 0.15),('Home', 0.05),('Secure', 0.15);

-- accounts
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2015-01-01',1,2);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2015-01-01',2,2);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2013-05-01',1,2);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2014-05-01',1,2);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2014-05-01',2,2);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2015-03-08',2,3);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2015-03-08',1,3);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2013-01-16',1,4);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2013-01-16',2,4);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2012-01-25',1,5);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2012-01-25',2,5);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (5, 1, '2015-03-03',1,7);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (5, 1, '2015-04-03',2,8);
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (5, 1, '2015-05-03',1,9);

-- loans
insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2014-01-01',3,2);
insert into loans (LoanDescription, LoanType, LoanDuration, StartDate, AccountID) values ('Car Loan', 1, '2 years', '2014-01-01', (select max(accountid) from accounts where accounttype = 3));

insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2014-06-01',3,6);
insert into loans (LoanDescription, LoanType, LoanDuration, StartDate, AccountID) values ('Home Loan', 2, '5 years', '2014-06-01', (select max(accountid) from accounts where accounttype = 3));

insert into accounts (openbranch, active, opendate, accounttype, customerid) values (3,1,'2014-05-01',3,10);
insert into loans (LoanDescription, LoanType, LoanDuration, StartDate, AccountID) values ('Secure Loan', 3, '3 years', '2014-05-01', (select max(accountid) from accounts where accounttype = 3));


-- transactiontypes
insert into transactiontypes (transactiontypedesc) values ('Credit'),('Debit');

-- transactions`

-- INITIAL DEPOSITS - insert $1000 into all savings accounts

insert into transactions (TransactionType, AccountID, TransactionDate, Amount)
select 1, accountid, now(), 1000.00
from accounts 
where accounttype = 1;


-- INITIAL DEPOSITS - insert $2000 into all cheque accounts
insert into transactions (TransactionType, AccountID, TransactionDate, Amount)
select 1, accountid, now(), 2000.00
from accounts 
where accounttype = 2;


-- INITIAL DEPOSITS - insert $10000 into all loan accounts
insert into transactions (TransactionType, AccountID, TransactionDate, Amount)
select 1, accountid, now(), 10000.00
from accounts 
where accounttype = 3;

