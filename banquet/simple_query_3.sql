USE banquet;
SELECT * FROM ordering_a_banquet WHERE date_and_time_of_the_banquet BETWEEN NOW() - INTERVAL 2 DAY AND NOW();