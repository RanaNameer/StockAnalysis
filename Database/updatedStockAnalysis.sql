/* Stock Analysis */

/*Dropping already existing database*/
DROP SCHEMA IF EXISTS `Stock Analysis` ;
/*Creating Database Stock Analysis*/
CREATE SCHEMA IF NOT EXISTS `Stock Analysis`;

/*Setting Foreign Key Checks to 0 to avoid any kind of inconvenience.*/
SET FOREIGN_KEY_CHECKS = 0;

/*To remove any kind of unwanted warning*/
SET SQL_NOTES=0;

/*Using database to add tables into it.*/
USE `Stock Analysis` ;


/*Dropping already existing 'Exchange' table in StockAnalysis*/
DROP TABLE IF EXISTS `Exchange` ;
/*Creating 'Exchange' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Exchange` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


/*Dropping already existing 'Points' table in StockAnalysis*/
DROP TABLE IF EXISTS `Points` ;
/*Creating 'Points' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Points` (
  `Date` INT NOT NULL,
  `Points Gain` INT NOT NULL,
  `Exchange ID` INT NULL,
 FOREIGN KEY (`Exchange ID`) REFERENCES `Exchange` (`ID`));


/*Dropping already existing 'Leader Board' table in StockAnalysis*/
DROP TABLE IF EXISTS `Leader Board` ;
/*Creating 'Leader Board' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Leader Board` (
  `Rank` INT NOT NULL,
  `Country Code` CHAR(4)NULL,
  `Return` FLOAT NULL,
  `Date` DATE NULL,
  FOREIGN KEY (`Country Code`) REFERENCES `Country`(`Country Code`),
  PRIMARY KEY (`Rank`));

/*Dropping already existing 'Market' table in StockAnalysis*/
DROP TABLE IF EXISTS `Market` ;
/*Creating 'Market' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Market` (
  `ID` INT NOT NULL,
  `Market Name` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Exchange ID` INT NULL,
  `Points Date` DATE NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Exchange ID`) REFERENCES `Exchange` (`ID`));


/*Dropping already existing 'Company' table in StockAnalysis*/
DROP TABLE IF EXISTS `Company` ;
/*Creating 'Company' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Company` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Exchange ID` INT NULL,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Exchange ID`) REFERENCES `exchange` (`ID`));


/*Dropping already existing 'Shares Leaderboard' table in StockAnalysis*/
DROP TABLE IF EXISTS `Shares Leaderboard` ;
/*Creating 'Shares Leaderboard' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Shares Leaderboard` (
	`Rank` INT NOT NULL,
    `Name` VARCHAR(45) NOT NULL,
    `Divedent Yeild %` INT NOT NULL,
    `Country` VARCHAR(45) NOT NULL,
    `Year` INT NOT NULL,
  PRIMARY KEY (`Rank`));


/*Dropping already existing 'Shares' table in StockAnalysis*/
DROP TABLE IF EXISTS `Shares` ;
/*Creating 'Shares' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Shares` (
   `ID` INT NOT NULL,
   `DATE` DATE,
  `Open` FLOAT NULL,
  `Upper Cap` FLOAT NULL,
  `Lower Cap` FLOAT NULL,
  `Close` FLOAT NULL,
  `Volume` BIGINT NULL,
  `Company ID` INT NOT NULL,
   
   PRIMARY KEY(`ID`),
  FOREIGN KEY (`Company ID`) REFERENCES `company` (`ID`));
  


/*Dropping already existing 'Buyer' table in StockAnalysis*/
DROP TABLE IF EXISTS `Buyer` ;
/*Creating 'Buyer' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Buyer` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Balance` FLOAT NULL,
  `Exchange ID` INT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Exchange ID`) REFERENCES `Exchange` (`ID`));


/*Dropping already existing 'Seller' table in StockAnalysis*/
DROP TABLE IF EXISTS `Seller` ;
/*Creating 'Seller' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Seller` (
  `ID` INT NOT NULL,
   `Name` VARCHAR(45) NULL,
  `Balance` DECIMAL NULL,
  `Exchange ID` INT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Exchange ID`) REFERENCES `Exchange` (`ID`));


/*Dropping already existing 'Consultancy Firm' table in StockAnalysis*/
DROP TABLE IF EXISTS `Consultancy Firm` ;
/*Creating 'Consultancy Firm' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Consultancy Firm` (
  `ID` INT NOT NULL,
  `Exchange ID` INT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Exchange ID`) REFERENCES `Exchange` (`ID`));


/*Dropping already existing 'Stock Quote' table in StockAnalysis*/
DROP TABLE IF EXISTS `Stock Quote` ;
/*Creating 'Stock Quote' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Stock Quote` (
  `Offer` INT NULL,
  `Bid` INT NULL,
  `Prev Close` INT NULL,
  `Company ID` INT NOT NULL,
  FOREIGN KEY (`Company ID`) REFERENCES `Company` (`ID`));


/*Dropping already existing 'Share Holder' table in StockAnalysis*/
DROP TABLE IF EXISTS `Share Holder` ;
/*Creating 'Share Holder' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Share Holder` (
  `ID` INT NOT NULL,
  `Consultancy Firm ID` INT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Consultancy Firm ID`) REFERENCES `Consultancy Firm` (`ID`));


/*Dropping already existing 'Transaction Log' table in StockAnalysis*/
DROP TABLE IF EXISTS `Transaction Log` ;
/*Creating 'Transaction Log' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Transaction Log` (
  `Buyer ID` INT NULL,
  `Shares ID` INT NULL,
  FOREIGN KEY (`Buyer ID`) REFERENCES `Buyer` (`ID`),
  FOREIGN KEY (`Shares ID`) REFERENCES `Shares` (`ID`));
  
  
  
  /*Dropping already existing 'Country' table in StockAnalysis*/
DROP TABLE IF EXISTS `Country` ;
/*Creating 'Exchange' table in StockAnalysis*/
CREATE TABLE IF NOT EXISTS `Country` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Country Code` CHAR(4) NOT NULL,
  PRIMARY KEY (`Country Code`));
  
/*Setting foreign key checks back to 1*/
SET FOREIGN_KEY_CHECKS = 1;