/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * You're where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */

WITH temp AS (
    SELECT DISTINCT c.customer_id
    FROM film f
    JOIN film_actor fa USING (film_id)
    JOIN actor a USING (actor_id)
    JOIN inventory i USING (film_id)
    JOIN rental r USING (inventory_id)
    JOIN customer c USING (customer_id)
    WHERE a.first_name = 'RUSSELL' AND
          a.last_name = 'BACALL'
)

SELECT count(customer_id)
FROM temp
;

