
WITH AVG_TRAN AS (
SELECT
    p.product_line,
    d.month,
    s.city,
    ROUND(avg(f.total), 2) as avg_trans                            
FROM fact_sales f
LEFT JOIN dim_product p on f.cat_id = p.cat_id
LEFT JOIN dim_date d on f.date_id = d.date_id
LEFT JOIN dim_store s on s.store_id = f.store_id
GROUP BY 
    p.product_line,
    d.month,
    s.city
),
ranking as (
SELECT 
    product_line,
    month,
    city,
    avg_trans,
    rank() over (partition by month, city order by avg_trans desc) AS rnk
FROM AVG_TRAN
)
SELECT
    month,
    city,
    product_line,
    avg_trans
FROM ranking
WHERE rnk <= 3                                
ORDER BY  city asc, month asc, avg_trans DESC
