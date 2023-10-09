-- Prerequisites:

SET GLOBAL event_scheduler = ON;
USE storage;

----------------------------------------------------

CREATE EVENT DummyValueAlterer
ON SCHEDULE
EVERY 121 SECOND STARTS TIMESTAMP("2022-04-22") + INTERVAL 1 SECOND
DO
UPDATE altered_prices SET altered_prices.price = (altered_prices.price * 1.2) WHERE altered_prices.identifier in ('1','2','3','4','5','6');