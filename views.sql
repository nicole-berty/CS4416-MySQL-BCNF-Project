CREATE VIEW SALES_PER_EMPLOYEE AS
    SELECT employee_number, SUM(quantity)
    FROM sales
    GROUP BY `employee_number`
    HAVING SUM(quantity) >= 0;

CREATE VIEW MONTHLY_PAID_WITH_CASH AS
    SELECT COUNT(order_number), SUM(total_price), date_of_sale
    FROM Sales
    WHERE order_number IN (SELECT order_number
                       FROM Sales
                       WHERE type_of_payment = 'cash' AND date_of_sale LIKE '2019-11-__');


CREATE VIEW SALES_PER_DAY AS
SELECT date_of_sale, COUNT(order_number)
FROM Sales
GROUP BY date_of_sale
HAVING SUM(total_price) >= 1;
