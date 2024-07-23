SELECT 
    c.channel,
    ROUND(SUM(s.sold_quantity * g.gross_price) / 1000000,
            2) AS gross_sales_mln,
    ROUND(SUM(s.sold_quantity * g.gross_price) / 1000000 * 100 / (SELECT 
                    SUM(s.sold_quantity * g.gross_price) / 1000000
                FROM
                    fact_sales_monthly s
                        JOIN
                    fact_gross_price g USING (product_code)
                WHERE
                    s.fiscal_year = 2021),
            2) AS percentage
FROM
    dim_customer c
        JOIN
    fact_sales_monthly s USING (customer_code)
        JOIN
    fact_gross_price g USING (product_code)
WHERE
    s.fiscal_year = 2021
GROUP BY c.channel
ORDER BY gross_sales_mln DESC
