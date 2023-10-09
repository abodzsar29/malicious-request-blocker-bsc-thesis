-- Prerequisites:

SET GLOBAL event_scheduler = ON;
USE storage;

-----------------------------------------------

CREATE EVENT DummyValueCopier
ON SCHEDULE
EVERY 120 SECOND STARTS TIMESTAMP("2022-04-22")
DO
UPDATE storage.altered_prices INNER JOIN storage.prices
    ON altered_prices.identifier = prices.identifier
SET altered_prices.price = prices.price;