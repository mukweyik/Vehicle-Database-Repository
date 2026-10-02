# Vehicle Rental Management Database

A relational SQL database designed to manage vehicle rentals, customers,
vehicles, transactions, and rental activity while supporting analytical
queries for customer spending and rental revenue.

## Project Overview

This project was developed as part of a four-person team to model the
operations of a vehicle rental business. The database uses relational
tables with primary and foreign keys to connect customers, vehicle models,
vehicles, rental records, and transactions.

The project includes SQL queries for analyzing rental activity, customer
spending, transaction history, vehicle availability, rental duration,
and estimated revenue.

## My Contribution

My individual SQL queries focused on:

- Analyzing customer spending and rental activity
- Calculating total rentals per customer
- Calculating total and average customer transaction amounts
- Calculating vehicle rental duration
- Estimating rental revenue

## Skills Demonstrated

- MySQL
- Relational Database Design
- Primary and Foreign Keys
- Multi-Table JOINs
- Aggregate Functions (`COUNT`, `SUM`, `AVG`)
- `GROUP BY` and `HAVING`
- Subqueries
- `ORDER BY`
- `DATEDIFF`
- Data Filtering
- Calculated Fields

## Database Structure

The database consists of five related tables:

- `Customer_Info` – Stores customer information
- `Model_Info` – Stores vehicle make and model information
- `Vehicle` – Stores individual vehicle information and rental status
- `Rental_Record` – Connects customers with rented vehicles
- `Transaction_Table` – Stores payment information associated with rentals

## Project Files

- `database_schema.sql` – Creates the database, tables, and relationships
- `sample_data.sql` – Populates the database with sample data
- `analysis_queries.sql` – Contains analytical SQL queries

## How to Run

1. Run `database_schema.sql` to create the database and tables.
2. Run `sample_data.sql` to populate the tables.
3. Run `analysis_queries.sql` to execute the analytical queries.

## Team Project

This database was developed as part of a four-person academic team project.
The complete repository represents the team's database design, while the
queries identified in the project as my contribution were written by me.
