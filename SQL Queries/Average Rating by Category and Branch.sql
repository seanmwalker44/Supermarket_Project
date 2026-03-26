SELECT
s.city,
s.branch,
p.product_line,
ROUND(AVG(f.rating), 2) as avg_rating,
COUNT(*) as transaction_count,
ROUND(SUM(f.total), 2) as total_revenue,
RANK() OVER (
    PARTITION BY s.city
    ORDER BY AVG(f.rating) DESC
) as rating_rank
FROM fact_sales f
LEFT JOIN dim_store s ON f.store_id = s.store_id
LEFT JOIN dim_product p ON f.cat_id = p.cat_id
GROUP BY
s.city,
s.branch,
p.product_line
ORDER BY city, avg_rating DESC