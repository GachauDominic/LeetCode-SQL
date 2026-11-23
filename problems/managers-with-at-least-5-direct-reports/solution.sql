-- Write your PostgreSQL query statement below
SELECT e.name
FROM Employee e
JOIN Employee r
    ON e.id = r.managerId
GROUP BY e.id, e.name
HAVING COUNT(*) >= 5;

/*
Description:
1. Join the Employee table with itself.
2. Match managers to their direct reports.
3. Group by manager.
4. Count direct reports.
5. Return managers with at least five reports.
*/

/*
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);
*/

/*
SELECT e.name
FROM Employee e
WHERE (
    SELECT COUNT(*)
    FROM Employee r
    WHERE r.managerId = e.id
) >= 5;
*/

/*
SELECT e.name
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Employee r
    WHERE r.managerId = e.id
    GROUP BY r.managerId
    HAVING COUNT(*) >= 5
);
*/