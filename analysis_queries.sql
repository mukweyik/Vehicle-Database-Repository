USE RentalDB;

# =========================
# GENERAL PROJECT QUEREIES
# =========================

# 1. Total number of vehicles and the average rental price
SELECT 
    COUNT(Vehicle_ID) AS Total_Vehicles,
    AVG(Rental_Price) AS Average_Rental_Price
FROM Vehicle;

# 2. Customers and the vehicles they rented with full name
SELECT DISTINCT
    CONCAT(c.Customer_FName, ' ', c.Customer_LName) AS Full_Name,
    m.Make,
    m.Model_Name,
    r.Rental_Date
FROM Customer_Info c
JOIN Rental_Record r ON c.Customer_ID = r.Customer_ID
JOIN Vehicle v ON r.Vehicle_ID = v.Vehicle_ID
JOIN Model_Info m ON v.Model_ID = m.Model_ID;

# 3. Get Customers That Have Rented A Car
SELECT Customer_FName, Customer_LName 
FROM Customer_Info
WHERE Customer_ID IN (SELECT Customer_ID FROM Rental_Record);

# 4. Get All Credit Card Transactions, Then Sort By Amount Descending
SELECT * 
FROM Transaction_Table
WHERE Payment_Method = 'Credit Card'
ORDER BY Amount DESC;

# ==================================
# KISAKA MUKWEYI ANALYTICAL QUERIES
# ==================================

# 5. Customer spending, rentals, and average payment
SELECT 
    c.Customer_ID,
    CONCAT(c.Customer_FName, ' ', c.Customer_LName) AS Full_Name,
    COUNT(DISTINCT r.Rental_Record_ID) AS Total_Rentals,
    SUM(t.Amount) AS Total_Spent,
    AVG(t.Amount) AS Average_Transaction
FROM Customer_Info c
JOIN Rental_Record r ON c.Customer_ID = r.Customer_ID
JOIN Transaction_Table t ON r.Rental_Record_ID = t.Rental_Record_ID
GROUP BY c.Customer_ID, c.Customer_FName, c.Customer_LName
HAVING SUM(t.Amount) > 0;

# 6. How long a vehicle was rented and revenue
SELECT 
    r.Rental_Record_ID,
    m.Make,
    m.Model_Name,
    DATEDIFF(r.Return_Date, r.Rental_Date) AS Rental_Days,
    v.Rental_Price,
    (DATEDIFF(r.Return_Date, r.Rental_Date) * v.Rental_Price) AS Estimated_Revenue
FROM Rental_Record r
JOIN Vehicle v ON r.Vehicle_ID = v.Vehicle_ID
JOIN Model_Info m ON v.Model_ID = m.Model_ID
ORDER BY Estimated_Revenue DESC;

# ========================
# ADDITIONAL TEAM QUERIES
# ========================
  
# 7. Returns Highest Paying Rental Of the Month With Customer Full Name
SELECT Customer_FName, Customer_LName, 
Transaction_Table.Amount AS Spent, Transaction_Table.Transaction_Date
FROM Transaction_Table
JOIN Rental_Record ON Rental_Record.Rental_Record_ID = Transaction_Table.Rental_Record_ID
JOIN Customer_Info ON Customer_Info.Customer_ID = Rental_Record.Customer_ID
WHERE Transaction_Date BETWEEN '2026-03-01' AND '2026-03-31'
ORDER BY Transaction_Table.Amount DESC 
LIMIT 1;

# 8. Get Customer Contact Info For Active Rentals
SELECT customer.Customer_FName, customer.Customer_LName, customer.Customer_Phone,
record.Rental_Record_ID, record.Return_Date
FROM Customer_Info AS customer
JOIN Rental_Record AS record ON customer.Customer_ID = record.Customer_ID
JOIN Vehicle AS vehicle ON vehicle.Vehicle_ID = record.Vehicle_ID
WHERE vehicle.Vehicle_Status = 'Rented';


# 9. Purpose: Shows available vehicles under a certain price
SELECT
    v.Vehicle_ID,
    CONCAT(v.Year, ' ', m.Make, ' ', m.Model_Name) AS Vehicle,
    v.Rental_Price,
    v.Vehicle_Status
FROM Vehicle v
JOIN Model_Info m ON v.Model_ID = m.Model_ID
WHERE v.Vehicle_Status = 'Available'
AND v.Rental_Price < 70
ORDER BY v.Rental_Price ASC;

# 10. Purpose: Shows customers who have rented multiple times 
SELECT
    c.Customer_ID,
    CONCAT(c.Customer_FName, ' ', c.Customer_LName) AS Customer_Name,
    COUNT(r.Rental_Record_ID) AS Total_Rentals
FROM Customer_Info c
JOIN Rental_Record r ON c.Customer_ID = r.Customer_ID
GROUP BY c.Customer_ID, c.Customer_FName, c.Customer_LName
HAVING COUNT(r.Rental_Record_ID) > 1
ORDER BY Total_Rentals DESC;
