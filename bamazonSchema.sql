DROP DATABASE IF EXISTS bamazon_DB;
CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE selling(
  id INT NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(100) NOT NULL,
  quantity INT default 0,
  inventory INT default 100,
  price INT,
  PRIMARY KEY (id)
);

INSERT INTO selling (item_name, price)
VALUES ("TV", 1500);
INSERT INTO selling (item_name, price)
VALUES ("Desk", 300);
INSERT INTO selling (item_name, price)
VALUES ("Laptop", 2500);
INSERT INTO selling (item_name, price)
VALUES ("Bed", 5000);
INSERT INTO selling (item_name, price)
VALUES ("Dining Table", 3500);
INSERT INTO selling (item_name, price)
VALUES ("Bar", 2400);
INSERT INTO selling (item_name, price)
VALUES ("Couch", 2000);
INSERT INTO selling (item_name, price)
VALUES ("Fishing Pole", 50);