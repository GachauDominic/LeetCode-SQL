-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT *,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
)
SELECT
    id,
    visit_date,
    people
FROM cte
WHERE grp IN (
    SELECT grp
    FROM cte
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;

/*
WITH tmp1 AS (
    SELECT 
        id, 
        visit_date, 
        people,
        id - row_number() OVER(ORDER BY id) AS rnk
    FROM Stadium
    WHERE people >= 100
),
tmp2 AS (
    SELECT
        *,
        COUNT(*) OVER (PARTITION BY rnk) size
    FROM tmp1
)

SELECT id, visit_date, people FROM tmp2
WHERE size >= 3
-- SELECT id, visit_date, people FROM tmp1
-- WHERE rnk IN (SELECT rnk FROM tmp1 GROUP BY rnk HAVING COUNT(*) >= 3)
-- ORDER BY visit_date
*/

/*

*/