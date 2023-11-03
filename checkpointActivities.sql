INSERT INTO `interes` ( `tipo_interes`) 
VALUES ( "Interés Fijo" ),
("Interés Variable"),
("Otros interes");


INSERT INTO `tipo_cuenta` ( `descripcion_tipo`) 
VALUES ( "C.A." ),
( "C.C." ),
( "Otras" );

UPDATE `tipo_cuenta` SET
	`descripcion_tipo` = "CAJA DE AHORRO"
WHERE `id` = 1;

UPDATE `tipo_cuenta` SET
	`descripcion_tipo` = "CUENTA CORRIENTE"
WHERE `id` = 2;

DELETE FROM `tipo_cuenta`
WHERE `id` = 3;

SELECT * FROM tipo_cuenta