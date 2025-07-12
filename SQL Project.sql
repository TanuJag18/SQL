-- Q1:
CREATE TABLE student (
    student_id INT NOT NULL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    class_id INT
);
-- Q2: 
/*Constraints are rules that enforce data validity and relationships in a database, 
ensuring data accuracy and consistency (integrity). Common types include PRIMARY KEY (unique record identifier), 
FOREIGN KEY (links tables), NOT NULL (requires a value), and UNIQUE (ensures distinct values).*/
-- Q3: 
/*You apply a NOT NULL constraint to a column to ensure that every record in that column always has a value, 
preventing missing or undefined data which is crucial for data integrity.*/
/* No, a primary key cannot contain NULL values. 
This is because a primary key's purpose is to uniquely identify each record, and a NULL value, 
representing an unknown or absent value, cannot guarantee uniqueness or serve as a reliable identifier.*/
-- Q4: 
/* To add or remove constraints on an existing table, you use the ALTER TABLE SQL command.
-- Adding a constraint:
ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_definition;
Example: ALTER TABLE Employees ADD CONSTRAINT CHK_Salary CHECK (Salary > 0); (Adds a check constraint named CHK_Salary to the Employees table).
-- Removing a constraint:
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
Example: ALTER TABLE Employees DROP CONSTRAINT CHK_Salary; (Removes the check constraint named CHK_Salary from the Employees table).*/
-- Q5: 
/* Violating a constraint during data modification (insert, update, delete) leads to the database rejecting the operation to maintain data integrity. 
The attempted action will fail, and an error message will be returned, explaining the specific constraint violation.
Example Error Message (for a PRIMARY KEY violation):
Msg 2627, Level 14, State 1, Line 1: Violation of PRIMARY KEY constraint 'PK_TableName'.
Cannot insert duplicate key in object 'dbo.TableName'. The statement has been terminated.*/
-- Q6: 
CREATE TABLE classes (
    class_name VARCHAR(100) NOT NULL,
    class_id INT not NULL PRIMARY KEY );
    ALTER TABLE products
ADD PRIMARY KEY (class_id);
-- Q7:
select * from student; 
INSERT INTO student (student_id, student_name, class_id) VALUES (1, 'Alice', 101); 
INSERT INTO student (student_id, student_name, class_id) VALUES (2, 'Bob', 102);
INSERT INTO student (student_id, student_name, class_id) VALUES (3, 'Charlie', 101);
INSERT INTO Classes (class_id, class_name) VALUES (101, 'Math');
INSERT INTO Classes (class_id, class_name) VALUES (102, 'Science');
INSERT INTO Classes (class_id, class_name) VALUES (103, 'History');
select * from classes;
SELECT
    s.student_name,
    c.class_name
FROM
    student s
INNER JOIN
    classes c
ON
    s.class_id= c.class_id;
    
-- Q8:
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Customers (customer_id, customer_name) VALUES (101, 'Alice');
INSERT INTO Customers (customer_id, customer_name) VALUES (102, 'Bob');

INSERT INTO Orders (order_id, order_date, customer_id) VALUES (1, '2024-01-01', 101);
INSERT INTO Orders (order_id, order_date, customer_id) VALUES (2, '2024-01-03', 102);

-- Insert Products
INSERT INTO Products (product_id, product_name, order_id) VALUES (1, 'Laptop', 1);
INSERT INTO Products (product_id, product_name, order_id) VALUES (2, 'Phone', 2);
select * from Customers;
SELECT
    p.product_id,
    p.product_name,
    o.order_id,
    c.customer_name
FROM
    Products p
LEFT JOIN
    Orders o ON p.order_id = o.order_id
LEFT JOIN
    Customers c ON o.customer_id = c.customer_id;
    
-- Q9:
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Products (product_id, product_name) VALUES (101, 'Laptop');
INSERT INTO Products (product_id, product_name) VALUES (102, 'Phone');

INSERT INTO Sales (sale_id, product_id, amount) VALUES (1, 101, 500);
INSERT INTO Sales (sale_id, product_id, amount) VALUES (2, 102, 300);
INSERT INTO Sales (sale_id, product_id, amount) VALUES (3, 101, 700);
select * from products;
SELECT
    p.product_id,
    p.product_name,
    SUM(s.amount) AS total_sales_amount
FROM
    Products p
INNER JOIN
    Sales s ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name;
    
-- Q10:
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);
CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    -- You could also add FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers (customer_id, customer_name) VALUES (1, 'Alice');
INSERT INTO Customers (customer_id, customer_name) VALUES (2, 'Bob');


