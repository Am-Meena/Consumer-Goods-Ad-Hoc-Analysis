CREATE DEFINER=`root`@`localhost` FUNCTION `get_unique_products_for_FY`(in_fiscal_year int) RETURNS int
    DETERMINISTIC
BEGIN
declare unique_products int;
select count(distinct(product_code)) into unique_products
	from fact_sales_monthly where fiscal_year = in_fiscal_year;
    return unique_products;
END