SELECT 
    m.product_code,
    p.product,
    ROUND(m.manufacturing_cost, 2) AS manufacturing_cost
FROM
    fact_manufacturing_cost m
        JOIN
    dim_product p USING (product_code)
WHERE
    manufacturing_cost IN ((SELECT 
            MIN(manufacturing_cost)
        FROM
            fact_manufacturing_cost) , (SELECT 
                MAX(manufacturing_cost)
            FROM
                fact_manufacturing_cost));
