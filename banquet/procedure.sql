USE banquet;
DROP PROCEDURE show_report;
DELIMITER $$
CREATE PROCEDURE show_report(IN this_year INT, IN this_month ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'))
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE _id_manager INT UNSIGNED;
    DECLARE _count INT UNSIGNED;
    DECLARE _sum INT UNSIGNED;
    
    DECLARE c CURSOR FOR
    SELECT r.id_manager, r.count, r.sum
    FROM manager AS m
      INNER JOIN (SELECT id_manager, COUNT(*) AS count, SUM(real_value) AS sum
			      FROM ordering_a_banquet
	              WHERE this_year = YEAR(date_and_time_of_the_banquet) AND this_month = MONTH(date_and_time_of_the_banquet)
                  GROUP BY id_manager) AS r 
	  ON m.id_manager = r.id_manager;
      
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    
	IF EXISTS(SELECT 1 
			  FROM report 
			  WHERE report_year = this_year AND report_month = this_month
              ) THEN SIGNAL SQLSTATE '01000'
				     SET MESSAGE_TEXT = 'ERROR';
	ELSE
	  OPEN c;
      REPEAT FETCH c INTO _id_manager, _count, _sum;
        IF NOT done THEN
		  INSERT INTO report SET report_year = this_year, 
                                 report_month = this_month,
                                 id_manager = _id_manager,
                                 number_of_orders = _count,
                                 total_cost_of_orders = _sum; 
	END IF;
	UNTIL done END REPEAT; 
	CLOSE c;
    SELECT * FROM report;
    END IF;
END$$
DELIMITER ;
CALL show_report(2020, 9);