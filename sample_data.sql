USE Rental DB

# Insert customer
INSERT INTO Customer_Info VALUES
(1, 'Smith', 'John', '123 Main St', '800-423-7890'),
(2, 'Doe', 'Jane', '456 Oak Ave', '214-429-9722'),
(3, 'James', 'LeBron', '789 Pine Blvd', '210-410-1604');

# INSERT MODELS (FIXED ORDER: Model_Name, Make)
INSERT INTO Model_Info VALUES
(1, 'Camry', 'Toyota'),
(2, 'Civic', 'Honda'),
(3, 'Escape', 'Ford');

# INSERT VEHICLES
INSERT INTO Vehicle VALUES
(101, 'ABC123', 1, 2022, 31580, 55.00, 'Available'),
(102, 'XYZ789', 2, 2021, 43257, 50.00, 'Rented'),
(103, 'LMN456', 3, 2023, 26400, 75.00, 'Available');

# INSERT RENTAL RECORDS
INSERT INTO Rental_Record VALUES
(1001, 1, 102, '2026-03-01', '2026-03-05'),
(1002, 2, 101, '2026-03-10', '2026-03-12'),
(1003, 3, 102, '2026-03-15', '2026-03-22'),
(1004, 3, 103, '2026-03-24', '2026-03-28');

# INSERT TRANSACTIONS
INSERT INTO Transaction_Table VALUES
(5001, 1001, '2026-03-01', 200.00, 'Credit Card'),
(5002, 1002, '2026-03-10', 110.00, 'Cash'),
(5003, 1003, '2026-03-15', 350.00, 'Credit Card'),
(5004, 1004, '2026-03-24', 300.00, 'Credit Card');
