SELECT * from socio s 


INSERT INTO `socio` (`dni`, `apellido`, `nombre`, `direccion`)
VALUES
  ('123456789', 'Garcia', 'Maria', '123 Main Street'),
  ('987654321', 'Rodriguez', 'Carlos', '456 Elm Avenue'),
  ('654321987', 'Lopez', 'Ana', '789 Oak Lane'),
  ('456789123', 'Martinez', 'Juan', '321 Pine Road'),
  ('111222333', 'Perez', 'Luis', '555 Cedar Court'),
  ('999888777', 'Torres', 'Laura', '777 Birch Street'),
  ('444555666', 'Sanchez', 'Pedro', '888 Spruce Lane'),
  ('777888999', 'Fernandez', 'Sofia', '999 Maple Road'),
  ('222333444', 'Gonzalez', 'Diego', '111 Willow Avenue'),
  ('555666777', 'Romero', 'Lucia', '444 Birch Lane');
  
 
 
 INSERT INTO `socio_telefono` (`numero`, `socio_id`)
VALUES
  ('555-123-4567', 1),
  ('555-987-6543', 2),
  ('555-789-3210', 3),
  ('555-234-5678', 4),
  ('555-876-5432', 5),
  ('555-345-6789', 6),
  ('555-654-3210', 7),
  ('555-432-1098', 8),
  ('555-210-9876', 9),
  ('555-789-1234', 10);
  
INSERT INTO `autor` (`apellido`, `nombre`)
VALUES
  ('Smith', 'John'),
  ('Johnson', 'Emily'),
  ('Williams', 'Michael'),
  ('Brown', 'Sarah'),
  ('Davis', 'Robert'),
  ('Miller', 'Jennifer'),
  ('Jones', 'David'),
  ('Wilson', 'Jessica');
 
INSERT INTO `editorial` (`razon_social`, `telefono`)
VALUES
  ('ABC Publishing', '555-123-4567'),
  ('XYZ Books', '555-789-1234'),
  ('Acme Publishers', '555-234-5678'),
  ('Great Reads Inc.', '555-876-5432'),
  ('Best Books Ltd.', '555-345-6789'),
  ('Global Publishing', '555-987-6543'),
  ('Sunshine Publications', '555-432-1098'),
  ('Liberty Press', '555-210-9876'),
  ('New Horizons Books', '555-654-3210'),
  ('Moonlit Publishing', '555-567-8901'),
  ('Silver Lining Books', '555-333-4444'),
  ('Golden Pages', '555-999-8888');
 
INSERT INTO `libro` (`isbn`, `titulo`, `anio_escrito`, `anio_edicion`, `editorial_id`, `autor_id`)
VALUES
  ('9781234567890', 'The Great Adventure', 2000, 2022, 1, 1),
  ('9789876543210', 'Mystery at Midnight', 1995, 2020, 2, 2),
  ('9785555555555', 'The Secret Garden', 1911, 2018, 3, 3),
  ('9788888888888', 'A Tale of Two Cities', 1859, 2019, 4, 4),
  ('9784444444444', 'The Alchemist', 1988, 2015, 5, 5),
  ('9781111111111', 'Harry Potter and the Sorcerer\'s Stone', 1997, 2014, 6, 6),
  ('9786666666666', 'The Hobbit', 1937, 2017, 7, 7),
  ('9782222222222', 'To Kill a Mockingbird', 1960, 2016, 8, 8),
  ('9783333333333', 'The Catcher in the Rye', 1951, 2021, 9, 1),
  ('9787777777777', '1984', 1949, 2013, 10, 2),
  ('9789999999999', 'Pride and Prejudice', 1813, 2012, 11, 3),
  ('9786666666667', 'The Lord of the Rings', 1954, 2011, 12, 4),
  ('9788888888887', 'Brave New World', 1932, 2010, 1, 5),
  ('9785555555556', 'The Odyssey', -800, 2015, 2, 6),
  ('9781234567891', 'War and Peace', 1869, 2009, 3, 7),
  ('9781111111112', 'Fahrenheit 451', 1953, 2008, 4, 8),
  ('9783333333334', 'The Divine Comedy', 1320, 2007, 5, 1),
  ('9787777777778', 'The Picture of Dorian Gray', 1890, 2006, 6, 2),
  ('9789999999998', 'One Hundred Years of Solitude', 1967, 2005, 7, 3),
  ('9785555555557', 'Dracula', 1897, 2004, 8, 4),
  ('9781234567892', 'The Road', 2006, 2003, 9, 5),
  ('9786666666668', 'The Shining', 1977, 2002, 10, 6),
  ('9784444444445', 'The Girl with the Dragon Tattoo', 2005, 2001, 11, 7),
  ('9788888888889', 'The Da Vinci Code', 2003, 2000, 12, 8);
 
 
 
 INSERT INTO `copia` (`deteriorado`, `libro_id`)
VALUES
  (0, 1),
  (1, 2),
  (0, 3),
  (1, 4),
  (0, 5),
  (1, 6),
  (0, 7),
  (1, 8),
  (0, 9),
  (1, 10),
  (0, 11),
  (1, 12),
  (0, 13),
  (1, 14),
  (0, 15),
  (1, 16),
  (0, 17),
  (1, 18),
  (0, 19),
  (1, 20);
 
INSERT INTO `prestamo` (`fecha_retiro`, `fecha_tope`, `fecha_devolucion`, `socio_id`)
VALUES
  ('2023-10-01', '2023-10-15', '2023-10-08', 1),
  ('2023-10-02', '2023-10-16', '2023-10-09', 2),
  ('2023-10-03', '2023-10-17', '2023-10-10', 3),
  ('2023-10-04', '2023-10-18', '2023-10-11', 4),
  ('2023-10-05', '2023-10-19', '2023-10-12', 5),
  ('2023-10-06', '2023-10-20', '2023-10-13', 6),
  ('2023-10-07', '2023-10-21', '2023-10-14', 7),
  ('2023-10-08', '2023-10-22', '2023-10-15', 8);
 
INSERT INTO `tbl_prestamo_MM_copia` (`prestamo_id`, `copia_id`)
VALUES
  (21, 51),
  (21, 52),
  (22, 53),
  (22, 54),
  (23, 55);
 


DELETE FROM `socio`
WHERE
	`id` = 10;

DELETE FROM `libro`
WHERE `id` = 1;

	      
UPDATE `socio`
SET `direccion` = 'Juan Bautista 5-111'
WHERE `id` = 3;
	      
SELECT * FROM socio s 
 