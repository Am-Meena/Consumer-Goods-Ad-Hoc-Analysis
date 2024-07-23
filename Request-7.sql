SELECT 
    CONCAT(MONTHNAME(s.date),
            ' (',
            YEAR(s.date),
            ')') AS month,
    s.fiscal_year,
    ROUND(SUM(s.sold_quantity * g.gross_price), 2) AS gross_sales_amount
FROM
    fact_sales_monthly s
        JOIN
    dim_customer C ON c.customer_code = s.customer_code
        JOIN
    fact_gross_price g ON s.product_code = g.product_code
WHERE
    c.customer = 'Atliq Exclusive'
GROUP BY month , s.fiscal_year
ORDER BY s.fiscal_year;
