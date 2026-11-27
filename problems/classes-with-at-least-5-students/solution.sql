-- Write your PostgreSQL query statement below
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;

/*
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5; 
*/

/*
SELECT class
FROM (
    SELECT
        class,
        COUNT(*) AS student_count
    FROM Courses
    GROUP BY class
) t
WHERE student_count >= 5;
*/

/*
SELECT DISTINCT class
FROM Courses
WHERE class IN (
    SELECT class
    FROM Courses
    GROUP BY class
    HAVING COUNT(*) >= 5
);
*/