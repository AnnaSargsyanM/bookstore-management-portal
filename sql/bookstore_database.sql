CREATE TABLE Book (
  ISBN VARCHAR2(13) NOT NULL,
  Title VARCHAR2(100) NOT NULL,
  Author VARCHAR2(100) NOT NULL,
  Genre VARCHAR2(50),
  Price NUMBER(6,2) NOT NULL,
  Stock_Quantity NUMBER NOT NULL,
  CONSTRAINT pk_book PRIMARY KEY (ISBN)
);

CREATE TABLE Customer (
  Customer_ID NUMBER NOT NULL,
  First_Name VARCHAR2(50) NOT NULL,
  Last_Name VARCHAR2(50) NOT NULL,
  Phone VARCHAR2(15),
  Email VARCHAR2(100) NOT NULL,
  Address VARCHAR2(150),
  CONSTRAINT pk_customer PRIMARY KEY (Customer_ID)
);

CREATE TABLE Employee (
  Employee_ID NUMBER NOT NULL,
  First_Name VARCHAR2(50) NOT NULL,
  Last_Name VARCHAR2(50) NOT NULL,
  Email VARCHAR2(100) NOT NULL,
  Position VARCHAR2(50) NOT NULL,
  Phone VARCHAR2(15),
  CONSTRAINT pk_employee PRIMARY KEY (Employee_ID)
);