INSERT INTO Orders (order_id, customer_id, order_date) VALUES (1, 1, '2024-01-02');
INSERT INTO Orders (order_id, customer_id, order_date) VALUES (2, 2, '2024-01-05');

INSERT INTO Order_Details (order_id, product_id, quantity) VALUES (1, 101, 2);
INSERT INTO Order_Details (order_id, product_id, quantity) VALUES (2, 102, 1);
INSERT INTO Order_Details (order_id, product_id, quantity) VALUES (1, 101, 3);
SELECT
    o.order_id,
    c.customer_name,
    od.quantity
FROM
    Orders o
INNER JOIN
    Customers c ON o.customer_id = c.customer_id
INNER JOIN
    Order_Details od ON o.order_id = od.order_id;
    
-- SQL Command
-- Q1: 
-- Q2:
select * from actor;
-- Q3:
select * from customer;
-- Q4:
select distinct country from country;
-- Q5:
select * from customer where active = 1;
-- Q6:
select * from rental where customer_id = 1;
-- Q7:
select * from film where rental_duration > 5;
-- Q8:
select * from film where replacement_cost > 15 and replacement_cost < 20;
-- Q9:
select count(distinct first_name)as unique_first_name from actor; 
-- Q10:
select * from customer limit 10;
-- Q11:
select * from customer where first_name like 'B%' limit 3;
-- Q12:
select * from film where rating = 'G' limit 5;
-- Q13:
select * from customer where first_name like 'A%';
-- Q14:
select * from customer where first_name like '%A';
-- Q15:
select * from city where city like 'A%A' limit 4;
-- Q16:
select * from customer where first_name like '%NI%';
-- Q17:
select * from customer where first_name like '_r%' ;
-- Q18:
select * from customer where first_name like 'A%_';
-- Q19:
select * from customer where first_name like 'A%O';
-- Q20:
select * from film where rating IN ('PG','PG-13');
-- Q21:
select * from film where length between 50 and 100;
-- Q22:
select * from actor limit 50;
-- Q23:
select distinct film_id from inventory; 

-- Functions
-- Basic Aggregate Function
-- Q1:
select count(*) from rental;
-- Q2:
select * from rental;
select avg(datediff(return_date , rental_date)) from rental;
-- Q3:
select upper(first_name), upper(last_name) from customer;
-- Q4:
select rental_id, month(rental_date) from rental;
-- Q5:
select customer_id, count(*) from rental group by customer_id;
select * from customer; 
-- Q6:
SELECT 
  c.store_id,
  SUM(p.amount) AS total_revenue
FROM 
  payment p
JOIN 
  customer c ON p.customer_id = c.customer_id
GROUP BY 
  c.store_id;
  select * from film_category;
  -- Q7:
  SELECT 
  c.name AS category_name,
  COUNT(r.rental_id) AS total_rentals
FROM 
  category c
JOIN 
  film_category fc ON c.category_id = fc.category_id
JOIN 
  film f ON fc.film_id = f.film_id
JOIN 
  inventory i ON f.film_id = i.film_id
JOIN 
  rental r ON i.inventory_id = r.inventory_id
GROUP BY 
  c.name
ORDER BY 
  total_rentals DESC;
  -- Q8:
  SELECT 
  l.name AS language_name,
  AVG(f.rental_rate) AS avg_rental_rate
FROM 
  film f
JOIN 
  language l ON f.language_id = l.language_id
GROUP BY 
  l.name
ORDER BY 
  avg_rental_rate DESC;
  
-- Joins
-- Q9:
describe film;
describe inventory;
describe rental;
select c.first_name, c.last_name, s.title from film s join inventory i on s.film_id = i.film_id join rental r on r.inventory_id = i.inventory_id join customer c on r.customer_id = c.customer_id;
-- Q10:
SELECT 
  a.first_name,
  a.last_name
FROM 
  film f
JOIN 
  film_actor fa ON f.film_id = fa.film_id
JOIN 
  actor a ON fa.actor_id = a.actor_id
WHERE 
  f.title = 'GONE WITH THE WIND'
ORDER BY 
  a.last_name, a.first_name;
-- Q11:
SELECT 
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  SUM(p.amount) AS total_amount_spent
FROM 
  customer c
JOIN 
  payment p ON c.customer_id = p.customer_id
GROUP BY 
  c.customer_id, c.first_name, c.last_name
