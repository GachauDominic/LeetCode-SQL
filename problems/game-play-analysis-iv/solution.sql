-- Write your PostgreSQL query statement below
SELECT ROUND(
    COUNT(DISTINCT a.player_id)::numeric
    /
    (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2
) AS fraction
FROM Activity a
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
ON a.player_id = f.player_id
AND a.event_date = f.first_login + INTERVAL '1 day';

/*
Description
1. Find each player's first login date.
2. Join back to the Activity table.
3. Check for activity on the day immediately after the first login.
4. Count qualifying players.
5. Divide by the total number of players and round to two decimals.
*/

/*
SELECT ROUND(
    COUNT(*)::numeric
    /
    (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2
) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
WHERE EXISTS (
    SELECT 1
    FROM Activity a
    WHERE a.player_id = f.player_id
      AND a.event_date = f.first_login + INTERVAL '1 day'
);
*/


/*
SELECT ROUND(
    COUNT(*)::numeric
    /
    (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2
) AS fraction
FROM (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
WHERE (
    SELECT COUNT(*)
    FROM Activity a
    WHERE a.player_id = f.player_id
      AND a.event_date = f.first_login + INTERVAL '1 day'
) > 0;
*/