CREATE TABLE Orders (
  Order_ID NUMBER NOT NULL,
  Customer_ID NUMBER NOT NULL,
  Employee_ID NUMBER NOT NULL,
  Order_Date DATE NOT NULL,
  Total NUMBER(8,2) NOT NULL,
  CONSTRAINT pk_orders PRIMARY KEY (Order_ID),
  CONSTRAINT fk_orders_customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  CONSTRAINT fk_orders_employee FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE OrderItem (
  Order_ID NUMBER NOT NULL,
  ISBN VARCHAR2(13) NOT NULL,
  Quantity NUMBER NOT NULL,
  Price NUMBER(6,2) NOT NULL,
  CONSTRAINT pk_orderitem PRIMARY KEY (Order_ID, ISBN),
  CONSTRAINT fk_orderitem_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  CONSTRAINT fk_orderitem_book FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

INSERT INTO Book VALUES ('987654321', 'The Castle', 'Franz Kafka', 'Novel', 14.99, 36);
INSERT INTO Book VALUES ('987654322', 'War and Peace', 'Lev Tolstoy', 'Novel', 21.84, 47);
INSERT INTO Book VALUES ('987654323', 'The Godfather', 'Mario Puzo', 'Crime', 17.99, 25);
INSERT INTO Book VALUES ('987654324', '451 by Fahrenheit', 'Ray Bradbury', 'Dystopian', 12.49, 18);
INSERT INTO Book VALUES ('987654325', 'The Three Musketeers', 'Alexandre Dumas', 'Adventure', 15.95, 30);
INSERT INTO Book VALUES ('987654326', 'Pride and Prejudice', 'Jane Austen', 'Romance', 11.99, 22);
INSERT INTO Book VALUES ('987654327', '1984', 'George Orwell', 'Dystopian', 13.75, 10);
INSERT INTO Book VALUES ('987654328', 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 14.50, 8);
INSERT INTO Book VALUES ('987654329', 'Sapiens', 'Yuval Noah Harari', 'Non-fiction', 19.99, 12);
INSERT INTO Book VALUES ('987654330', 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 10.99, 50);
INSERT INTO Book VALUES ('987654331', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 12.99, 40);
INSERT INTO Book VALUES ('987654332', 'A Good Girl''s Guide to Murder', 'Holly Jackson', 'Mystery', 10.99, 15);
INSERT INTO Book VALUES ('987654333', 'Good Girl, Bad Blood', 'Holly Jackson', 'Mystery', 11.99, 12);
INSERT INTO Book VALUES ('987654334', 'As Good As Dead', 'Holly Jackson', 'Mystery', 13.49, 10);
INSERT INTO Book VALUES ('987654335', 'Hamlet', 'William Shakespeare', 'Tragedy', 9.99, 20);
INSERT INTO Book VALUES ('987654336', 'Murder on the Orient Express', 'Agatha Christie', 'Detective', 12.99, 18);

INSERT INTO Customer VALUES (1, 'Anna', 'Sargsyan', '1234567890', 'anna@email.com', '123 Edgar Rd');
INSERT INTO Customer VALUES (2, 'John', 'Smith', '0987654321', 'john@email.com', '456 Edgar Rd');
INSERT INTO Customer VALUES (3, 'Nino', 'Khotenashvili', '3141234567', 'nino@email.com', '789 Pasadena Ave');
INSERT INTO Customer VALUES (4, 'Liem', 'Quang', '3141234568', 'liem@email.com', '321 Glendale Ave');


INSERT INTO Employee VALUES (111, 'Sara', 'Pitt', 'sara@bookstore.com', 'Manager', '8881234567');
INSERT INTO Employee VALUES (222, 'Michael', 'Pritchett', 'michael@bookstore.com', 'Cashier', '8887654321');
INSERT INTO Employee VALUES (333, 'Emily', 'Blunt', 'emily@bookstore.com', 'Sales Associate', '8887654322');
INSERT INTO Employee VALUES (444, 'David', 'Lopez', 'david@bookstore.com', 'Inventory Clerk', '8887654323');


INSERT INTO Orders VALUES (5001, 1, 111, DATE '2025-04-01', 129.97);
INSERT INTO Orders VALUES (5002, 2, 222, DATE '2025-04-02', 39.95);
INSERT INTO Orders VALUES (5003, 3, 333, DATE '2025-04-03', 34.98);
INSERT INTO Orders VALUES (5004, 4, 444, DATE '2025-04-04', 24.98);
INSERT INTO Orders VALUES (5005, 1, 111, DATE '2025-04-05', 49.99);
INSERT INTO Orders VALUES (5006, 2, 222, DATE '2025-04-05', 19.99);
INSERT INTO Orders VALUES (5007, 3, 333, DATE '2025-04-05', 59.95);
INSERT INTO Orders VALUES (5008, 4, 444, DATE '2025-04-08', 89.95);
INSERT INTO Orders VALUES (5009, 1, 111, DATE '2025-04-08', 24.99);
INSERT INTO Orders VALUES (5010, 2, 222, DATE '2025-04-08', 109.99);
INSERT INTO Orders VALUES (5011, 3, 333, DATE '2025-04-08', 44.95);
INSERT INTO Orders VALUES (5012, 4, 444, DATE '2025-04-08', 64.50);
INSERT INTO Orders VALUES (5013, 1, 111, DATE '2025-04-13', 38.50);
INSERT INTO Orders VALUES (5014, 2, 222, DATE '2025-04-13', 74.25);

INSERT INTO OrderItem VALUES (5001, '987654321', 1, 45.99);
INSERT INTO OrderItem VALUES (5001, '987654322', 2, 39.99);
INSERT INTO OrderItem VALUES (5002, '987654322', 1, 39.95);
INSERT INTO OrderItem VALUES (5003, '987654332', 1, 10.99);
INSERT INTO OrderItem VALUES (5003, '987654333', 1, 11.99);
INSERT INTO OrderItem VALUES (5003, '987654336', 1, 11.99);
INSERT INTO OrderItem VALUES (5004, '987654335', 1, 9.99);
INSERT INTO OrderItem VALUES (5004, '987654328', 1, 14.99);

INSERT INTO OrderItem VALUES (5005, '987654329', 1, 39.25);
INSERT INTO OrderItem VALUES (5006, '987654330', 1, 35.0);
INSERT INTO OrderItem VALUES (5007, '987654331', 1, 28.5);
INSERT INTO OrderItem VALUES (5008, '987654336', 1, 22.0);
INSERT INTO OrderItem VALUES (5009, '987654332', 1, 19.99);
INSERT INTO OrderItem VALUES (5010, '987654333', 1, 17.99);
INSERT INTO OrderItem VALUES (5011, '987654329', 1, 39.25);
INSERT INTO OrderItem VALUES (5012, '987654330', 1, 35.0);
INSERT INTO OrderItem VALUES (5013, '987654331', 1, 28.5);
INSERT INTO OrderItem VALUES (5014, '987654336', 1, 22.0);

CREATE TABLE APP_SETTINGS (
    SETTING_NAME   VARCHAR2(50) PRIMARY KEY,
    SETTING_VALUE  VARCHAR2(200)
);


INSERT INTO APP_SETTINGS (SETTING_NAME, SETTING_VALUE) VALUES ('Show Home Charts', 'Y');
INSERT INTO APP_SETTINGS (SETTING_NAME, SETTING_VALUE) VALUES ('Default Genre', 'Mystery');
INSERT INTO APP_SETTINGS (SETTING_NAME, SETTING_VALUE) VALUES ('Stock Alert Threshold', '25');
INSERT INTO APP_SETTINGS (SETTING_NAME, SETTING_VALUE) VALUES ('Store Name', 'Bookstore Management Portal');
INSERT INTO APP_SETTINGS (SETTING_NAME, SETTING_VALUE) VALUES ('Low Stock Threshold', '20');
INSERT INTO APP_SETTINGS (SETTING_NAME, SETTING_VALUE) VALUES ('Currency', 'USD');




