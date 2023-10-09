-- Create Database
CREATE DATABASE storage;

-- Create Table named prices
CREATE  TABLE `storage`.`prices` (
  `identifier` INT  AUTO_INCREMENT ,
  `price` VARCHAR(4) NOT NULL ,
  PRIMARY KEY (`identifier`) )
ENGINE = InnoDB;

-- Fill the column named price in the table named prices with values
INSERT INTO `storage`.`prices` (`identifier`, `price`) VALUES (NULL, '1'), (NULL, '2'), (NULL, '3'), (NULL, '4'), (NULL, '5'), (NULL, '6');

-- Create Table named altered_prices
CREATE  TABLE `storage`.`altered_prices` (
  `identifier` INT  AUTO_INCREMENT ,
  `price` VARCHAR(4) NOT NULL ,
  PRIMARY KEY (`identifier`) )
ENGINE = InnoDB;

-- Fill the column named price in the table named altered_prices with values
INSERT INTO `storage`.`altered_prices` (`identifier`, `price`) VALUES (NULL, '1'), (NULL, '2'), (NULL, '3'), (NULL, '4'), (NULL, '5'), (NULL, '6');

-- Setting event_scheduler system variable to ON
SET GLOBAL event_scheduler = ON;

-- Selecting database
USE storage;

-- Setting up event which updates the respective rows of the price column of the prices table every 120 seconds with a random number
-- between 100 and 5000 (inclusive) using the RAND() function and then rounds it down to the nearest integer using FLOOR()
-- to simualte frequently changing item/stock prices

CREATE EVENT FlightPriceUpdater
ON SCHEDULE
EVERY 120 SECOND STARTS TIMESTAMP("2022-04-22")
DO
UPDATE storage.prices SET price=FLOOR(100+RAND()*(5000-100+1)) WHERE identifier in ('1','2','3','4','5','6');

-- Setting up event which updates the respective rows of the price column of the altered_prices table every 120 seconds 
-- It copies the value of the price column from the prices table to the price column of the altered_prices table

CREATE EVENT DummyValueCopier
ON SCHEDULE
EVERY 120 SECOND STARTS TIMESTAMP("2022-04-22")
DO
UPDATE storage.altered_prices INNER JOIN storage.prices
    ON altered_prices.identifier = prices.identifier
SET altered_prices.price = prices.price;

-- Setting up event which updates the respective rows of the price column of the altered_prices table every 121 seconds
-- It multiplies the copied over values of the price column of the prices table by 1.2.

CREATE EVENT DummyValueAlterer
ON SCHEDULE
EVERY 121 SECOND STARTS TIMESTAMP("2022-04-22") + INTERVAL 1 SECOND
DO
UPDATE altered_prices SET altered_prices.price = (altered_prices.price * 1.2) WHERE altered_prices.identifier in ('1','2','3','4','5','6');