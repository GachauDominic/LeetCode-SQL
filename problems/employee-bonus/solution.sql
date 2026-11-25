-- Write your PostgreSQL query statement below
SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;

/*
SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE COALESCE(b.bonus, 0) < 1000;
*/

/*
SELECT
    e.name,
    b.bonus
FROM Employee e
JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000

UNION

SELECT
    e.name,
    NULL AS bonus
FROM Employee e
WHERE NOT EXISTS (
    SELECT 1
    FROM Bonus b
    WHERE b.empId = e.empId
);
*/