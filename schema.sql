CREATE DATABASE restaurant;

CREATE TABLE restaurant.Suppliers (
  `company_name` varchar(30) NOT NULL,
  `phone_number` int UNIQUE,
  `supplier_address` varchar(50) NOT NULL,
  PRIMARY KEY (company_name)
) ENGINE=InnoDB;

CREATE TABLE restaurant.Purchases (
  `supplier` varchar(30) NOT NULL,
  `product_supplied` varchar(30) NOT NULL,
  `purchase_price` float,
  `product_quantity` int,
  PRIMARY KEY (product_supplied, supplier),
  FOREIGN KEY (supplier) REFERENCES Suppliers(company_name)
) ENGINE=InnoDB;

CREATE TABLE restaurant.Inventory (
  `product_id` int NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `quantity_stored` int,
  `expiry_date` DATE DEFAULT NULL,
  PRIMARY KEY (product_id),
  FOREIGN KEY(product_name) REFERENCES Purchases(product_supplied)
) ENGINE=InnoDB;

CREATE TABLE restaurant.Menu (
  `dish_id` int NOT NULL,
  `dish_name` varchar(30),
  `dish_price` float,
  `size` varchar(15) DEFAULT 'Regular',
  `allergies` varchar(50) DEFAULT NULL,
  `ingredient_id` int,
  PRIMARY KEY (dish_id),
  FOREIGN KEY(ingredient_id) REFERENCES Inventory(product_id)
) ENGINE=InnoDB;

CREATE TABLE restaurant.Staff (
  `employee_number` int NOT NULL,
  `name` varchar(30),
  `address` varchar(50),
  `wages` float,
  `position` varchar(30),
  `months_employed` int DEFAULT 0,
  `bonus` float DEFAULT NULL,
  PRIMARY KEY (employee_number)
)  ENGINE=InnoDB;

CREATE TABLE restaurant.Sales (
  `order_number` int NOT NULL,
  `dish_id` int NOT NULL,
  `employee_number` int NOT NULL,
  `type_of_payment` varchar(30) DEFAULT 'cash',
  `date_of_sale` DATE,
  `total_price` float,
  `quantity` int,
  PRIMARY KEY (order_number),
  FOREIGN KEY (dish_id) REFERENCES Menu(dish_id),
  FOREIGN KEY (employee_number) REFERENCES Staff(employee_number)
)  ENGINE=InnoDB;

INSERT INTO restaurant.Suppliers
VALUES ('Barrys Bakery', 065756787, 'Main Street Limerick');

INSERT INTO restaurant.Suppliers
VALUES ('Limerick Poultry Supplier', 052815239, 'Coonagh Limerick');

INSERT INTO restaurant.Suppliers
VALUES ('Murphys Ice Cream', 061824345, 'Oola Tipperary');

INSERT INTO restaurant.Suppliers
VALUES ('Nortans', 051876725, 'Parteen Clare');

INSERT INTO restaurant.Suppliers
VALUES ('Fresh Fish Company', 061834556, 'Shannon Clare');

INSERT INTO restaurant.Suppliers
VALUES ('Bills Killer Food Supplies', NULL, 'Shannon Clare');

INSERT INTO restaurant.Purchases
VALUES ('Limerick Poultry Supplier', 'Chicken Breasts', 30.00, 30);

INSERT INTO restaurant.Purchases
VALUES ('Barrys Bakery', 'Bread Roll', 6.50, 4);

INSERT INTO restaurant.Purchases
VALUES ('Murphys Ice cream', 'Ice Cream', 15.00, 4);

INSERT INTO restaurant.Purchases
VALUES ('Nortans', '10KG Potatoes', 6, 1);

INSERT INTO restaurant.Purchases
VALUES ('Fresh Fish Company', 'Fish Fillets', 20, 60);

INSERT INTO restaurant.Purchases
VALUES ('Bills Killer Food Supplies', '10KG Potatoes', 4, 3);

INSERT INTO restaurant.Purchases
VALUES ('Nortans', 'Chicken Wings', 10.50, 20);

INSERT INTO restaurant.Inventory 
VALUES(1, 'Chicken Breasts', 30, '2019-11-22');

