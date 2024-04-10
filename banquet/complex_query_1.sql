SELECT date_and_time_of_the_banquet AS 'Дата проведения', 
	   name_of_the_hall AS 'Название зала', 
       advance_payment_amount AS 'Начальная стоимость',
       real_value AS 'Конечная стоимость',
       surname AS 'Фамилия ответственного менеджера'
FROM hall INNER JOIN ordering_a_banquet
ON hall.id_hall = ordering_a_banquet.id_hall
INNER JOIN manager 
ON ordering_a_banquet.id_manager = manager.id_manager
WHERE date_and_time_of_the_banquet LIKE '2020-03-%';
