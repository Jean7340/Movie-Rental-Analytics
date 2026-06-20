SELECT
    customer_id,
    first_name,
    last_name,
    MAX(total_rentals) AS total_rentals,
    MAX(total_spent) AS customer_ltv,
    COUNT(DISTINCT film_id) AS films_watched,
    COUNT(DISTINCT category_name) AS categories_watched,
    ROUND(MAX(total_spent) / NULLIF(MAX(total_rentals), 0), 2) AS avg_spend_per_rental
FROM {{ ref('stg_customer_film_analytics') }}
GROUP BY
    customer_id,
    first_name,
    last_name
