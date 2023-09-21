-- 1

SELECT * FROM employees;

-- 3

SELECT first_name, city
FROM employees
WHERE
    country = 'USA'
    AND city <> 'Seattle';

-- 4

SELECT *
FROM products p
WHERE p.supplier_id = 2
ORDER BY p.unit_price DESC
LIMIT 3;

-- 7

SELECT
    c.category_name,
    AVG(price)
FROM categories c
    INNER JOIN(
        SELECT
            category_id,
            SUM(unit_price) AS price
        FROM products
        GROUP BY category_id
        ORDER BY price DESC
        LIMIT
            5
    ) p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY AVG DESC;

-- 8

SELECT
    e.first_name,
    e.last_name,
    t.territory_description
FROM employees e
    INNER JOIN employee_territories es ON es.employee_id = e.employee_id
    INNER JOIN territories t ON t.territory_id = es.territory_id;

-- 9

SELECT
    e.first_name,
    last_name,
    COUNT(o.order_id)
FROM employees e
    INNER JOIN orders o ON o.employee_id = e.employee_id
GROUP BY e.employee_id
HAVING COUNT(o.order_id) > 100
ORDER BY COUNT;
