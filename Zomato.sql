CREATE DATABASE ZOMATO

USE ZOMATO 

#Creating of Zomato Database

#Users table
CREATE TABLE user(user_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL, email VARCHAR(200) NOT NULL, password VARCHAR(255) NOT NULL, phone VARCHAR(20) NOT NULL, UNIQUE(email))

#Restaurants table
CREATE TABLE restaurants(restaurant_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255) NOT NULL, address VARCHAR(255) NOT NULL, phone VARCHAR(20) NOT NULL)

#Orders table
CREATE TABLE orders(order_id INT PRIMARY KEY AUTO_INCREMENT, user_id INT NOT NULL, driver_id INT NOT NULL, restaurant_id INT NOT NULL, order_total DECIMAL(10, 2) NOT NULL, delivery_status VARCHAR(20) NOT NULL, FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,  FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE,FOREIGN KEY(driver_id) REFERENCES drivers(driver_id) ON DELETE CASCADE)
ALTER TABLE orders AUTO_INCREMENT = 1
select *from orders

#Drivers table
CREATE TABLE drivers(driver_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255)
 NOT NULL, phone VARCHAR(20) NOT NULL, location VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL)

#Payment table
DROP TABLE payment
CREATE TABLE payment(payment_id INT PRIMARY KEY AUTO_INCREMENT, order_id INT NOT NULL, payment_method VARCHAR(20) NOT NULL, amount DECIMAL(10, 2) NOT NULL, status VARCHAR(20) NOT NULL, FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE CASCADE)

#Rating table
 
#Address table
CREATE TABLE address(address_id INT PRIMARY KEY AUTO_INCREMENT, user_id INT NOT NULL, state VARCHAR(50) NOT NULL, city VARCHAR(50) NOT NULL, street VARCHAR(50) NOT NULL, pincode INT NOT NULL, FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE)

#Menu table
CREATE TABLE menu(menu_id INT PRIMARY KEY AUTO_INCREMENT, restaurant_id INT NOT NULL, item_name VARCHAR(255) NOT NULL, price DECIMAL(10, 2) NOT NULL, FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE)

#Data Insertion
#Inserting User Data into User Table
INSERT INTO user(name, email, password, phone) VALUES("Muhammed", "ullrich.yasmine@ohara.com",  123456, 9662626),
("Ruben Dartt", "waelchi.tate@hotmail.com", 123456, 9662626),
("Liz Pelletier", "reyes.lemke@yahoo.com", 123456, 9662626),
("Jo Maela", "jbraun@gmail.com", 123456, 9662626),
("Liz Pelletier", "doyle.jaylon@koelpin.com", 123456, 9662626),
("Fernando Toninho", "scotty.ritchie@rau.com", 123456, 9662626),
("Julie Creighton", "bsatterfield@dicki.com", 123456, 9662626),
("Darius Baxter", "brekke.francis@schaefer.com", 123456, 9662626),
("Reina Cox", "bebert@gottlieb.com", 123456, 9662626),
("Jeramiah Murray", "clarabelle.anderson@morissette.net", 123456, 9662626)
SELECT *FROM USER

#Inserting restaurants Data into restaurants Table
INSERT INTO restaurants(name, address, phone) VALUES ("Delicious Bites Diner", "California", 5551234567),
("Savory Spice Shack", "New York", 5551234567),
("Ocean View Grill", "Florida", 5551234567),
("Rustic Eats Café", "Texas", 5551234567),
("Mountain Flavors Bistro", "Colorado", 5551234567),
("Urban Fusion Kitchen", "Illinois", 5551234567),
("Coastal Catch Seafood", "Massachusetts", 5551234567),
("Farm Fresh Delights", "Oregon", 5551234567),
("Spicy Sizzle Restaurant", "Arizona", 5551234567),
("Green Garden Café", "Washington", 5551234567)
SELECT *FROM restaurants

