-- Write your PostgreSQL query statement below
SELECT
    ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);

/*
SELECT
    ROUND(SUM(i1.tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance i1
WHERE EXISTS (
    SELECT 1
    FROM Insurance i2
    WHERE i1.pid <> i2.pid
      AND i1.tiv_2015 = i2.tiv_2015
)
AND NOT EXISTS (
    SELECT 1
    FROM Insurance i3
    WHERE i1.pid <> i3.pid
      AND i1.lat = i3.lat
      AND i1.lon = i3.lon
);
*/