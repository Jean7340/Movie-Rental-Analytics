SELECT
    rental_month,
    category_name,
    COUNT(DISTINCT customer_id) AS active_customers,
    SUM(film_rental_count) AS total_rentals,
    SUM(film_revenue) AS total_revenue
FROM {{ ref('stg_customer_film_analytics') }}
GROUP BY
    rental_month,
    category_name
