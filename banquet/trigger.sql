USE banquet;
DROP TRIGGER new_report;
DELIMITER $$
CREATE TRIGGER new_report
AFTER UPDATE
ON ordering_a_banquet
FOR EACH ROW
IF EXISTS(SELECT 1 
		  FROM report AS r 
		  WHERE r.id_manager = NEW.id_manager
            AND r.report_year = YEAR(NEW.date_and_time_of_the_banquet) 
            AND r.report_month = MONTH(NEW.date_and_time_of_the_banquet)
          ) THEN UPDATE report AS r
				 SET r.number_of_orders = r.number_of_orders + 1, 
                     r.total_cost_of_orders = r.total_cost_of_orders + NEW.real_value
				 WHERE r.id_manager = NEW.id_manager 
					   AND r.report_year = YEAR(NEW.date_and_time_of_the_banquet) 
					   AND r.report_month = MONTH(NEW.date_and_time_of_the_banquet);
ELSE INSERT INTO report(report_year, report_month, id_manager, number_of_orders, total_cost_of_orders)
	 VALUES(YEAR(NEW.date_and_time_of_the_banquet), MONTH(NEW.date_and_time_of_the_banquet), NEW.id_manager, 1, NEW.real_value);
END IF$$
DELIMITER ;