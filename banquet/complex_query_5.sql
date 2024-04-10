SELECT id_manager, surname, date_of_birth, date_of_admission, date_of_dismissial
FROM manager LEFT JOIN (SELECT * FROM ordering_a_banquet WHERE date_and_time_of_the_banquet LIKE '2020-03-%') query_in
USING(id_manager)
WHERE id_order IS NULL;