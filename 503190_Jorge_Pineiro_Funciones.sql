use 503190_jorge_pineiro;

/*
Funcion para convertir el precio del juego en dolares a pesos argentinos, aplicando los impuestos (30% concepto pais y percepcion 45%)
Utilizamos el campo TITULO de la tabla JUEGOS bajo el campo NOMBRE_JUEGO y creamos el campo PRECIO_DOLAR, que utilizará el campo PRECIO de la tabla JUEGOS.
Para llamar a la funcion se debe ingresar el nombre del juego, el cual se buscara dentro de la tabla JUEGOS bajo el campo TITULO, y luego se ingresara el valor actual del dolar.
Nos va a devolver el precio del dolar multiplicado por el valor del juego, y luego sumando el 75% por los impuestos.
El valor que devuelve es de tipo DECIMAL.
*/
DROP FUNCTION IF EXISTS FN_PESOS;
DELIMITER $$
CREATE FUNCTION FN_PESOS(NOMBRE_JUEGO VARCHAR(50), PRECIO_DOLAR DECIMAL (10,2))
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	DECLARE PRECIO_JUEGO DECIMAL;
	SELECT PRECIO INTO PRECIO_JUEGO FROM JUEGOS WHERE TITULO = NOMBRE_JUEGO;
	RETURN (PRECIO_JUEGO * PRECIO_DOLAR) * 1.75;
END$$
DELIMITER ;
-- Llamamos a la funcion para ver el precio en pesos de un titulo especifico
SELECT FN_PESOS('Silent Hill 2', 943.66);

/*
Funcion para verificar si un juego es para todas las edades o no.
Creamos NOMBRE_JUEGO que buscara dentro de la tabla JUEGOS el campo TITULO.
Para llamar a la funcion le damos un valor a NOMBRE_JUEGO y si coincide con algun TITULo de la tabla JUEGOS la funcion buscara
el campO PEGI asociado a ese TITULO y nos dira si es para adultos, en caso de que el PEGI (clasificacion por edades) sea +18
o caso contrario nos dira que es apto para todo publico.
*/
DROP FUNCTION IF EXISTS FN_ADULTOS;
DELIMITER $$
CREATE FUNCTION FN_ADULTOS(NOMBRE_JUEGO VARCHAR(50))
RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
	DECLARE PEGI_JUEGO VARCHAR(4);
	DECLARE MAYOR_EDAD VARCHAR(3);
    
	SELECT PEGI INTO PEGI_JUEGO FROM JUEGOS WHERE TITULO = NOMBRE_JUEGO;
    
	IF PEGI_JUEGO = '+18' THEN
		SET MAYOR_EDAD = 'Si';
	ELSE
		SET MAYOR_EDAD = 'No';
	END IF;
    
    RETURN MAYOR_EDAD;
    
END$$
DELIMITER ;
-- Llamamos a la funcion para verificar si un juego es para adultos o no (+18)
SELECT FN_ADULTOS('The Witcher 3');

