WITH monthly AS (
    SELECT
        s.city,
        s.branch,
        d.month,
        d.month_name,
        ROUND(SUM(f.total), 2) as total_revenue
    FROM fact_sales f
    LEFT JOIN dim_store s ON f.store_id = s.store_id
    LEFT JOIN dim_date d ON f.date_id = d.date_id
    GROUP BY
        s.city,
        s.branch,
        d.month,
        d.month_name
),
with_lag AS (
    SELECT
        city,
        branch,
        month,
        month_name,
        total_revenue,
        LAG(total_revenue) OVER (
            PARTITION BY city, branch
            ORDER BY month
        ) as prev_month_revenue
    FROM monthly
)
SELECT
    city,
    branch,
    month_name,
    total_revenue,
    prev_month_revenue,
    ROUND(total_revenue - prev_month_revenue, 2) as revenue_change,
    CASE
        WHEN prev_month_revenue IS NULL THEN 'N/A'
        WHEN total_revenue > prev_month_revenue THEN 'Up'
        WHEN total_revenue < prev_month_revenue THEN 'Down'
        ELSE 'Flat'
    END as trend
FROM with_lag
ORDER BY city, branch, month
