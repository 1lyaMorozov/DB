SELECT manager.id_manager AS 'Уникальный номер',
	   surname AS 'Фамилия менеджера',
       COUNT(*) AS 'Общее количество принятых заказов',
       SUM(advance_payment_amount) AS 'Общая сумма принятых заказов'
FROM manager INNER JOIN (SELECT * FROM ordering_a_banquet WHERE date_and_time_of_the_banquet LIKE '2020-03-%') query_in
ON manager.id_manager = query_in.id_manager
GROUP BY manager.id_manager, surname;

