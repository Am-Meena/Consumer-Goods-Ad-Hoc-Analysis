SET SQL_MODE = '';
with cte as (
SELECT p.division, p.product_code, p.product, sum(s.sold_quantity) as total_sold_quantity,
dense_rank () over (partition by p.division order by sum(s.sold_quantity) desc) as rank_order
FROM dim_product p
join fact_sales_monthly s
using (product_code)
where fiscal_year = 2021
group by p.product_code)
select * from cte where rank_order < 4;
