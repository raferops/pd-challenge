CREATE USER 'notes-api'@'localhost' IDENTIFIED BY 'notes-api';                                                 
GRANT ALL PRIVILEGES ON notes.* TO 'notes-api'@'localhost';
GRANT ALL PRIVILEGES ON notes.* TO 'notes-api'@'%';
ALTER USER 'notes-api'@'%' IDENTIFIED WITH mysql_native_password BY 'notes-api';
ALTER USER 'notes-api'@'localhost' IDENTIFIED WITH mysql_native_password BY 'notes-api';
FLUSH PRIVILEGES;
