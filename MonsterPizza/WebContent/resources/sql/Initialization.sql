
 -- TABLE ROLE

CREATE TABLE `role` (  
  `role_name` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(120) NULL COMMENT '',
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC)  COMMENT '',
  PRIMARY KEY (`role_name`)  COMMENT '')
ENGINE = InnoDB;

INSERT INTO role VALUES ('cook', 'prepare food');
INSERT INTO role VALUES ('manager', 'manage ingredients');
INSERT INTO role VALUES ('pizzerman', 'provide pizzas');
INSERT INTO role VALUES ('admin', 'admin');
INSERT INTO role VALUES ('deliverer', 'delivery boy');

-- TABLE USERS

CREATE TABLE `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(45) NOT NULL COMMENT '',
  `is_active` TINYINT(1) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `role` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`user_id`)  COMMENT '',
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC)  COMMENT '',
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)  COMMENT '')
ENGINE = InnoDB;

INSERT INTO user (username,password,is_active,role) VALUES ('Tomasz','1234',1,'cook');
INSERT INTO user (username,password,is_active,role) VALUES ('Aleksandra','1234',1, 'manager');
INSERT INTO user (username,password,is_active,role) VALUES ('Mateusz','1234',1,'pizzerman');
INSERT INTO user (username,password,is_active,role) VALUES ('admin','admin',1,'admin');
INSERT INTO user (username,password,is_active,role) VALUES ('delivery','delivery',1,'deliverer');
 
-- TABLE ROLE-USER
CREATE TABLE `user_role` (
  `role_name` VARCHAR(45) NOT NULL COMMENT '',
  `username` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`role_name`, `username`)  COMMENT '',
  INDEX `fk_role_has_user_role1_idx` (`role_name` ASC)  COMMENT '',
  INDEX `fk_user_role_user_username_idx` (`username` ASC)  COMMENT '',
  CONSTRAINT `fk_role_has_user_role1`
    FOREIGN KEY (`role_name`)
    REFERENCES `role` (`role_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_user_username`
    FOREIGN KEY (`username`)
    REFERENCES `user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO user_role VALUES('cook', 'Tomasz');
INSERT INTO user_role VALUES('manager', 'Aleksandra');
INSERT INTO user_role VALUES('pizzerman', 'Mateusz'); 

-- TABLE INGREDIENTS

CREATE TABLE ingredients (
  id INT NOT NULL AUTO_INCREMENT,  
  ingredient_name VARCHAR(50) DEFAULT NULL, 
  available_amount INT NOT NULL, 
  price DOUBLE NOT NULL, 
  PRIMARY KEY (id) 
);

INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(1,		100,				5.0,	'Mały spód');
INSERT INTO ingredients(id, available_amount, price, ingredient_name)
				VALUES(2,			100,				6.0,	'Średni spód');
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(3,			100,				7.0,	'Duży spód');
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(4,			100,				1.0,	'Sos pomidorowy');
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(5,			100,				1.0,	'Sos czosnkowy');
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(6,			100,				1.0,	'Sos chrzanowy');
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(7,			100,				1.0,	'Sos musztardowo-ziołowy');
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(8,			100,				1.0,	'Sos śmietanowy'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(9,			100,				1.0,	'Ser żółty'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(10,			100,				2.0,	'Pomidor'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(11,			100,				2.1,	'Cebula'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(12,			100,				2.0,	'Papryka'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(13,			100,				1.0,	'Ananas'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(14,			100,				2.0,	'Kukurydza'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(15,			100,				2.5,	'Kurczak'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(16,			100,				2.5,	'Szynka'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(17,			100,				1.0,	'Ogórki'); 
INSERT INTO ingredients(id, available_amount, price, ingredient_name) 
				VALUES(18,			100,				1.8,	'Papryki ostre'); 
                
-- TABLE ORDER-STATUS

CREATE TABLE order_status (
  id INT NOT NULL AUTO_INCREMENT, 
  state VARCHAR(100) NOT NULL, 
  PRIMARY KEY (id)
);

INSERT INTO order_status VALUES(1,'w trakcie przygotowywania');
INSERT INTO order_status VALUES(2,'gotowe do dostarczenia');
INSERT INTO order_status VALUES(3,'dostarczono');
INSERT INTO order_status VALUES(4,'anulowano');

-- TABLE ORDERS

CREATE TABLE orders (
  id INT NOT NULL AUTO_INCREMENT, 
  first_name VARCHAR(100) NOT NULL, 
  last_name VARCHAR(100) NOT NULL, 
  street_name VARCHAR(100) NOT NULL, 
  street_number VARCHAR(100) NOT NULL, 
  flat_number VARCHAR(100) NOT NULL,  
  postcode VARCHAR(100) NOT NULL, 
  telephone VARCHAR(100) NOT NULL, 
  amount DOUBLE NOT NULL, 
  status_id INT NOT NULL, 
  is_paid BOOL NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (status_id)
	REFERENCES order_status(id)
);

INSERT INTO orders	VALUES(1,'Dan','Radcliffe','London Street','14','4','896587','789456123',11.0,1,TRUE);
INSERT INTO orders	VALUES(2,'Alan','Turning','Fleed Street','74','10','123587','789123456',12.5,2,TRUE);
INSERT INTO orders	VALUES(3,'Jan','Sobieski','ul. Wiejska','1','8','45-896','623589654',11.0,2,TRUE);
INSERT INTO orders	VALUES(4,'Jimmie','Åkesson ','Mat Gatan','8','62','48796','142563254',11.0,3,TRUE);
            
-- TABLE ORDERED_PIZZAS

CREATE TABLE ordered_pizzas (
  id INT NOT NULL AUTO_INCREMENT, 
  order_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (order_id)
	REFERENCES orders(id)
  );
  
INSERT INTO ordered_pizzas VALUES(1,1);
INSERT INTO ordered_pizzas VALUES(2,2);
INSERT INTO ordered_pizzas VALUES(3,3);
INSERT INTO ordered_pizzas VALUES(4,4);
INSERT INTO ordered_pizzas VALUES(5,4);

-- TABLE INGREDIENTS-OF-ORDERED-PIZZAS

CREATE TABLE ingredients_of_ordered_pizzas (
  id INT NOT NULL AUTO_INCREMENT,
  ordered_pizzas_id INT NOT NULL,
  ingredient_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (ordered_pizzas_id)
	REFERENCES ordered_pizzas(id),
  FOREIGN KEY (ingredient_id)
	REFERENCES ingredients(id)
  );

INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(1,3);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(1,4);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(1,9);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(1,9);
INSERT ,INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(2,3);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(2,4);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(2,9);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(2,13);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(3,3);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(3,6);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(3,12);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(3,14);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(4,3);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(4,5);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(4,9);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(5,3);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(5,5);
INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id) VALUES(5,9);

SELECT * FROM orders WHERE id=4;

-- pobierz zamówienie nr 4 (id zamówienia, id zamówionych pizz, id składków do nich) 
SELECT ordered_pizzas.order_id, ingredients_of_ordered_pizzas.ordered_pizzas_id, ingredients_of_ordered_pizzas.ingredient_id
FROM ordered_pizzas, ingredients_of_ordered_pizzas 
WHERE ordered_pizzas.order_id=4
AND ingredients_of_ordered_pizzas.ordered_pizzas_id = ordered_pizzas.id;

-- pobierz listę składników do danej pizzy (id pizzy, id składniku, nazwa składniku
SELECT ordered_pizzas.id, ingredients_of_ordered_pizzas.ingredient_id, ingredients.ingredient_name
FROM ordered_pizzas, ingredients_of_ordered_pizzas, ingredients
WHERE ordered_pizzas.id=2
AND ingredients_of_ordered_pizzas.ordered_pizzas_id = ordered_pizzas.id
AND ingredients.id = ingredients_of_ordered_pizzas.ingredient_id;

-- pobierz cene pizzy
SELECT SUM(ingredients.price)
FROM ordered_pizzas, ingredients_of_ordered_pizzas, ingredients
WHERE ordered_pizzas.id=2
AND ingredients_of_ordered_pizzas.ordered_pizzas_id = ordered_pizzas.id
AND ingredients.id = ingredients_of_ordered_pizzas.ingredient_id;

-- pobierz cenę zamówienia id 4
SELECT SUM(ingredients.price)
FROM ordered_pizzas, ingredients_of_ordered_pizzas, ingredients
WHERE ordered_pizzas.order_id=4
AND ingredients_of_ordered_pizzas.ordered_pizzas_id = ordered_pizzas.id
AND ingredients.id = ingredients_of_ordered_pizzas.ingredient_id;