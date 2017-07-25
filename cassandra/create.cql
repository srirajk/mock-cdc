CREATE KEYSPACE test WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
USE test;
CREATE TABLE user(id int PRIMARY KEY, email text, name text);
