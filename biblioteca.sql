-- CREATE TABLE "editorial" ------------------------------------
CREATE TABLE `editorial`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`razon_social` VarChar( 50 ) NOT NULL,
	`telefono` VarChar( 15 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "editorial_telefono" ---------------------------
CREATE TABLE `editorial_telefono`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`numero` VarChar( 15 ) NOT NULL,
	`editorial_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_editorial_id" ---------------------------
CREATE INDEX `index_editorial_id` ON `editorial_telefono`( `editorial_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "autor" ----------------------------------------
CREATE TABLE `autor`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`apellido` VarChar( 30 ) NOT NULL,
	`nombre` VarChar( 30 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "libro" ----------------------------------------
CREATE TABLE `libro`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`isbn` Char( 13 ) NOT NULL,
	`titulo` VarChar( 50 ) NOT NULL,
	`anio_escrito` SmallInt( 255 ) NOT NULL,
	`anio_edicion` SmallInt( 255 ) NOT NULL,
	`editorial_id` Int( 255 ) NOT NULL,
	`autor_id` Int( 255 ) NOT NULL,
	`autor_id_2` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_editorial_id1" --------------------------
CREATE INDEX `index_editorial_id1` ON `libro`( `editorial_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_autor_id" -------------------------------
CREATE INDEX `index_autor_id` ON `libro`( `autor_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_autor_id_2" -----------------------------
CREATE INDEX `index_autor_id_2` ON `libro`( `autor_id_2` );
-- -------------------------------------------------------------

-- CREATE TABLE "copia" ----------------------------------------
CREATE TABLE `copia`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`deteriorado` TinyInt( 255 ) NOT NULL,
	`libro_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_libro_id" -------------------------------
CREATE INDEX `index_libro_id` ON `copia`( `libro_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "prestamo" -------------------------------------
CREATE TABLE `prestamo`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`fecha_retiro` Date NOT NULL,
	`fecha_tope` Date NOT NULL,
	`fecha_devolucion` Date NOT NULL,
	`socio_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_socio_id" -------------------------------
CREATE INDEX `index_socio_id` ON `prestamo`( `socio_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "tbl_prestamo_MM_copia" ------------------------
CREATE TABLE `tbl_prestamo_MM_copia`( 
	`prestamo_id` Int( 255 ) NOT NULL,
	`copia_id` Int( 255 ) NOT NULL )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "socio" ----------------------------------------
CREATE TABLE `socio`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`dni` VarChar( 10 ) NOT NULL,
	`apellido` VarChar( 30 ) NOT NULL,
	`nombre` VarChar( 30 ) NOT NULL,
	`direccion` VarChar( 70 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "socio_telefono" -------------------------------
CREATE TABLE `socio_telefono`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`numero` VarChar( 15 ) NOT NULL,
	`socio_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_socio_id1" ------------------------------
CREATE INDEX `index_socio_id1` ON `socio_telefono`( `socio_id` );
-- -------------------------------------------------------------

-- CREATE LINK "lnk_editorial_editorial_telefono" --------------
ALTER TABLE `editorial_telefono`
	ADD CONSTRAINT `lnk_editorial_editorial_telefono` FOREIGN KEY ( `editorial_id` )
	REFERENCES `editorial`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_editorial_libro" ---------------------------
ALTER TABLE `libro`
	ADD CONSTRAINT `lnk_editorial_libro` FOREIGN KEY ( `editorial_id` )
	REFERENCES `editorial`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_libro_copia" -------------------------------
ALTER TABLE `copia`
	ADD CONSTRAINT `lnk_libro_copia` FOREIGN KEY ( `libro_id` )
	REFERENCES `libro`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_copia_MM_prestamo" -------------------------
ALTER TABLE `tbl_prestamo_MM_copia`
	ADD CONSTRAINT `lnk_copia_MM_prestamo` FOREIGN KEY ( `copia_id` )
	REFERENCES `copia`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_prestamo_MM_copia" -------------------------
ALTER TABLE `tbl_prestamo_MM_copia`
	ADD CONSTRAINT `lnk_prestamo_MM_copia` FOREIGN KEY ( `prestamo_id` )
	REFERENCES `prestamo`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_socio_prestamo" ----------------------------
ALTER TABLE `prestamo`
	ADD CONSTRAINT `lnk_socio_prestamo` FOREIGN KEY ( `socio_id` )
	REFERENCES `socio`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_socio_socio_telefono" ----------------------
ALTER TABLE `socio_telefono`
	ADD CONSTRAINT `lnk_socio_socio_telefono` FOREIGN KEY ( `socio_id` )
	REFERENCES `socio`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_autor_libro_2" -----------------------------
ALTER TABLE `libro`
	ADD CONSTRAINT `lnk_autor_libro_2` FOREIGN KEY ( `autor_id_2` )
	REFERENCES `autor`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------