ORDER BY 
  total_amount_spent DESC;
-- Q12:
SELECT 
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  f.title AS movie_title
FROM 
  customer c
JOIN 
  address a ON c.address_id = a.address_id
JOIN 
  city ci ON a.city_id = ci.city_id
JOIN 
  rental r ON c.customer_id = r.customer_id
JOIN 
  inventory i ON r.inventory_id = i.inventory_id
JOIN 
  film f ON i.film_id = f.film_id
WHERE 
  ci.city = 'London'
GROUP BY 
  customer_name, movie_title
ORDER BY 
  customer_name, movie_title;
  -- Advanced Joins and GROUP BY:
-- Q13:
SELECT 
  f.title AS movie_title,
  COUNT(r.rental_id) AS times_rented
FROM 
  film f
JOIN 
  inventory i ON f.film_id = i.film_id
JOIN 
  rental r ON i.inventory_id = r.inventory_id
GROUP BY 
  f.film_id, f.title
ORDER BY 
  times_rented DESC
LIMIT 5;
-- Q14:
SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  COUNT(DISTINCT i.store_id) AS stores_rented_from
FROM
  customer c
JOIN
  rental r ON c.customer_id = r.customer_id
JOIN
  inventory i ON r.inventory_id = i.inventory_id
GROUP BY
  c.customer_id, c.first_name, c.last_name
HAVING
  stores_rented_from = 2
ORDER BY
  customer_name;

-- Windows Function:
use mavenmovies;
-- Q1:
SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  SUM(p.amount) AS total_amount_spent,
  Rank() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM
  customer c
JOIN
  payment p ON c.customer_id = p.customer_id
GROUP BY
  c.customer_id, c.first_name, c.last_name
