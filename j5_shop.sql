--create database j5_shop
use j5_shop
CREATE TABLE Categories (
    id varchar(100) PRIMARY KEY,
    name NVARCHAR (100) NOT NULL
);

CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name NVARCHAR (100) NOT NULL,
    image NVARCHAR(100),
    price float,
    Categoryid VARCHAR(100) NOT NULL,
    Createdate DATE NOT NULL,
    available tinyint,
    FOREIGN KEY (Categoryid) REFERENCES Categories(id)
);

CREATE TABLE Accounts(
    username varchar(100) PRIMARY KEY,
    password nvarchar(100) NOT NULL,
    fullname nvarchar(100) NOT NULL,
    email nvarchar(100) NOT NULL,
    photo nvarchar(500),
    activated tinyint,
    admin tinyint
);

create table Orders(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    address NVARCHAR (100),
    Createdate DATE NOT NULL,
    Username varchar(100),
    FOREIGN KEY (Username) REFERENCES Accounts(username)
);

create table OrderDetails(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    price float,
    quantity int,
    Productid INT NOT NULL,
    Orderid BIGINT NOT NULL,
    FOREIGN KEY (Productid) REFERENCES Products(id),
    FOREIGN KEY (Orderid) REFERENCES Orders(id)
);

INSERT INTO Categories (id, name) VALUES
('C1', 'IPhone'),
('C2', 'Android');

-- Insert data into Products table
INSERT INTO Products (name, image, price, Categoryid, Createdate, available) VALUES
('iphone-11', '/static/images/iphone-11.jpg', 699.99, 'C1', '2024-01-15', 1),
('iphone-x', '/static/images/iphone-x.jpg', 999.99, 'C1', '2024-02-20', 1),
('iphone-12', '/static/images/iphone-12.jpg', 19.99, 'C1', '2024-03-05', 1),
('Samsung Galaxy A05', '/static/images/Samsung Galaxy A05.png', 14.99, 'C2', '2024-04-10', 1),
('Samsung Galaxy A05S', '/static/images/Samsung Galaxy A05S.png', 14.99, 'C2', '2024-04-10', 1),
('iphone-13', '/static/images/iphone-13.webp', 14.99, 'C1', '2024-04-10', 1),
('iphone-14', '/static/images/iphone-14.webp', 499.99, 'C1', '2024-05-25', 1);

-- Insert data into Accounts table
INSERT INTO Accounts (username, password, fullname, email, photo, activated, admin) VALUES
('john_doe', 'password123', 'John Doe', 'john@example.com', 'john.jpg', 1, 0),
('jane_smith', 'securepassword', 'Jane Smith', 'jane@example.com', 'jane.jpg', 1, 1),
('bob_jones', 'mypassword', 'Bob Jones', 'bob@example.com', 'bob.jpg', 1, 0),
('alice_wong', 'alicepassword', 'Alice Wong', 'alice@example.com', 'alice.jpg', 1, 0),
('charlie_brown', 'charlie123', 'Charlie Brown', 'charlie@example.com', 'charlie.jpg', 1, 0);

-- Insert data into Orders table
INSERT INTO Orders (address, Createdate, Username) VALUES
('123 Main St', '2024-06-01', 'john_doe'),
('456 Oak St', '2024-06-02', 'jane_smith'),
('789 Pine St', '2024-06-03', 'bob_jones'),
('101 Maple St', '2024-06-04', 'alice_wong'),
('202 Birch St', '2024-06-05', 'charlie_brown');

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (price, quantity, Productid, Orderid) VALUES
(699.99, 1, 1, 1),
(999.99, 1, 2, 2),
(19.99, 2, 3, 3),
(14.99, 3, 4, 4),
(499.99, 1, 5, 5);

--update Products set Categoryid = '/static/images/iphone-11.jpg' where id = 1
select * from Products