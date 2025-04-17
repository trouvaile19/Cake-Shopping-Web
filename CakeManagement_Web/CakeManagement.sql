CREATE DATABASE CakeManagement;
USE CakeManagement;

-- Table Users
CREATE TABLE tblUsers (
    userID VARCHAR(50) PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    roleID VARCHAR(15) NOT NULL
);


-- Table Orders
CREATE TABLE tblOrders (
    orderID INT IDENTITY(1,1) PRIMARY KEY, 
    userID VARCHAR(50),
    total DECIMAL(10,2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES tblUsers(userID) ON DELETE CASCADE
);

-- Table Products
CREATE TABLE tblProducts (
    productID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL
);
	ALTER TABLE tblProducts 
	ADD imageURL VARCHAR(255);

-- Table OrderDetails
CREATE TABLE tblOrderDetails (
    orderDetailID INT IDENTITY(1,1) PRIMARY KEY, 
    orderID INT,  
    productID VARCHAR(50),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES tblOrders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES tblProducts(productID) ON DELETE CASCADE
);


-- Sample data for Users
INSERT INTO tblUsers (userID, fullName, phone, email, password, roleID) VALUES
('manqb123', 'Nguyen Thi Man', '0979303544','mannguyenqb1985@gmail.com', 'manqb123', 'AD'),
('sangqb', 'Mai Quang Sang', '0912345678','sangqb@gmail.com', 'sangqb', 'US'),
('phucpham', 'Pham Thanh Phuc', '0986345675', 'phamthanhqb2005@gmail.com','phucpham', 'US'),
('muaythai', 'Lady Boy', '0982345675','gay123@gmail.com', 'muaythai', 'US');

-- Sample data for Products
INSERT INTO tblProducts (productID, name, price, quantity, imageURL) VALUES
('P001', 'Chocolate Cake', 16.00, 20, 'https://hpbd.name/uploads/worigin/2019/10/22/chocolate-birthday-cake-with-name-min5dae9ff3d958a_1f4c0867c5e1215f3f59e6f438ad26cc.jpg'),
('P002', 'Strawberry Cake', 14.80, 15,'https://thecheesecakeboutique.com/cdn/shop/files/Enjoy_our_Strawberry-topped_Happy_Birthday_Cheesecake_with_fresh_strawberries_and_white_chocolate_drizzle._Perfect_for_making_any_birthday_unforgettable.jpg?v=1722355775&width=1920'),
('P003', 'Cheese Cake', 17.20, 10, 'https://c8.alamy.com/comp/W36EWM/cheese-cake-for-birthday-celebration-W36EWM.jpg'),
('P004', 'Tiramisu', 15.45, 8, 'https://tastegoblet.wordpress.com/wp-content/uploads/2006/12/dukes-bday-2006-002.jpg'),
('P005', 'Red Velvet Cake', 20.50, 12, 'https://enamewishes.com/write.php?postid=2764&user_input=Enter%20the%20Name'),
('P006', 'Matcha Green Tea Cake', 15.5, 18, 'https://mizubatea.com/cdn/shop/articles/3_copy_5b0ca390-f02b-474c-a506-79416f2ba7e4.JPG?v=1596136728'),
('P007', 'Carrot Cake', 14.80, 10, 'https://minimalistbaker.com/wp-content/uploads/2017/06/THE-BEST-Vegan-Gluten-Free-Carrot-Cake-1-Bowl-rich-moist-with-5-FROSTING-options-vegan-glutenfree-carrotcake-cake-recipe-minimalistbaker-4.jpg'),
('P008', 'Lemon Drizzle Cake', 13.50, 14, 'https://images.immediate.co.uk/production/volatile/sites/2/2015/04/5262.jpg?quality=90&crop=7px,214px,2349px,2134px&resize=556,505'),
('P009', 'Black Forest Cake', 11.25, 9, 'https://www.lembehresort.com/wp-content/uploads/Black-macaque-copyright-selfie.jpg'),
('P010', 'Mango Mousse Cake', 17.50, 11, 'https://www.sweeheng.com.sg/wp-content/uploads/sites/3/2024/02/Mango-Mousse-Cake-2-2_11zon-scaled.jpg'),
('P011', 'Cute Penguin Cake', 17.50, 11, 'https://cookingwithemmarussell.wordpress.com/wp-content/uploads/2012/11/penguin-cake2.jpg'),
('P012', 'Super Wibu Cake', 17.50, 11, 'https://media-cdn.tripadvisor.com/media/photo-s/1c/44/f7/f8/custom-designed-birthday.jpg');

delete from tblOrders
delete from tblOrderDetails
delete from tblProducts
delete from tblUsers
DROP DATABASE CakeManagement; 
SELECT email FROM tblUsers WHERE email = 'phamthanhqb2005@gmail.com'