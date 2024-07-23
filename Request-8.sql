SELECT 
    gdb023.get_fiscal_qtr(date) AS quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC;
