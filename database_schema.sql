CREATE DATABASE RentalDB;
USE RentalDB;

-- Customer 
CREATE TABLE Customer_Info (
    Customer_ID INT PRIMARY KEY,
    Customer_LName VARCHAR(50) NOT NULL,
    Customer_FName VARCHAR(50) NOT NULL,
    Customer_Address VARCHAR(100),
    Customer_Phone VARCHAR(15)
);

-- Model Info
CREATE TABLE Model_Info (
    Model_ID INT PRIMARY KEY,
    Model_Name VARCHAR(50),
    Make VARCHAR(50)
);

-- Vehicle
CREATE TABLE Vehicle (
    Vehicle_ID INT PRIMARY KEY,
    License_Plate VARCHAR(20) NOT NULL,
    Model_ID INT,
    Year INT,
    Miles INT,
    Rental_Price DECIMAL(8,2),
    Vehicle_Status VARCHAR(20),

    FOREIGN KEY (Model_ID) REFERENCES Model_Info(Model_ID)
);

-- Rental record
CREATE TABLE Rental_Record (
    Rental_Record_ID INT PRIMARY KEY,
    Customer_ID INT,
    Vehicle_ID INT,
    Rental_Date DATE,
    Return_Date DATE,

    FOREIGN KEY (Customer_ID) REFERENCES Customer_Info(Customer_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);

-- Transaction
CREATE TABLE Transaction_Table (
    Transaction_ID INT PRIMARY KEY,
    Rental_Record_ID INT,
    Transaction_Date DATE,
    Amount DECIMAL(10,2),
    Payment_Method VARCHAR(20),

    FOREIGN KEY (Rental_Record_ID) REFERENCES Rental_Record(Rental_Record_ID)
);
