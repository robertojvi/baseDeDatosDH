-- CREATE TABLE "sucursal" -------------------------------------
CREATE TABLE `sucursal`( 
	`id` Int( 255 ) NOT NULL,
	`codigo_postal` Int( 255 ) NOT NULL,
	`ciudad_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_ciudad_id" ------------------------------
CREATE INDEX `index_ciudad_id` ON `sucursal`( `ciudad_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "pais" -----------------------------------------
CREATE TABLE `pais`( 
	`id` Int( 255 ) NOT NULL,
	`nombre_pais` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "ciudad" ---------------------------------------
CREATE TABLE `ciudad`( 
	`id` Int( 255 ) NOT NULL,
	`nombre_ciudad` VarChar( 255 ) NOT NULL,
	`pais_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_pais_id" --------------------------------
CREATE INDEX `index_pais_id` ON `ciudad`( `pais_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "cliente" --------------------------------------
CREATE TABLE `cliente`( 
	`id` Int( 255 ) NOT NULL,
	`apellido` VarChar( 255 ) NOT NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`domicilio` VarChar( 255 ) NOT NULL,
	`email` VarChar( 255 ) NOT NULL,
	`telefono_movil` VarChar( 255 ) NOT NULL,
	`ciudad_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_ciudad_id1" -----------------------------
CREATE INDEX `index_ciudad_id1` ON `cliente`( `ciudad_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "empleado" -------------------------------------
CREATE TABLE `empleado`( 
	`id` Int( 255 ) NOT NULL,
	`apellido` VarChar( 255 ) NOT NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`domicilio` VarChar( 255 ) NOT NULL,
	`email` VarChar( 255 ) NOT NULL,
	`telefono_movil` VarChar( 255 ) NOT NULL,
	`fecha_contrato` Date NOT NULL,
	`sucursal_id` Int( 255 ) NOT NULL,
	`ciudad_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_sucursal_id2" ---------------------------
CREATE INDEX `index_sucursal_id2` ON `empleado`( `sucursal_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_ciudad_id2" -----------------------------
CREATE INDEX `index_ciudad_id2` ON `empleado`( `ciudad_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "tipo_cuenta" ----------------------------------
CREATE TABLE `tipo_cuenta`( 
	`id` Int( 255 ) NOT NULL,
	`descripcion` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "cuenta" ---------------------------------------
CREATE TABLE `cuenta`( 
	`id` Int( 255 ) NOT NULL,
	`cuenta_activa` TinyInt( 255 ) NOT NULL,
	`saldo` Decimal NOT NULL,
	`tipo_cuenta_id` Int( 255 ) NOT NULL,
	`tipo_interes_id` Int( 255 ) NOT NULL,
	`descubierto_otorgado` Decimal NOT NULL,
	`sucursal_id` Int( 255 ) NOT NULL,
	`empleado_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_tipo_cuenta_id" -------------------------
CREATE INDEX `index_tipo_cuenta_id` ON `cuenta`( `tipo_cuenta_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_tipo_interes_id" ------------------------
CREATE INDEX `index_tipo_interes_id` ON `cuenta`( `tipo_interes_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_sucursal_id" ----------------------------
CREATE INDEX `index_sucursal_id` ON `cuenta`( `sucursal_id` );
-- -------------------------------------------------------------

-- CREATE INDEX "index_empleado_id" ----------------------------
CREATE INDEX `index_empleado_id` ON `cuenta`( `empleado_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "prestamo" -------------------------------------
CREATE TABLE `prestamo`( 
	`sucursal_id` Int( 255 ) NOT NULL,
	`id` Int( 255 ) NOT NULL,
	`fecha_otorgamiento` Date NOT NULL,
	`importe_prestamo` Decimal NOT NULL,
	`cantidad_cuotas` Decimal NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_sucursal_id1" ---------------------------
CREATE INDEX `index_sucursal_id1` ON `prestamo`( `sucursal_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "acceso" ---------------------------------------
CREATE TABLE `acceso`( 
	`id` Int( 255 ) NOT NULL,
	`fecha_acceso` Date NOT NULL,
	`hora_acceso` Time NOT NULL,
	`cuenta_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_cuenta_id" ------------------------------
CREATE INDEX `index_cuenta_id` ON `acceso`( `cuenta_id` );
-- -------------------------------------------------------------

-- CREATE TABLE "tipo_interes" ---------------------------------
CREATE TABLE `tipo_interes`( 
	`id` Int( 255 ) NOT NULL,
	`descripcion_interes` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "tbl_cliente_MM_cuenta" ------------------------
CREATE TABLE `tbl_cliente_MM_cuenta`( 
	`cliente_id` Int( 255 ) NOT NULL,
	`cuenta_id` Int( 255 ) NOT NULL )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "pago" -----------------------------------------
CREATE TABLE `pago`( 
	`id` Int( 255 ) NOT NULL,
	`numero_cuota` Int( 255 ) NOT NULL,
	`fecha_hora_pago` DateTime NOT NULL,
	`valor_pago` Decimal NOT NULL,
	`prestamo_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE INDEX "index_prestamo_id" ----------------------------
CREATE INDEX `index_prestamo_id` ON `pago`( `prestamo_id` );
-- -------------------------------------------------------------

-- CREATE LINK "lnk_pais_ciudad" -------------------------------
ALTER TABLE `ciudad`
	ADD CONSTRAINT `lnk_pais_ciudad` FOREIGN KEY ( `pais_id` )
	REFERENCES `pais`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_ciudad_sucursal" ---------------------------
ALTER TABLE `sucursal`
	ADD CONSTRAINT `lnk_ciudad_sucursal` FOREIGN KEY ( `ciudad_id` )
	REFERENCES `ciudad`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_ciudad_cliente" ----------------------------
ALTER TABLE `cliente`
	ADD CONSTRAINT `lnk_ciudad_cliente` FOREIGN KEY ( `ciudad_id` )
	REFERENCES `ciudad`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cuenta_acceso" -----------------------------
ALTER TABLE `acceso`
	ADD CONSTRAINT `lnk_cuenta_acceso` FOREIGN KEY ( `cuenta_id` )
	REFERENCES `cuenta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_tipo_cuenta_cuenta" ------------------------
ALTER TABLE `cuenta`
	ADD CONSTRAINT `lnk_tipo_cuenta_cuenta` FOREIGN KEY ( `tipo_cuenta_id` )
	REFERENCES `tipo_cuenta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_tipo_interes_cuenta" -----------------------
ALTER TABLE `cuenta`
	ADD CONSTRAINT `lnk_tipo_interes_cuenta` FOREIGN KEY ( `tipo_interes_id` )
	REFERENCES `tipo_interes`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cuenta_MM_cliente" -------------------------
ALTER TABLE `tbl_cliente_MM_cuenta`
	ADD CONSTRAINT `lnk_cuenta_MM_cliente` FOREIGN KEY ( `cuenta_id` )
	REFERENCES `cuenta`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_cliente_MM_cuenta" -------------------------
ALTER TABLE `tbl_cliente_MM_cuenta`
	ADD CONSTRAINT `lnk_cliente_MM_cuenta` FOREIGN KEY ( `cliente_id` )
	REFERENCES `cliente`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_sucursal_cuenta" ---------------------------
ALTER TABLE `cuenta`
	ADD CONSTRAINT `lnk_sucursal_cuenta` FOREIGN KEY ( `sucursal_id` )
	REFERENCES `sucursal`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_sucursal_prestamo" -------------------------
ALTER TABLE `prestamo`
	ADD CONSTRAINT `lnk_sucursal_prestamo` FOREIGN KEY ( `sucursal_id` )
	REFERENCES `sucursal`( `id` )
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

-- CREATE LINK "lnk_sucursal_empleado" -------------------------
ALTER TABLE `empleado`
	ADD CONSTRAINT `lnk_sucursal_empleado` FOREIGN KEY ( `sucursal_id` )
	REFERENCES `sucursal`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_ciudad_empleado" ---------------------------
ALTER TABLE `empleado`
	ADD CONSTRAINT `lnk_ciudad_empleado` FOREIGN KEY ( `ciudad_id` )
	REFERENCES `ciudad`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_empleado_cuenta" ---------------------------
ALTER TABLE `cuenta`
	ADD CONSTRAINT `lnk_empleado_cuenta` FOREIGN KEY ( `empleado_id` )
	REFERENCES `empleado`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------