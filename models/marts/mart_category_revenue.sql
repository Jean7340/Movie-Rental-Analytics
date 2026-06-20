SELECT
    category_name,
    COUNT(DISTINCT film_id) AS film_count,
    SUM(film_rental_count) AS total_rentals,
    SUM(film_revenue) AS total_revenue,
    ROUND(SUM(film_revenue) / NULLIF(SUM(film_rental_count), 0), 2) AS revenue_per_rental
FROM {{ ref('stg_customer_film_analytics') }}
GROUP BY category_name
