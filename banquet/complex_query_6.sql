USE banquet;

DROP VIEW most_popular_hall;

CREATE VIEW most_popular_hall AS
SELECT id_hall, COUNT(*) AS count FROM ordering_a_banquet WHERE date_and_time_of_the_banquet LIKE '2020-%-%' GROUP BY id_hall;

SELECT id_hall, name_of_the_hall, max_number_of_seats 
FROM hall 
WHERE id_hall IN (SELECT id_hall FROM most_popular_hall WHERE count = (SELECT MAX(count) FROM most_popular_hall));