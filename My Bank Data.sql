CREATE DATABASE mybankdb;
USE mybankdb;
SELECT * FROM customer;
SELECT * FROM accounts;
SELECT * FROM transactions;
SELECT * FROM loans;
SELECT * FROM creditcards;
SELECT * FROM branches;
SELECT * FROM atms;
SELECT COUNT(*) AS TotalCustomers FROM customer;
SELECT COUNT(*) AS TotalCustomers FROM accounts;
SELECT SUM(Amount) AS TotalLoansAmount FROM loans;
SELECT SUM(CreditLimit) AS TotalCreditLimit FROM creditcards;
SELECT * FROM Accounts WHERE Status = 'Active';
SELECT * FROM Transactions WHERE TransactionDate > '2023-01-15';
SELECT * FROM Loans WHERE InterestRate > 5.0;
SELECT * FROM CreditCards WHERE Balance > CreditLimit;
SELECT c.CustomerID, c.Name, c.Age, a.AccountNumber, a.AccountType, a.Balance
FROM Customer c
JOIN Accounts a ON c.CustomerID = a.CustomerID;
SELECT t.TransactionID, t.TransactionDate, t.Amount, t.Type, t.Description, a.AccountNumber, a.AccountType, c.Name AS CustomerName
FROM Transactions t
JOIN Accounts a ON t.AccountNumber = a.AccountNumber
JOIN Customer c ON a.CustomerID = c.CustomerID;
SELECT c.Name, L.Amount AS LoanAmount
FROM customer c
JOIN Loans L ON c.CustomerID = L.CustomerID
ORDER BY L.Amount DESC
LIMIT 10;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Accounts
WHERE Status = 'Inactive';
SELECT c.CustomerID, c.Name, COUNT(a.AccountNumber) AS NumAccounts
FROM Customer c
JOIN Accounts a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(a.AccountNumber) > 1;
SELECT SUBSTRING(Name, 1 ,3) AS FirstThreeCharactersOfName 
FROM customer;
SELECT 
SUBSTRING_INDEX(Name, ' ', 1) AS FirstName,
SUBSTRING_INDEX(Name, ' ',-1) AS LastName
FROM customer;
SELECT * FROM Customer
WHERE MOD(CustomerID, 2) <> 0;
SELECT DISTINCT Amount
FROM Loans L1
WHERE 5 = (
SELECT COUNT(DISTINCT Amount)
FROM Loans L2
WHERE L2.Amount >= L1.Amount
);
SELECT MAX(Amount) AS SecondHighestLoan
FROM Loans
WHERE Amount < (
SELECT MAX(Amount)
FROM Loans
);
SELECT CustomerID
FROM Accounts
WHERE Status = 'Inactive';
SELECT * FROM 
Customer Limit 1;
SELECT NOW() AS CurrentDateTime;
CREATE TABLE CustomersClone LIKE Customer;
INSERT INTO CustomersClone SELECT * FROM Customer;
SELECT CustomerID, 
DATEDIFF(EndDate, CURDATE()) AS DaysRemaining
FROM Loans
WHERE EndDate > CURDATE();
SELECT AccountNumber, MAX(TransactionDate) AS LatestTransactionDate
FROM Transactions
GROUP BY AccountNumber;
SELECT AVG(Age) AS AverageAge
FROM Customer;
SELECT AccountNumber, Balance
FROM Accounts
WHERE Balance < 25000
AND OpenDate <= '2022-01-01';
SELECT * 
FROM Loans
WHERE EndDate >= CURDATE()
AND Status = 'Active';
SELECT AccountNumber, SUM(Amount) AS TotalAmount
FROM Transactions
WHERE MONTH(TransactionDate) = 6
AND YEAR(TransactionDate) = 2023
GROUP BY AccountNumber;
SELECT CustomerID, AVG(Balance) AS AverageCreditCardBalance
FROM CreditCards
GROUP BY CustomerId;
SELECT Location, COUNT(*) AS NumberOfInactiveATMs
FROM ATMs
WHERE Status = 'Out Of Service'
GROUP BY Location;
SELECT name, age,
CASE
WHEN age < 30 THEN 'Below 30'
WHEN age BETWEEN 30 AND 60 THEN '30 to 60'
ELSE 'Above 60'
END AS age_group
FROM customer;
 
