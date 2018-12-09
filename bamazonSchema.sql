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

INSERT INTO selling (item_name, price, inventory)
VALUES ("TV", 1500, 50);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Desk", 300, 80);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Laptop", 2500, 100);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Bed", 5000, 100);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Dining Table", 3500, 750);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Bar", 2400, 70);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Couch", 2000, 90);
INSERT INTO selling (item_name, price, inventory)
VALUES ("Fishing Pole", 50, 750);