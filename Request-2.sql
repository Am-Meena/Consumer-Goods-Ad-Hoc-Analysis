with cte as
(select get_unique_products_for_FY(2020) as unique_products_2020,
get_unique_products_for_FY(2021) as unique_products_2021)
select *,
(unique_products_2021 - unique_products_2020)*100/unique_products_2020
 as percentage_chg
 from cte;