INSERT INTO restaurant.Inventory
VALUES(2, 'Bread roll',  4, '2019-11-15');

INSERT INTO restaurant.Inventory 
VALUES(3, 'Ice Cream', 4, '2020-01-22');

INSERT INTO restaurant.Inventory
VALUES(4, '10KG Potatoes', 5, '2020-02-26');

INSERT INTO restaurant.Inventory
VALUES(5, 'Fish Fillets', 62, '2019-11-24');

INSERT INTO restaurant.Inventory
VALUES(6, 'Chicken Breasts', 10, '2019-11-29');

INSERT INTO restaurant.Menu
VALUES (1, 'Tuna Roll & Chips', 6.10, DEFAULT, 'Gluten', 2);

INSERT INTO restaurant.Menu
VALUES (2, 'Battered Fish & Chips', 7.00, DEFAULT, 'Gluten', 5);

INSERT INTO restaurant.Menu
VALUES (3, 'Chicken Bucket', 10.50, 'Large', NULL, 1);

INSERT INTO restaurant.Menu
VALUES (4, 'Chicken Bucket', 8.50, 'Medium', NULL, 1);

INSERT INTO restaurant.Menu
VALUES (5, 'Ice Cream with Sprinkles', 3.25, 'Extra Large', 'Dairy, Eggs', 3);

INSERT INTO restaurant.Menu
VALUES (6, 'Chips', 2.00, 'Medium', DEFAULT, 4);

INSERT INTO restaurant.Menu
VALUES (7, 'Chips', 3.00, 'Large', DEFAULT, 4);

INSERT INTO restaurant.Staff
VALUES (1, 'Nicole Berty', '12 Penny Lane', 15.00, 'Cashier', 12, DEFAULT);

INSERT INTO restaurant.Staff
VALUES (2, 'Mighele Cavaliere', 'Mafia Mansion', 18.00, 'Chef', 23, DEFAULT);

INSERT INTO restaurant.Staff
VALUES (3, 'Sean Lynch', '22 SeanVilla Apartments', 12.50, 'Waiter', 7, DEFAULT);

INSERT INTO restaurant.Staff
VALUES (4, 'Mikey Donegan', 'The White House', 16.50, 'Cashier', 3, DEFAULT);

INSERT INTO restaurant.Staff
VALUES (5, 'Jim Bob', '22 SeanVilla Apartments', 15.00, 'Cashier', 30, DEFAULT);

INSERT INTO restaurant.Staff
VALUES (6, 'Sean Lynch', '1 Elm Park', 14.50, 'Chef', 10, DEFAULT);

INSERT INTO restaurant.Sales
VALUES(12345, 2, 1, 'Cash', '2019-10-08', 14, 2);

INSERT INTO restaurant.Sales
VALUES(12346, 3, 4, 'Credit Card', '2019-10-11', 21.0, 2);

INSERT INTO restaurant.Sales
VALUES(12347, 4, 5, 'Debit Card', '2019-11-11', 6.5, 2);

INSERT INTO restaurant.Sales
VALUES(12348, 3, 4, 'Cash', '2019-10-21', 10.5, 1);

INSERT INTO restaurant.Sales
VALUES(12349, 5, 1, 'Cash', '2019-11-03', 2, 1);

INSERT INTO restaurant.Sales
VALUES(12350, 2, 1, 'Cash', '2019-10-08', 14, 2);

INSERT INTO restaurant.Sales
VALUES(12351, 3, 4, 'Credit Card', '2019-10-11', 21.0, 2);

INSERT INTO restaurant.Sales
VALUES(12352, 4, 5, 'Debit Card', '2019-11-11', 6.5, 2);

INSERT INTO restaurant.Sales
VALUES(12353, 3, 4, 'Cash', '2019-10-21', 10.5, 1);

INSERT INTO restaurant.Sales
VALUES(12354, 5, 1, 'Cash', '2019-11-03', 2, 1);

INSERT INTO restaurant.Sales
VALUES(12355, 5, 1, 'Cash', '2019-11-05', 2, 1);

INSERT INTO restaurant.Sales
VALUES(12356, 5, 4, 'Cash', '2019-11-05', 2, 1);