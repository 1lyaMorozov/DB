SELECT id_manager, surname, date_of_birth, date_of_admission, date_of_dismissial 
FROM (SELECT * FROM manager LEFT JOIN ordering_a_banquet USING(id_manager)) query_in 
WHERE query_in.id_order IS NULL;