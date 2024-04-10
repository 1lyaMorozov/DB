USE banquet;
SELECT id_manager, SUM(advance_payment_amount) FROM ordering_a_banquet WHERE date_and_time_of_the_banquet LIKE '2020-09-%' GROUP BY id_manager;