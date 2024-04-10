CREATE DATABASE banquet;
USE banquet;
CREATE TABLE manager (
			id_manager INTEGER AUTO_INCREMENT,
            surname VARCHAR(20) NOT NULL,
            date_of_birth DATE NOT NULL,
            date_of_admission DATE NOT NULL,
            date_of_dismissial DATE NULL DEFAULT NULL,
            PRIMARY KEY (id_manager)
);
CREATE TABLE menu (
			id_dish INTEGER AUTO_INCREMENT,
            name_of_the_dish VARCHAR(20) NOT NULL,
			price FLOAT NOT NULL,
			weight SMALLINT UNSIGNED NOT NULL,
            PRIMARY KEY (id_dish)
);
CREATE TABLE hall (
			id_hall INTEGER AUTO_INCREMENT,
            name_of_the_hall VARCHAR(20) NOT NULL,
            max_number_of_seats SMALLINT UNSIGNED NOT NULL,
            PRIMARY KEY (id_hall)
);
CREATE TABLE ordering_a_banquet (
			id_order INTEGER AUTO_INCREMENT,
            id_manager INTEGER NOT NULL,
            date_and_time_of_the_banquet DATETIME NOT NULL,
            number_of_participants SMALLINT UNSIGNED NOT NULL,
            id_hall INTEGER NOT NULL,
            advance_payment_amount FLOAT NULL,
            real_value FLOAT NULL,
            PRIMARY KEY (id_order),
            FOREIGN KEY (id_manager) REFERENCES manager (id_manager),
            FOREIGN KEY (id_hall) REFERENCES hall (id_hall)
);
CREATE TABLE list_of_dishes (
			id_of_the_dish_in_the_list INTEGER AUTO_INCREMENT,
            id_dish INTEGER NOT NULL,
            number_of_dishes SMALLINT UNSIGNED NOT NULL,
            id_order INTEGER NOT NULL,
            PRIMARY KEY (id_of_the_dish_in_the_list),
            FOREIGN KEY (id_dish) REFERENCES menu (id_dish),
            FOREIGN KEY (id_order) REFERENCES ordering_a_banquet (id_order)
);
CREATE TABLE report (
			id_report INTEGER AUTO_INCREMENT,
            report_year YEAR NOT NULL,
            report_month VARCHAR(15) NOT NULL,
            id_manager INTEGER NOT NULL,
            number_of_orders SMALLINT UNSIGNED NOT NULL,
            total_cost_of_orders FLOAT NOT NULL,
            PRIMARY KEY (id_report),
            FOREIGN KEY (id_manager) REFERENCES manager (id_manager)
);