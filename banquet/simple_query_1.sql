USE banquet;
SELECT MAX(advance_payment_amount) FROM ordering_a_banquet WHERE date_and_time_of_the_banquet BETWEEN '2020-03-01' AND '2020-03-31';