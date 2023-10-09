-- Granting all the necessary privileges to user 'andrew' to allow working with the storage database

CREATE USER 'andrew'@'localhost' IDENTIFIED BY 'password'; -> 
GRANT CREATE, EVENT, DELETE, INSERT, UPDATE, SELECT ON storage.* TO 'andrew'@'localhost';
FLUSH PRIVILEGES;