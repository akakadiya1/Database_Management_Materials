-- *********************************
-- Name: Archi Mukeshbhai Kakadiya
-- Title: Lab SIMPLE SELECT
-- *********************************

-- Question 1: Display the data for all offices.

    SELECT * FROM offices;

-- Question 2: Display the employee number for all employees whose office code is 1.

    SELECT
        employeenumber
    FROM employees
    WHERE officecode = '1';
    
-- Question 3: Display customer number, customer name, contact first name and contact last name, and phone for all customers in Paris. (hint: be wary of case sensitivity)

    SELECT
        customernumber,
        customername,
        contactfirstname,
        contactlastname,
        phone
    FROM customers
    WHERE LOWER(city) = 'paris';
    
-- Question 4:  Repeat the previous Query with a couple small changes: 
-- 1. The contact’s first and last name should be in a single column in the format “lastname, firstname”. 
-- 2. The column heading of the contact name created above should be called Contact
-- 3. Show customers who are in Canada 

    SELECT
        customernumber,
        customername,
        contactlastname || ', ' || contactfirstname AS Contact,
        phone
    FROM customers
    WHERE LOWER(country) = 'canada';
    
-- Question 5: Display customer number for customers who have payments. Do not included any repeated customers. 
-- (hints: how do you know a customer has made a payment? You will need to access only one table for this query)

    SELECT
        DISTINCT customernumber
    FROM payments;
    
-- Question 6: List customer numbers, check number, and amount for customers whose payment amount is not in the range of $30,000 to $65,000. Sort the output by top payments amount first.

    SELECT
        customernumber,
        checknumber,
        amount
    FROM payments
    WHERE amount < 30000 OR amount > 65000
    ORDER BY amount DESC;
    
    -- OR
    
    SELECT
        customernumber,
        checknumber,
        amount
    FROM payments
    WHERE amount NOT BETWEEN 30000 AND 65000
    ORDER BY amount DESC;

-- Question 7: The company needs to know the percentage markup for each product sold. Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP in addition to 
-- 1. The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markup 
-- 2. The percentage markup (100 * calculated by difference / BuyPrice) called percmarkup rounded to 1 decimal place. (Hint - Use the ROUND function)

    SELECT
        productcode,
        productname,
        buyprice,
        msrp,
        (msrp - buyprice) AS "Markup",
        ROUND((100 * ((msrp - buyprice)/buyprice)),1) AS "Percent Markup"
    FROM products;
    
-- Question 8: Display the information of all products with string ‘co’ in their product name. (c and o can be lower or upper case). Do not change the display to all upper or lower characters. The display should be as the data was entered in the database.
-- Hint - User the UPPER or LOWER function

    SELECT *
    FROM products
    WHERE UPPER(productname) LIKE '%CO%';
    
    -- OR
    
    SELECT *
    FROM products
    WHERE LOWER(productname) LIKE '%co%';
    
-- Question 9: Display all customers whose contact first name starts with letter s (both lowercase and uppercase) and includes letter e (both lowercase and uppercase).

    SELECT 
        customername
    FROM customers
    WHERE UPPER(contactfirstname) LIKE 'S%E%';
    
    -- OR
    
    SELECT 
        customername
    FROM customers
    WHERE LOWER(contactfirstname) LIKE 's%e%';