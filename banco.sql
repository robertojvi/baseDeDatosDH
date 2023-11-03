-- CREATE TABLE "sucursales" -----------------------------------
CREATE TABLE `sucursales`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`numero_sucursal` Int( 255 ) NOT NULL,
	`nombre_ciudad` VarChar( 50 ) NOT NULL,
	`codigo_postal` VarChar( 10 ) NOT NULL,
	`pais` VarChar( 50 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "cliente" --------------------------------------
CREATE TABLE `cliente`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`apellido` VarChar( 50 ) NOT NULL,
	`nombre` VarChar( 50 ) NOT NULL,
	`domicilio` VarChar( 255 ) NOT NULL,
	`ciudad` VarChar( 50 ) NOT NULL,
	`pais` VarChar( 50 ) NOT NULL,
	`email` VarChar( 50 ) NOT NULL,
	`telefono_movil` VarChar( 20 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "cuenta" ---------------------------------------
CREATE TABLE `cuenta`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`tipo_cuenta` VarChar( 20 ) NOT NULL,
	`activa` TinyInt( 2 ) NOT NULL,
	`saldo` Decimal NOT NULL,
	`fecha_hora_acceso` DateTime NOT NULL,
	`empleado_id` Int( 255 ) NOT NULL,
	`sucursales_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_empleado_id" ----------------------------
CREATE INDEX `index_empleado_id` ON `cuenta`( `empleado_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_sucursales_id" --------------------------
CREATE INDEX `index_sucursales_id` ON `cuenta`( `sucursales_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "prestamo" -------------------------------------
CREATE TABLE `prestamo`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`fecha_otorgamiento` Date NOT NULL,
	`importe_prestamo` Decimal NOT NULL,
	`numero_cuotas` Int( 255 ) NOT NULL,
	`sucursales_id` Int( 255 ) NOT NULL,
	`empleado_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_sucursales_id1" -------------------------
CREATE INDEX `index_sucursales_id1` ON `prestamo`( `sucursales_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_empleado_id1" ---------------------------
CREATE INDEX `index_empleado_id1` ON `prestamo`( `empleado_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "interes" --------------------------------------
CREATE TABLE `interes`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`tipo_interes` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "pago" -----------------------------------------
CREATE TABLE `pago`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`numero_cuota` Int( 255 ) NOT NULL,
	`fecha_hora_pago` DateTime NOT NULL,
	`importe_pagado` Decimal NOT NULL,
	`prestamo_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_prestamo_id" ----------------------------
CREATE INDEX `index_prestamo_id` ON `pago`( `prestamo_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "empleado" -------------------------------------
CREATE TABLE `empleado`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`apellido` VarChar( 50 ) NOT NULL,
	`nombre` VarChar( 50 ) NOT NULL,
	`domicilio` VarChar( 255 ) NOT NULL,
	`ciudad` VarChar( 50 ) NOT NULL,
	`pais` VarChar( 50 ) NOT NULL,
	`email` VarChar( 50 ) NOT NULL,
	`telefono_movil` VarChar( 20 ) NOT NULL,
	`fecha_contrato` Date NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "tbl_cuenta_MM_cliente" ------------------------
CREATE TABLE `tbl_cuenta_MM_cliente`( 
	`cuenta_id` Int( 255 ) NOT NULL,
	`cliente_id` Int( 255 ) NOT NULL )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "tbl_interes_MM_cuenta" ------------------------
CREATE TABLE `tbl_interes_MM_cuenta`( 
	`interes_id` Int( 255 ) NOT NULL,
	`cuenta_id` Int( 255 ) NOT NULL )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "tbl_prestamo_MM_cliente" ----------------------
CREATE TABLE `tbl_prestamo_MM_cliente`( 
	`prestamo_id` Int( 255 ) NOT NULL,
	`cliente_id` Int( 255 ) NOT NULL )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_empleado_cuenta" ---------------------------
ALTER TABLE `cuenta`
	ADD CONSTRAINT `lnk_empleado_cuenta` FOREIGN KEY ( `empleado_id` )
	REFERENCES `empleado`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cliente_MM_cuenta" -------------------------
ALTER TABLE `tbl_cuenta_MM_cliente`
	ADD CONSTRAINT `lnk_cliente_MM_cuenta` FOREIGN KEY ( `cliente_id` )
	REFERENCES `cliente`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cuenta_MM_cliente" -------------------------
ALTER TABLE `tbl_cuenta_MM_cliente`
	ADD CONSTRAINT `lnk_cuenta_MM_cliente` FOREIGN KEY ( `cuenta_id` )
	REFERENCES `cuenta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_sucursales_cuenta" -------------------------
ALTER TABLE `cuenta`
	ADD CONSTRAINT `lnk_sucursales_cuenta` FOREIGN KEY ( `sucursales_id` )
	REFERENCES `sucursales`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cuenta_MM_interes" -------------------------
ALTER TABLE `tbl_interes_MM_cuenta`
	ADD CONSTRAINT `lnk_cuenta_MM_interes` FOREIGN KEY ( `cuenta_id` )
	REFERENCES `cuenta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_interes_MM_cuenta" -------------------------
ALTER TABLE `tbl_interes_MM_cuenta`
	ADD CONSTRAINT `lnk_interes_MM_cuenta` FOREIGN KEY ( `interes_id` )
	REFERENCES `interes`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_sucursales_prestamo" -----------------------
ALTER TABLE `prestamo`
	ADD CONSTRAINT `lnk_sucursales_prestamo` FOREIGN KEY ( `sucursales_id` )
	REFERENCES `sucursales`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cliente_MM_prestamo" -----------------------
ALTER TABLE `tbl_prestamo_MM_cliente`
	ADD CONSTRAINT `lnk_cliente_MM_prestamo` FOREIGN KEY ( `cliente_id` )
	REFERENCES `cliente`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_prestamo_MM_cliente" -----------------------
ALTER TABLE `tbl_prestamo_MM_cliente`
	ADD CONSTRAINT `lnk_prestamo_MM_cliente` FOREIGN KEY ( `prestamo_id` )
	REFERENCES `prestamo`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_prestamo_pago" -----------------------------
ALTER TABLE `pago`
	ADD CONSTRAINT `lnk_prestamo_pago` FOREIGN KEY ( `prestamo_id` )
	REFERENCES `prestamo`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_empleado_prestamo" -------------------------
ALTER TABLE `prestamo`
	ADD CONSTRAINT `lnk_empleado_prestamo` FOREIGN KEY ( `empleado_id` )
	REFERENCES `empleado`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------