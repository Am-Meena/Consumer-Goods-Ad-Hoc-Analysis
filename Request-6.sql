SELECT 
    pre.customer_code, c.customer, pre.pre_invoice_discount_pct
FROM
    fact_pre_invoice_deductions pre
        JOIN
    dim_customer c USING (customer_code)
WHERE
    c.market = 'india'
        AND pre.pre_invoice_discount_pct IN (SELECT 
            AVG(pre_invoice_discount_pct)
        FROM
            gdb023.fact_pre_invoice_deductions
        WHERE
            fiscal_year = 2021
        GROUP BY customer_code)
ORDER BY pre.pre_invoice_discount_pct DESC
LIMIT 5;