ORDER BY
  spending_rank;
  -- Q2:
  SELECT
  f.title AS film_title,
  DATE(p.payment_date) AS payment_date,
  SUM(p.amount) AS daily_revenue,
  SUM(SUM(p.amount)) OVER (
    PARTITION BY f.film_id
    ORDER BY DATE(p.payment_date)
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_revenue
FROM
  payment p
JOIN
  rental r ON p.rental_id = r.rental_id
JOIN
  inventory i ON r.inventory_id = i.inventory_id
JOIN
  film f ON i.film_id = f.film_id
GROUP BY
  f.film_id,
  f.title,
  DATE(p.payment_date)
ORDER BY
  f.title,
  payment_date;
  -- Q3:
SELECT
  film_title,
  length,
  length_group,
  rental_days,
  AVG(rental_days) OVER (PARTITION BY length_group) AS avg_rental_duration_per_group
FROM (
  SELECT
    f.title AS film_title,
    f.length,
    ROUND(f.length, -1) AS length_group,
    DATEDIFF(r.return_date, r.rental_date) AS rental_days
  FROM
    film f
  JOIN
    inventory i ON f.film_id = i.film_id
  JOIN
    rental r ON i.inventory_id = r.inventory_id
  WHERE
    r.return_date IS NOT NULL
) AS rental_sub
ORDER BY
  length_group,
  film_title;
  -- Q4:
 SELECT
  category_name,
  film_title,
  rental_count,
  film_rank
FROM (
  SELECT
    c.name AS category_name,
    f.title AS film_title,
    COUNT(r.rental_id) AS rental_count,
    RANK() OVER (
      PARTITION BY c.category_id
      ORDER BY COUNT(r.rental_id) DESC
    ) AS film_rank
  FROM
    film f
  JOIN
    film_category fc ON f.film_id = fc.film_id
  JOIN
    category c ON fc.category_id = c.category_id
  JOIN
    inventory i ON f.film_id = i.film_id
  JOIN
    rental r ON i.inventory_id = r.inventory_id
  GROUP BY
    c.category_id, c.name, f.film_id, f.title
) AS ranked_films
WHERE
  film_rank <= 3
ORDER BY
  category_name,
  film_rank;
  -- Q5:
  SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  COUNT(r.rental_id) AS total_rentals,
  ROUND(AVG(COUNT(r.rental_id)) OVER (), 2) AS avg_rentals,
  COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS diff_from_avg
FROM
  customer c
JOIN
  rental r ON c.customer_id = r.customer_id
GROUP BY
  c.customer_id, c.first_name, c.last_name
ORDER BY
  diff_from_avg DESC;
-- Q6:
  SELECT
  DATE_FORMAT(payment_date, '%Y-%m') AS revenue_month,
  SUM(amount) AS monthly_revenue,
  SUM(SUM(amount)) OVER (
    ORDER BY DATE_FORMAT(payment_date, '%Y-%m')
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_revenue
FROM
  payment
GROUP BY
  revenue_month
ORDER BY
  revenue_month;
  -- Q7:
SELECT
  customer_id,
  customer_name,
  total_spent,
  quintile
FROM (
  SELECT
    customer_id,
    customer_name,
    total_spent,
    NTILE(5) OVER (ORDER BY total_spent) AS quintile
  FROM (
    SELECT
      c.customer_id,
      CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
      SUM(p.amount) AS total_spent
    FROM
      customer c
      JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY
      c.customer_id
  ) AS totals
) AS ranked_customers
WHERE
  quintile = 5  -- Top 20%
ORDER BY
  total_spent DESC;
  -- Q8:
SELECT
  category_name,
  rental_count,
  SUM(rental_count) OVER (
    ORDER BY rental_count DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total_rentals
FROM (
  SELECT
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count
  FROM
    category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
  GROUP BY
    c.category_id, c.name
) AS category_rentals
ORDER BY
  rental_count DESC;
-- Q9:
SELECT
  c.name AS category_name,
  film_rentals.title AS film_title,  -- ✅ use subquery alias
  film_rentals.rental_count,
  film_rentals.avg_rentals_in_category
FROM (
  SELECT
    f.film_id,
    f.title,
    fc.category_id,
    COUNT(r.rental_id) AS rental_count,
    AVG(COUNT(r.rental_id)) OVER (PARTITION BY fc.category_id) AS avg_rentals_in_category
  FROM
    film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
  GROUP BY
    f.film_id, f.title, fc.category_id
) AS film_rentals
JOIN category c ON film_rentals.category_id = c.category_id
WHERE
  film_rentals.rental_count < film_rentals.avg_rentals_in_category
ORDER BY
  c.name, film_rentals.rental_count ASC;
  -- Q10:
SELECT
  month,
  monthly_revenue,
  revenue_rank
FROM (
  SELECT
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank
  FROM
    payment
  GROUP BY
    month
) AS ranked_months
WHERE
  revenue_rank <= 5
ORDER BY
  monthly_revenue DESC;

-- Normalisation & CTE
-- Q1. First Normal Form (1NF):
/* There is no table in the Sakila database that violates First Normal Form (1NF). 
 All tables in Sakila are already designed to store atomic values in each column, 
 with no repeating groups or multi-valued fields. 
 Therefore, no normalization is needed to achieve 1NF in Sakila.*/
-- Q2: Second Normal Form (2NF):
/* The film_actor table has a composite primary key (film_id, actor_id).
It only contains these keys — no other columns — so it does not violate 2NF because there are no partial dependencies.
If it did violate 2NF:
If film_actor had a column like actor_name (which depends only on actor_id), that would be a partial dependency, violating 2NF.
To normalize: Move actor_name to the actor table, so it depends only on actor_id.*/
-- Q3: Third Normal Form (3NF):
/* The Sakila database is designed to follow 3NF, so it does not actually contain a real 3NF violation.
A table violates 3NF if it has transitive dependencies:
A non-key column depends on another non-key column instead of directly on the primary key.
Suppose a table customer had columns: customer_id, store_id, store_address.
store_address depends on store_id (which is not the PK here) → this is a transitive dependency.
Identify the non-key attribute (store_address) that depends on another non-key attribute (store_id).
Remove the transitive dependency by moving store_address to its own store table if it’s not already there.
Keep only store_id in customer to preserve the direct relationship.*/
-- Q4: Normalization Process:
/* In the Sakila database, to check whether a table is in Second Normal Form (2NF),
 you first see if the table has a composite primary key. 
 For example, the film_category table uses a composite primary key made up of film_id and category_id. 
 This means that every non-key column must depend on the whole key, not just part of it.
If film_category had an extra column, like category_name, 
then category_name would depend only on category_id, not on both film_id and category_id. 
This would violate 2NF because of the partial dependency.
To bring the table to 2NF, you would remove category_name from film_category and store it in the category table,
 which uses category_id as its primary key. This way, all non-key columns in film_category depend only on the full composite key, and the table satisfies Second Normal Form.*/

-- Q5: CTE Basics:
WITH actor_film_count AS (
    SELECT
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM
        actor a
        JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY
        a.actor_id, a.first_name, a.last_name
)
SELECT
    actor_name,
    film_count
FROM
    actor_film_count
ORDER BY
    film_count DESC,
    actor_name;
    
-- Q6: CTE with Joins:
WITH film_language_info AS (
  SELECT
    f.film_id,
    f.title AS film_title,
    l.name AS language_name,
    f.rental_rate
  FROM
    film f
  JOIN
    language l ON f.language_id = l.language_id
)
SELECT
  film_title,
  language_name,
  rental_rate
FROM
  film_language_info
ORDER BY
  film_title;
  
-- Q7: CTE for Aggregation
WITH customer_revenue AS (
  SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_revenue
  FROM
    customer c
  JOIN
    payment p ON c.customer_id = p.customer_id
  GROUP BY
    c.customer_id, c.first_name, c.last_name
)
SELECT
  customer_id,
  customer_name,
  total_revenue
FROM
  customer_revenue
ORDER BY
  total_revenue DESC;

-- Q8: CTE with Window Functions:
WITH film_ranks AS (
  SELECT
    film_id,
    title,
    rental_duration,
    RANK() OVER (ORDER BY rental_duration DESC) AS rental_duration_rank
  FROM
    film
)
SELECT
  film_id,
  title,
  rental_duration,
  rental_duration_rank
FROM
  film_ranks
ORDER BY
  rental_duration_rank;
  
-- Q9: CTE and Filtering:
WITH frequent_customers AS (
  SELECT
    r.customer_id,
    COUNT(r.rental_id) AS rental_count
  FROM
    rental r
  GROUP BY
    r.customer_id
  HAVING
    COUNT(r.rental_id) > 2
)
SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  c.email,
  fc.rental_count
FROM
  frequent_customers fc
JOIN
  customer c ON fc.customer_id = c.customer_id
ORDER BY
  fc.rental_count DESC;
  
-- Q10: CTE for Date Calculations:
WITH monthly_rentals AS (
  SELECT
    DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
    COUNT(rental_id) AS total_rentals
  FROM
    rental
  GROUP BY
    DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT
  rental_month,
  total_rentals
FROM
  monthly_rentals
ORDER BY
  rental_month;

-- Q11: CTE and Self-Join:
WITH actor_pairs AS (
  SELECT
    fa1.film_id,
    fa1.actor_id AS actor_id_1,
    fa2.actor_id AS actor_id_2
  FROM
    film_actor fa1
  JOIN
    film_actor fa2 ON fa1.film_id = fa2.film_id
  WHERE
    fa1.actor_id < fa2.actor_id  -- Avoid duplicate and self-pairs
)
SELECT
  ap.film_id,
  a1.first_name AS actor1_first_name,
  a1.last_name AS actor1_last_name,
  a2.first_name AS actor2_first_name,
  a2.last_name AS actor2_last_name
FROM
  actor_pairs ap
JOIN
  actor a1 ON ap.actor_id_1 = a1.actor_id
JOIN
  actor a2 ON ap.actor_id_2 = a2.actor_id
ORDER BY
  ap.film_id,
  actor1_first_name,
  actor2_first_name;
  
-- Q12:CTE for Recursive Search:
WITH RECURSIVE hierarchy AS (
  -- Inline "staff_hierarchy" data
  SELECT * FROM (
    SELECT 1 AS staff_id, 'Mike' AS first_name, 'Smith' AS last_name, NULL AS reports_to UNION ALL
    SELECT 2, 'Jane', 'Doe', 1 UNION ALL
    SELECT 3, 'John', 'Doe', 1 UNION ALL
    SELECT 4, 'Mary', 'Ann', 2 UNION ALL
    SELECT 5, 'Bob', 'Lee', 3
  ) AS staff_hierarchy
  WHERE staff_id = 1

  UNION ALL

  SELECT
    sh.staff_id,
    sh.first_name,
    sh.last_name,
    sh.reports_to
  FROM
    (
      SELECT 1 AS staff_id, 'Mike' AS first_name, 'Smith' AS last_name, NULL AS reports_to UNION ALL
      SELECT 2, 'Jane', 'Doe', 1 UNION ALL
      SELECT 3, 'John', 'Doe', 1 UNION ALL
      SELECT 4, 'Mary', 'Ann', 2 UNION ALL
      SELECT 5, 'Bob', 'Lee', 3
    ) AS sh
    JOIN hierarchy h ON sh.reports_to = h.staff_id
)
SELECT
  staff_id,
  CONCAT(first_name, ' ', last_name) AS employee_name,
  reports_to
FROM
  hierarchy;


