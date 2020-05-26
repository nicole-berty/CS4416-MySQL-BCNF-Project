DELIMITER //

CREATE FUNCTION StaffLevel( 
    qtySold INT 
    ) 
    RETURNS VARCHAR(20) 
    DETERMINISTIC 
    BEGIN 
        DECLARE staffLevel VARCHAR(20); 
        
        IF qtySold > 25 THEN 
            SET staffLevel = 'PLATINUM'; 
        ELSEIF (qtySold >= 15 AND qtySold <= 25) THEN 
            SET staffLevel = 'GOLD'; 
        ELSEIF (qtySold >= 10 AND qtySold < 15) THEN 
        	SET staffLevel = 'SILVER'; 
        END IF; 
    RETURN (staffLevel); 
END//
 
CREATE PROCEDURE getQuantitySoldByEmployee(
    IN employeeNo INT,
    OUT quantitySold INT
)
BEGIN
    DECLARE num INT DEFAULT 0;
    SELECT
     employee_number, 
     SUM(quantity)
     INTO num, quantitySold
    FROM 
        sales
    WHERE employee_number = employeeNo AND date_of_sale BETWEEN '2019-01-01' AND 
            '2019-12-31';
END//

CREATE TRIGGER giveBonusForSalesMade
AFTER INSERT
ON sales FOR EACH ROW
BEGIN
	DECLARE bonusAmt FLOAT DEFAULT 0;
    DECLARE amtSold INT DEFAULT 0;
    DECLARE employee_level VARCHAR(20);
    
    SELECT bonus
    	INTO bonusAmt
    FROM staff
    WHERE staff.employee_number = NEW.employee_number;
    
    CALL getQuantitySoldByEmployee(NEW.employee_number, amtSold);
    SET employee_level = StaffLevel(amtSold);
    if(employee_level = 'PLATINUM') THEN
        UPDATE staff
    	SET bonus = IFNULL(bonus,0) + 250
        WHERE staff.employee_number = NEW.employee_number;
    END IF;
    if(employee_level = 'GOLD') THEN
        UPDATE staff
    	SET bonus = IFNULL(bonus,0) + 150
        WHERE staff.employee_number = NEW.employee_number;
    END IF;
    if(employee_level = 'SILVER') THEN
        UPDATE staff
    	SET bonus = IFNULL(bonus,0) + 75
        WHERE staff.employee_number = NEW.employee_number;
    END IF;
END//

CREATE TRIGGER UpdateStock
AFTER INSERT 
ON purchases
FOR EACH ROW 
BEGIN        
   UPDATE Inventory
   SET quantity_stored = quantity_stored + NEW.product_quantity
   WHERE product_name = NEW.product_supplied;
END//
DELIMITER ;
