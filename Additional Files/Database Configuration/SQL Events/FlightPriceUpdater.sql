-- Prerequisites:

SET GLOBAL event_scheduler = ON;
USE storage;

-----------------------------------------------------

CREATE EVENT FlightPriceUpdater
ON SCHEDULE
EVERY 120 SECOND STARTS TIMESTAMP("2022-04-22")
DO
UPDATE storage.prices SET price=FLOOR(100+RAND()*(5000-100+1)) WHERE identifier in ('1','2','3','4','5','6');