#Inserting Orders data into Orders Table
INSERT INTO orders(user_id, driver_id, restaurant_id, order_total, delivery_status) VALUES (1, 2, 1, 25.50, "Delivered"),
(2, 8, 2, 45.75, "In-Progress"),
(3, 3, 3, 32.25, "Delivered"),
(4, 3, 4, 18.90, "Delivered"),
(5, 2, 5, 50.00, "Delivered"),
(5, 7, 6, 27.80, "Cancelled"),
(7, 8, 7, 14.99, "Delivered"),
(3, 3, 8, 38.60, "In-Progress"),
(9, 3, 9, 62.45, "Delivered"),
(4, 2, 7, 19.75, "Delivered"),
(7, 7, 6, 19.75, "Delivered"),
(8, 3, 5, 19.75, "Delivered"),
(3, 9, 4, 19.75, "Delivered"),
(3, 4, 2, 19.75, "Delivered"),
(2, 7, 3, 19.75, "Delivered")
select *from orders

#Inserting Drivers data into Drivers Table
INSERT INTO drivers (name, phone, location, email) VALUES ('John Doe', '555-123-4567', 'New York', 'john.doe@email.com'),
('Alice Smith', '555-234-5678', 'Los Angeles', 'alice.smith@email.com'),
('Robert Johnson', '555-345-6789', 'Chicago', 'robert.johnson@email.com'),
('Emily Davis', '555-456-7890', 'Houston', 'emily.davis@email.com'),
('Michael Wilson', '555-567-8901', 'Miami', 'michael.wilson@email.com'),
('Linda Lee', '555-678-9012', 'San Francisco', 'linda.lee@email.com'),
('David Brown', '555-789-0123', 'Boston', 'david.brown@email.com'),
('Sarah White', '555-890-1234', 'Seattle', 'sarah.white@email.com'),
('James Miller', '555-901-2345', 'Denver', 'james.miller@email.com'),
('Karen Jones', '555-012-3456', 'Phoenix', 'karen.jones@email.com');
select *from drivers

#Inserting Payments data into Payments Table
INSERT INTO payment (order_id, payment_method, amount, status) VALUES 
(2, 'Credit Card', 25.50, 'Completed'),
(3, 'PayPal', 45.75, 'Completed'),
(4, 'Cash', 32.25, 'Pending'),
(6, 'Credit Card', 18.90, 'Completed'),
(9, 'Credit Card', 50.00, 'Completed'),
(9, 'PayPal', 27.80, 'Pending'),
(10, 'Cash', 14.99, 'Completed'),
(12, 'Credit Card', 38.60, 'Completed'),
(14, 'PayPal', 62.45, 'Completed'),
(8, 'Cash', 19.75, 'Pending'),
(15, 'Credit Card', 28.90, 'Completed'),
(16, 'PayPal', 37.25, 'Completed'),
(3, 'Cash', 15.50, 'Completed'),
(4, 'Credit Card', 49.99, 'Pending'),
(7, 'Credit Card', 30.00, 'Completed'),
(6, 'PayPal', 21.75, 'Completed'),
(11, 'Cash', 12.25, 'Completed'),
(13, 'Credit Card', 55.60, 'Completed'),
(8, 'PayPal', 40.95, 'Pending'),
(9, 'Cash', 17.45, 'Completed');
select *from payment

#Inserting rating data into rating Table
INSERT INTO rating(user_id, restaurant_id, rating) VALUES
(1, 2, 4),
(2, 4, 5),
(3, 8, 5),
(4, 9, 1),
(6, 1, 1),
(5, 10, 1),
(8, 9, 2),
(9, 8, 2),
(10, 7, 2),
(6, 3, 2),
(8, 4, 1),
(9, 1, 2),
(4, 2, 1),
(6, 3, 1)
select *from rating

