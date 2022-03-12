/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

WITH valid_actor_id AS (
    SELECT actor_id
    FROM actor
    WHERE strpos(first_name, 'F') = 0 AND
          strpos(last_name, 'F') = 0
),

valid_customer_id AS (
    SELECT customer_id
    FROM customer
    WHERE strpos(first_name, 'F') = 0 AND
          strpos(last_name, 'F') = 0
)

SELECT DISTINCT f.title
FROM film f
JOIN film_actor fa USING (film_id)
JOIN inventory i USING (film_id)
JOIN rental r USING (inventory_id)
WHERE fa.actor_id IN (SELECT * FROM valid_actor_id) AND
      r.customer_id IN (SELECT * FROM valid_customer_id) AND
      strpos(title, 'F') = 0
ORDER BY f.title
;

