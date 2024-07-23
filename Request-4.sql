with 
pc_2020 as 
(select p.segment,
count(distinct(s.product_code)) as product_count_2020
	from dim_product p
    join fact_sales_monthly s
    using (product_code)
    where s.fiscal_year = 2020
    group by p.segment
    order by product_count_2020 desc
    ),
pc_2021 as 
(select p.segment,
count(distinct(s.product_code)) as product_count_2021
	from dim_product p
    join fact_sales_monthly s
    using (product_code)
    where s.fiscal_year = 2021
    group by p.segment
    order by product_count_2021 desc
    )
    select pc_2020.segment,
    pc_2020.product_count_2020,
    pc_2021.product_count_2021,
    pc_2021.product_count_2021 - pc_2020.product_count_2020 as difference
    from pc_2020
    join pc_2021
    using (segment);