#Inserting address data into address Table
-- INSERT INTO address(user_id, state, city, street, pincode) VALUES     
INSERT INTO address (user_id, state, city, street, pincode)
VALUES
    (1, 'California', 'Los Angeles', 'Sunset Blvd', 90001),
    (2, 'New York', 'New York', 'Broadway', 10001),
    (3, 'Texas', 'Austin', 'Congress Ave', 73301),
    (4, 'Florida', 'Miami', 'Ocean Drive', 33101),
    (5, 'Illinois', 'Chicago', 'Magnificent Mile', 60601),
    (6, 'Nevada', 'Las Vegas', 'The Strip', 89101),
    (7, 'Washington', 'Seattle', 'Pike Place', 98101),
    (8, 'Massachusetts', 'Boston', 'Beacon St', 02101),
    (9, 'Georgia', 'Atlanta', 'Peachtree St', 30301),
    (10, 'Colorado', 'Denver', 'Colfax Ave', 80201);
select * from address

#Inserting menu data into menu Table
INSERT INTO menu (restaurant_id, item_name, price)
VALUES
    (1, 'Margherita Pizza', 8.99),
    (1, 'Pepperoni Pizza', 10.99),
    (1, 'Garlic Bread', 4.99),
    (2, 'Cheeseburger', 7.49),
    (2, 'Fries', 2.99),
    (2, 'Chocolate Shake', 3.99),
    (3, 'Caesar Salad', 6.99),
    (3, 'Grilled Chicken Sandwich', 8.49),
    (3, 'Tomato Soup', 5.49),
    (4, 'Pasta Carbonara', 12.99),
    (4, 'Lasagna', 14.99),
    (4, 'Garlic Knots', 3.49),
    (5, 'Tuna Roll', 6.99),
    (5, 'Salmon Sashimi', 9.99),
    (5, 'Miso Soup', 2.99),
    (6, 'Tandoori Chicken', 11.99),
    (6, 'Butter Naan', 1.99),
    (6, 'Mango Lassi', 3.49),
    (7, 'Falafel Wrap', 7.49),
    (7, 'Hummus Plate', 5.99);
select * from menu;

-- Querying operations
-- 1 To select the name and email of all users who have placed an order:
select user.name, user.email
from user
JOIN orders ON user.user_id = user.user_id

-- 2  To select the name and address of all restaurants that have received a rating of 4 or higher:
select restaurants.name, restaurants.address
from restaurants 
join rating on restaurants.restaurant_id = rating.restaurant_id
where rating.rating >= 4;

-- 3  To select the order id, total, and status of all orders that have been placed by a user with the email ‘johndoe@example.com’:
select orders.order_id, orders.order_total
from orders
join user on orders.user_id = user.user_id
where user.email = "ullrich.yasmine@ohara.com";

-- 4 To select the name, phone, and rating of all drivers who have delivered an order
SELECT drivers.name, drivers.phone, rating.rating
FROM drivers
JOIN Orders on drivers.driver_id = Orders.driver_id
JOIN rating on orders.user_id = rating.user_id and orders.restaurant_id = rating.restaurant_id;

-- 5 To select the name, price and status of the payment of all menu items on a particular restaurant:
SELECT menu.item_name, menu.price, payment.status
FROM menu
JOIN restaurants ON menu.restaurant_id = restaurants.restaurant_id
JOIN orders ON orders.restaurant_id = restaurants.restaurant_id
JOIN payment ON orders.order_id = payment.order_id;
WHERE Menu.restaurant_id = 1;

-- 6 To select all the addresses of the user who placed a particular order:
select address.state, address.city, address.state, address.pincode
from address
join Orders on address.user_id = orders.user_id
where orders.order_id = 2

-- 7 To select the average rating for each restaurant, along with the number of ratings they have received:
select restaurants.name as Restaurants, avg(rating.rating) as AVG_RATING, count(rating.rating) as COUNT
from restaurants
join rating on restaurants.restaurant_id = rating.restaurant_id
group by restaurants.name;

-- 8 To select the most popular menu items, based on the number of times they have been ordered:
select menu.item_name, COUNT(orders)
