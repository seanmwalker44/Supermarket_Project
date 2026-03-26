SELECT
    s.city,
    s.branch,
    p.product_line,
    ROUND(SUM(f.total), 2) as total_revenue,
    ROUND(SUM(f.gross_income), 2) as total_gross_income,
    ROUND(AVG(f.gross_income / f.total) * 100, 2) as gross_margin_pct
FROM fact_sales f
LEFT JOIN dim_store s ON f.store_id = s.store_id
LEFT JOIN dim_product p ON f.cat_id = p.cat_id
GROUP BY
    s.city,
    s.branch,
    p.product_line
ORDER BY s.city, total_revenue DESC