CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_qtr`(calendar_date date) RETURNS char(4) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare quarter char(4);
case
when month(calendar_date) in (09,10,11) then set quarter = 'qtr1';
when month(calendar_date) in (12,01,02) then set quarter ='qtr2';
when month(calendar_date) in (03,04,05) then set quarter ='qtr3';
else set quarter ='qtr4';
end case;
RETURN quarter;
END