/*
La idea de mi proyecto consiste en crear una base de datos para una "revista" de videojuegos
virtual, es decir en una página web.
Como referencia existen hoy días páginas como "IGN" donde se califican juegos, entre otras cosas.
*/

-- Creamos el esquema que se va a estar utilizando para el proyecto final
DROP SCHEMA IF EXISTS 503190_jorge_pineiro ;
CREATE SCHEMA IF NOT EXISTS 503190_jorge_pineiro ;

USE 503190_jorge_pineiro ;
SET SQL_SAFE_UPDATES = 0;

-- TABLAS --

/*
La tabla JUEGOS hace referencia a la información de los juegos subidas a la web.
FECHA_L : Fecha de lanzamiento
CANTIDAD_J : Cantidad de jugadores. Es varchar porque pueden ser de 2-4 de 6-8, etc.
DURACION: Es varchar porque puede variar, ej: 10-18hs, 5-7hs. No hay una medida exacta
dado que cada jugador puede tardar más o menos en finalizar el juego.
PEGI: Clasificación por edades, +18, +16, etc.
*/

DROP TABLE IF EXISTS JUEGOS;
CREATE TABLE IF NOT EXISTS JUEGOS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(50) NOT NULL,
    VALORACION DECIMAL,
    FECHA_L DATE NOT NULL,
    PEGI VARCHAR(4),
    DESCRIPCION TEXT NOT NULL,
    DESARROLLADORA VARCHAR(50),
    MULTIPLAYER ENUM('SI','NO'),
    CANTIDAD_J VARCHAR(8),
    PRECIO DOUBLE,
    DURACION VARCHAR(20)
);

/*
Tabla DESARROLLADORAS contiene la información de las diferentes empresas desarrolladoras
de videojuegos.
*/
DROP TABLE IF EXISTS DESARROLLADORAS;
CREATE TABLE IF NOT EXISTS DESARROLLADORAS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DESARROLLADORA VARCHAR(50) NOT NULL
);

/*
La tabla JUEGO_DESARROLLADORA contiene los juegos que fueron creados por X empresa desarrolladora.
*/
DROP TABLE IF EXISTS JUEGO_DESARROLLADORA;
CREATE TABLE IF NOT EXISTS JUEGO_DESARROLLADORA (
    ID_JUEGO INT,
    ID_DESARROLLADORA INT,
    PRIMARY KEY (ID_JUEGO, ID_DESARROLLADORA),
    FOREIGN KEY (ID_JUEGO) REFERENCES JUEGOS(ID),
    FOREIGN KEY (ID_DESARROLLADORA) REFERENCES DESARROLLADORAS(ID)
);

/*
La tabla PLATAFORMAS contiene la información de las diferentes plataformas para jugar
que existen, como Nintendo, Playstation, PC, etc.
*/
DROP TABLE IF EXISTS PLATAFORMAS;
CREATE TABLE IF NOT EXISTS PLATAFORMAS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PLATAFORMA VARCHAR(25) NOT NULL
);

/*
La tabla JUEGO_PLATAFORMA contiene la información que especifica en cuántas plataformas
está disponible un determinado juego.
*/
DROP TABLE IF EXISTS JUEGO_PLATAFORMA;
CREATE TABLE IF NOT EXISTS JUEGO_PLATAFORMA (
    ID_JUEGO INT,
    ID_PLATAFORMA INT,
    PRIMARY KEY (ID_JUEGO, ID_PLATAFORMA),
    FOREIGN KEY (ID_JUEGO) REFERENCES JUEGOS(ID),
    FOREIGN KEY (ID_PLATAFORMA) REFERENCES PLATAFORMAS(ID)
);

/*
La tabla GENEROS contiene los diferentes generos que existen dentro de los videojuegos.
*/
DROP TABLE IF EXISTS GENEROS;
CREATE TABLE IF NOT EXISTS GENEROS (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    GENERO VARCHAR(25) NOT NULL
);

/*
La tabla JUEGO_GENERO contiene todos los generos que puede tener un juego
*/
DROP TABLE IF EXISTS JUEGO_GENERO;
CREATE TABLE IF NOT EXISTS JUEGO_GENERO (
    ID_JUEGO INT,
    ID_GENERO INT,
    PRIMARY KEY(ID_JUEGO, ID_GENERO),
    FOREIGN KEY (ID_JUEGO) REFERENCES JUEGOS(ID),
    FOREIGN KEY (ID_GENERO) REFERENCES GENEROS(ID)
);

/*
La tabla IDIOMAS contiene los diferentes idiomas que podemos encontrar en los juegos.
*/
DROP TABLE IF EXISTS IDIOMAS;
CREATE TABLE IF NOT EXISTS IDIOMAS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IDIOMA VARCHAR(20) NOT NULL
);

/*
La tabla JUEGO_IDIOMA contiene la información de idiomas que tiene un determinado juego.
*/
DROP TABLE IF EXISTS JUEGO_IDIOMA;
CREATE TABLE IF NOT EXISTS JUEGO_IDIOMA (
    ID_JUEGO INT,
    ID_IDIOMA INT,
    PRIMARY KEY(ID_JUEGO, ID_IDIOMA),
    FOREIGN KEY (ID_JUEGO) REFERENCES JUEGOS(ID),
    FOREIGN KEY (ID_IDIOMA) REFERENCES IDIOMAS(ID)
);

/*
Tome la decision de modificar la tabla ya que tenia las tablas creadas desde la primer entrega. Para mejor trazabilidad de los cambios que realice, decidi usar alter table.
Estos cambios son para que los triggers funcionen, ya que estos se ayudaran de los campos FECHA_CREACION y FECHA_ULTIMA_MODIFICACION.
*/
ALTER TABLE JUEGOS
ADD COLUMN FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN FECHA_ULTIMA_MODIFICACION TIMESTAMP DEFAULT NULL;

-- REGISTROS --

SELECT * FROM JUEGOS;

INSERT INTO JUEGOS (TITULO, VALORACION, FECHA_L, PEGI, DESCRIPCION, DESARROLLADORA, MULTIPLAYER, CANTIDAD_J, PRECIO, DURACION) VALUES
('The Witcher 3', 9.5, '2015-05-19', '+18', 'Juego de rol y aventura en un mundo abierto.', 'CD Projekt Red', 'NO', '1', 39.99, '50-200hs'),
('Resident Evil 4 Remake', 9.0, '2023-03-24', '+18', 'Remake del clasico juego de terror y supervivencia.', 'Capcom', 'NO', '1', 59.99, '15-20hs'),
('Silent Hill 2', 9.2, '2001-09-24', '+18', 'Juego de terror psicologico.', 'Konami', 'NO', '1', 29.99, '8-12hs'),
('Prince of Persia: The Lost Crown', 8.0, '2024-01-18', '+16', 'Juego de plataformas y accion con elementos de aventura.', 'Ubisoft', 'NO', '1', 49.99, '15-20hs'),
('Animal Crossing: New Horizons', 9.3, '2020-03-20', 'E', 'Juego de simulacion de vida en una isla desierta.', 'Nintendo', 'SI', '1-8', 59.99, '50-500hs'),
('Metroid Dread', 8.7, '2021-10-08', '+12', 'Juego de accion y aventura en 2D.', 'Nintendo', 'NO', '1', 59.99, '8-12hs'),
('Cyberpunk 2077', 8.0, '2020-12-10', '+18', 'Juego de rol y accion en un mundo abierto futurista.', 'CD Projekt Red', 'NO', '1', 59.99, '20-100hs'),
('Red Dead Redemption 2', 9.7, '2018-10-26', '+18', 'Juego de accion y aventura en un mundo abierto del Viejo Oeste.', 'Rockstar Games', 'SI', '1-32', 59.99, '40-150hs'),
('Braid', 8.8, '2008-08-06', 'E', 'Juego de plataformas y rompecabezas con manipulacion del tiempo.', 'Number None', 'NO', '1', 14.99, '5-7hs'),
('League of Legends', 9.0, '2009-10-27', '+12', 'Juego de estrategia y accion multijugador en línea.', 'Riot Games', 'SI', '1-10', 0.00, 'Indefinido');

INSERT INTO DESARROLLADORAS (DESARROLLADORA) VALUES
('CD Projekt Red'),
('Capcom'),
('Konami'),
('Ubisoft'),
('Nintendo'),
('Rockstar Games'),
('Number None'),
('Riot Games');

INSERT INTO JUEGO_DESARROLLADORA (ID_JUEGO, ID_DESARROLLADORA) VALUES
(1, 1),  -- The Witcher 3 - CD Projekt Red
(2, 2),  -- Resident Evil 4 Remake - Capcom
(3, 3),  -- Silent Hill 2 - Konami
(4, 4),  -- Prince of Persia: The Lost Crown - Ubisoft
(5, 5),  -- Animal Crossing: New Horizons - Nintendo
(6, 5),  -- Metroid Dread - Nintendo
(7, 1),  -- Cyberpunk 2077 - CD Projekt Red
(8, 6),  -- Red Dead Redemption 2 - Rockstar Games
(9, 7),  -- Braid - Number None
(10, 8); -- League of Legends - Riot Games

INSERT INTO PLATAFORMAS (PLATAFORMA) VALUES
('PC'),
('PlayStation 5'),
('PlayStation 4'),
('PlayStation 2'),
('Nintendo Switch'),
('Xbox One'),
('Android'),
('iOS');

INSERT INTO JUEGO_PLATAFORMA (ID_JUEGO, ID_PLATAFORMA) VALUES
(1, 1),  -- The Witcher 3 - PC
(1, 2),  -- The Witcher 3 - PlayStation 5
(1, 6),  -- The Witcher 3 - Xbox One
(1, 5),  -- The Witcher 3 - Nintendo Switch
(2, 2),  -- Resident Evil 4 Remake - PlayStation 5
(2, 1), -- Resident evil 4 Remake - PC
(2, 3), -- Resident Evil 4 Remake - PS4
(2, 6), -- Resident Evil 4 Remake - Xbox
(3, 4),  -- Silent Hill 2 - PlayStation 2
(4, 2),  -- Prince of Persia: The Lost Crown - PlayStation 5
(5, 5),  -- Animal Crossing: New Horizons - Nintendo Switch
(6, 5),  -- Metroid Dread - Nintendo Switch
(7, 1),  -- Cyberpunk 2077 - PC
(7, 2),  -- Cyberpunk 2077 - PlayStation 5
(7, 6),  -- Cyberpunk 2077 - Xbox One
(8, 3),  -- Red Dead Redemption 2 - PlayStation 4
(8, 6),  -- Red Dead Redemption 2 - Xbox One
(9, 1),  -- Braid - PC
(10, 1); -- League of Legends - PC

INSERT INTO GENEROS (GENERO) VALUES
('Rol'),
('Accion'),
('Aventura'),
('Estrategia'),
('Simulacion'),
('Terror'),
('Plataformas'),
('Peleas');

INSERT INTO JUEGO_GENERO (ID_JUEGO, ID_GENERO) VALUES
(1, 1),  -- The Witcher 3 - Rol
(1, 3),  -- The Witcher 3 - Aventura
(2, 6),  -- Resident Evil 4 Remake - Terror
(2, 2),  -- Resident Evil 4 Remake - Accion
(3, 6),  -- Silent Hill 2 - Terror
(3, 3),  -- Silent Hill 2 - Aventura
(4, 2),  -- Prince of Persia: The Lost Crown - Accion
(4, 3),  -- Prince of Persia: The Lost Crown - Aventura
(5, 5),  -- Animal Crossing: New Horizons - Simulacion
(5, 3),  -- Animal Crossing: New Horizons - Aventura
(6, 2),  -- Metroid Dread - Accion
(6, 3),  -- Metroid Dread - Aventura
(7, 1),  -- Cyberpunk 2077 - Rol
(7, 2),  -- Cyberpunk 2077 - Accion
(8, 2),  -- Red Dead Redemption 2 - Accion
(8, 3),  -- Red Dead Redemption 2 - Aventura
(9, 7),  -- Braid - Plataformas
(9, 3),  -- Braid - Aventura
(10, 4), -- League of Legends - Estrategia
(10, 2); -- League of Legends - Accion

INSERT INTO IDIOMAS (IDIOMA) VALUES
('Espanol'),
('Ingles'),
('Frances'),
('Aleman'),
('Italiano'),
('Portugues'),
('Japones'),
('Chino'),
('Coreano'),
('Ruso');

INSERT INTO JUEGO_IDIOMA (ID_JUEGO, ID_IDIOMA) VALUES
(1, 1),  -- The Witcher 3 - Español
(1, 2),  -- The Witcher 3 - Ingles
(1, 3),  -- The Witcher 3 - Frances
(1, 4),  -- The Witcher 3 - Aleman
(1, 5),  -- The Witcher 3 - Italiano
(2, 1),  -- Resident Evil 4 Remake - Español
(2, 2),  -- Resident Evil 4 Remake - Ingles
(2, 3),  -- Resident Evil 4 Remake - Frances
(2, 4),  -- Resident Evil 4 Remake - Aleman
(2, 5),  -- Resident Evil 4 Remake - Italiano
(3, 1),  -- Silent Hill 2 - Español
(3, 2),  -- Silent Hill 2 - Ingles
(3, 3),  -- Silent Hill 2 - Frances
(3, 4),  -- Silent Hill 2 - Aleman
(3, 5),  -- Silent Hill 2 - Italiano
(4, 1),  -- Prince of Persia: The Lost Crown - Español
(4, 2),  -- Prince of Persia: The Lost Crown - Ingles
(4, 3),  -- Prince of Persia: The Lost Crown - Frances
(4, 4),  -- Prince of Persia: The Lost Crown - Aleman
(4, 5),  -- Prince of Persia: The Lost Crown - Italiano
(5, 1),  -- Animal Crossing: New Horizons
(5, 3),  -- Animal Crossing: New Horizons - Frances
(5, 4),  -- Animal Crossing: New Horizons - Aleman
(5, 5),  -- Animal Crossing: New Horizons - Italiano
(5, 6),  -- Animal Crossing: New Horizons - Portugues
(5, 7),  -- Animal Crossing: New Horizons - Japones
(5, 8),  -- Animal Crossing: New Horizons - Chino
(5, 9),  -- Animal Crossing: New Horizons - Coreano
(6, 1),  -- Metroid Dread - Español
(6, 2),  -- Metroid Dread - Ingles
(6, 6),  -- Metroid Dread - Japones
(7, 1),  -- Cyberpunk 2077 - Español
(7, 2),  -- Cyberpunk 2077 - Ingles
(7, 3),  -- Cyberpunk 2077 - Frances
(7, 4),  -- Cyberpunk 2077 - Aleman
(7, 5),  -- Cyberpunk 2077 - Italiano
(7, 6),  -- Cyberpunk 2077 - Japones
(7, 7),  -- Cyberpunk 2077 - Chino
(7, 8),  -- Cyberpunk 2077 - Coreano
(7, 9),  -- Cyberpunk 2077 - Ruso
(8, 1),  -- Red Dead Redemption 2 - Español
(8, 2),  -- Red Dead Redemption 2 - Ingles
(8, 3),  -- Red Dead Redemption 2 - Frances
(8, 4),  -- Red Dead Redemption 2 - Aleman
(8, 5),  -- Red Dead Redemption 2 - Italiano
(8, 6),  -- Red Dead Redemption 2 - Japones
(8, 7),  -- Red Dead Redemption 2 - Chino
(8, 8),  -- Red Dead Redemption 2 - Coreano
(8, 9),  -- Red Dead Redemption 2 - Ruso
(9, 1),  -- Braid - Español
(9, 2),  -- Braid - Ingles
(9, 3),  -- Braid - Frances
(9, 4),  -- Braid - Aleman
(9, 5),  -- Braid - Italiano
(9, 6),  -- Braid - Japones
(9, 7),  -- Braid - Chino
(9, 8),  -- Braid - Coreano
(9, 9),  -- Braid - Ruso
(10, 1),  -- League of Legends - Español
(10, 2),  -- League of Legends - Ingles
(10, 3),  -- League of Legends - Frances
(10, 4),  -- League of Legends - Aleman
(10, 5),  -- League of Legends - Italiano
(10, 6),  -- League of Legends - Portugues
(10, 7),  -- League of Legends - Japones
(10, 8),  -- League of Legends - Chino
(10, 9);  -- League of Legends - Coreano

-- FUNCIONES --

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

-- STORED PROCEDURES --

/*
Proceso para buscar el juego por titulo o idioma.
Se manipulara el campo TITULO de la tabla JUEGOS, y luego se manipulara la TABLA JUEGO_IDIOMA.
Lo que hara el proceso es buscar un titulo especifico y mostrar todos los idiomas asociados a este.
Estos registros de IDIOMA estan guardados en la tabla IDIOMAS, la cual se relaciona con JUEGO_IDIOMA.
*/
DROP PROCEDURE IF EXISTS SP_BUSCAR_JUEGOS_IDIOMA;
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_JUEGOS_IDIOMA(IN BUSCAR VARCHAR(50), IN TIPO_BUSQUEDA VARCHAR(10))
BEGIN
    IF TIPO_BUSQUEDA = 'TITULO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(I.IDIOMA SEPARATOR ', ') AS IDIOMAS
        FROM
            JUEGOS J
            JOIN JUEGO_IDIOMA JI ON J.ID = JI.ID_JUEGO
            JOIN IDIOMAS I ON JI.ID_IDIOMA = I.ID
        WHERE
            J.TITULO = BUSCAR
		GROUP BY
			J.TITULO;
    ELSEIF TIPO_BUSQUEDA = 'IDIOMA' THEN
        SELECT
            J.TITULO,
			GROUP_CONCAT(I.IDIOMA SEPARATOR ', ') AS IDIOMAS
        FROM
            JUEGOS J
            JOIN JUEGO_IDIOMA JI ON J.ID = JI.ID_JUEGO
            JOIN IDIOMAS I ON JI.ID_IDIOMA = I.ID
        WHERE
            I.IDIOMA = BUSCAR
		GROUP BY
			J.TITULO;
    END IF;
END $$
DELIMITER ;

CALL SP_BUSCAR_JUEGOS_IDIOMA('The Witcher 3', 'TITULO');
CALL SP_BUSCAR_JUEGOS_IDIOMA('Espanol', 'IDIOMA');

/*
Proceso para buscar el juego por titulo o plataforma.
Se manipulara el campo TITULO de la tabla JUEGOS, y luego se manipulara la TABLA JUEGO_PLATAFORMA.
Lo que hara el proceso es buscar un titulo especifico y mostrar todas las plataformas asociados a este.
Estos registros de PLATAFORMA estan guardados en la tabla PLATAFORMAS, la cual se relaciona con JUEGO_PLATAFORMA.
*/
DROP PROCEDURE IF EXISTS SP_BUSCAR_JUEGOS_PLATAFORMA;
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_JUEGOS_PLATAFORMA(IN BUSCAR VARCHAR(50), IN TIPO_BUSQUEDA VARCHAR(10))
BEGIN
    IF TIPO_BUSQUEDA = 'TITULO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(P.PLATAFORMA SEPARATOR ', ') AS PLATAFORMAS
        FROM
            JUEGOS J
            JOIN JUEGO_PLATAFORMA JP ON J.ID = JP.ID_JUEGO
            JOIN PLATAFORMAS P ON JP.ID_PLATAFORMA = P.ID
        WHERE
            J.TITULO = BUSCAR
		GROUP BY
			J.TITULO;
    ELSEIF TIPO_BUSQUEDA = 'PLATAFORMA' THEN
        SELECT
            J.TITULO,
			GROUP_CONCAT(P.PLATAFORMA SEPARATOR ', ') AS PLATAFORMAS
        FROM
            JUEGOS J
            JOIN JUEGO_PLATAFORMA JP ON J.ID = JP.ID_JUEGO
            JOIN PLATAFORMAS P ON JP.ID_PLATAFORMA = P.ID
        WHERE
            P.PLATAFORMA = BUSCAR
		GROUP BY
			J.TITULO;
    END IF;
END $$
DELIMITER ;

CALL SP_BUSCAR_JUEGOS_PLATAFORMA('The Witcher 3', 'TITULO');
CALL SP_BUSCAR_JUEGOS_PLATAFORMA('PlayStation 5', 'PLATAFORMA');

/*
Proceso para buscar el juego por titulo o genero.
Se manipulara el campo TITULO de la tabla JUEGOS, y luego se manipulara la TABLA JUEGO_GENERO.
Lo que hara el proceso es buscar un titulo especifico y mostrar todos los generos asociados a este.
Estos registros de GENERO estan guardados en la tabla GENEROS, la cual se relaciona con JUEGO_GENERO.
*/
DROP PROCEDURE IF EXISTS SP_BUSCAR_JUEGOS_GENERO;
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_JUEGOS_GENERO(IN BUSCAR VARCHAR(50), IN TIPO_BUSQUEDA VARCHAR(10))
BEGIN
    IF TIPO_BUSQUEDA = 'TITULO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(G.GENERO SEPARATOR ', ') AS GENEROS
        FROM
            JUEGOS J
            JOIN JUEGO_GENERO JG ON J.ID = JG.ID_JUEGO
            JOIN GENEROS G ON JG.ID_GENERO = G.ID
        WHERE
            J.TITULO = BUSCAR
		GROUP BY
			J.TITULO;
    ELSEIF TIPO_BUSQUEDA = 'GENERO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(G.GENERO SEPARATOR ', ') AS GENEROS
        FROM
            JUEGOS J
            JOIN JUEGO_GENERO JG ON J.ID = JG.ID_JUEGO
            JOIN GENEROS G ON JG.ID_GENERO = G.ID
        WHERE
            G.GENERO = BUSCAR
		GROUP BY
			J.TITULO;
    END IF;
END $$
DELIMITER ;

CALL SP_BUSCAR_JUEGOS_GENERO('Silent Hill 2', 'TITULO');
CALL SP_BUSCAR_JUEGOS_GENERO('Aventura', 'GENERO');

-- TRIGGERS --

-- Trigger AFTER que agrega la fecha de creacion luego de que se carga un registro.
DROP TRIGGER IF EXISTS TR_FECHA_CREACION;
DELIMITER $$
CREATE TRIGGER TR_FECHA_CREACION
AFTER INSERT ON JUEGOS
FOR EACH ROW
BEGIN
    UPDATE JUEGOS SET FECHA_CREACION = CURRENT_TIMESTAMP WHERE ID = NEW.ID;
END $$
DELIMITER ;
-- Verificamos el trigger
SELECT * FROM JUEGOS;

-- Trigger BEFORE que nos muestra la ultima fecha de modificacion que tuvo el registro. Por defecto el valor va a ser NULL
DROP TRIGGER IF EXISTS TR_ULTIMA_MODIFICACION;
DELIMITER $$
CREATE TRIGGER TR_ULTIMA_MODIFICACION
BEFORE UPDATE ON JUEGOS
FOR EACH ROW
BEGIN
    SET NEW.FECHA_ULTIMA_MODIFICACION = CURRENT_TIMESTAMP;
END $$
DELIMITER ;

UPDATE JUEGOS
SET TITULO = 'The Witcher 3 - Modificado'
WHERE TITULO = 'The Witcher 3';

SELECT * FROM JUEGOS;

-- VISTAS --

/*
Vista para mostrar lo que devuelve la funcion PRECIOS_EN_PESOS
Esta vista va a mostrar el precio de TODOS los juegos en pesos argentinos.
Para realizar esto, la vista se ayuda de la funcion FN_PESOS.
*/
DROP VIEW IF EXISTS VW_PRECIOS_EN_PESOS;
CREATE VIEW VW_PRECIOS_EN_PESOS AS
SELECT
    TITULO,
    FN_PESOS(TITULO, 865.50) AS PRECIO_PESOS
FROM
    JUEGOS
ORDER BY TITULO ASC;
SELECT * FROM VW_PRECIOS_EN_PESOS;

/*
Vista para mostrar cuales juegos son para mayores de 18 y cuales para todo publico 
Invocamos a la funcion FN_ADULTOS
*/
DROP VIEW IF EXISTS VW_PEGI;
CREATE VIEW VW_PEGI AS
SELECT
    TITULO,
    CASE
        WHEN FN_ADULTOS(TITULO) = 'Si' THEN 'Para adultos'
        ELSE 'Para todos los públicos'
    END AS PEGI
FROM
    JUEGOS
ORDER BY TITULO ASC;
SELECT * FROM VW_PEGI;

-- Vista para ver los juegos ordenados de mejor valoración a peor.
DROP VIEW IF EXISTS VW_VALORACION;
CREATE VIEW VW_VALORACION AS
SELECT
    TITULO,
    VALORACION
FROM
    JUEGOS
ORDER BY
	VALORACION DESC;
SELECT * FROM VW_VALORACION;

-- Vista para mostrar los juegos y sus generos
DROP VIEW IF EXISTS VW_JUEGOS_GENEROS;
CREATE VIEW VW_JUEGOS_GENEROS AS
SELECT
    J.TITULO,
    GROUP_CONCAT(G.GENERO SEPARATOR ', ') AS GENEROS
FROM
    JUEGOS J
    INNER JOIN JUEGO_GENERO JG ON J.ID = JG.ID_JUEGO
    INNER JOIN GENEROS G ON JG.ID_GENERO = G.ID
GROUP BY
    J.TITULO
ORDER BY
    J.TITULO ASC;
SELECT * FROM VW_JUEGOS_GENEROS;

-- Vista para mostrar los juegos y sus plataformas
DROP VIEW IF EXISTS VW_JUEGOS_PLATAFORMAS;
CREATE VIEW VW_JUEGOS_PLATAFORMAS AS
SELECT
    J.TITULO,
    GROUP_CONCAT(P.PLATAFORMA SEPARATOR ', ') AS PLATAFORMAS
FROM
    JUEGOS J
    INNER JOIN JUEGO_PLATAFORMA JP ON J.ID = JP.ID_JUEGO
    INNER JOIN PLATAFORMAS P ON JP.ID_PLATAFORMA = P.ID
GROUP BY
    J.TITULO
ORDER BY
    J.TITULO ASC;
SELECT * FROM VW_JUEGOS_PLATAFORMAS;

-- Vista para mostrar los juegos y sus idiomas
DROP VIEW IF EXISTS VW_JUEGOS_IDIOMAS;
CREATE VIEW VW_JUEGOS_IDIOMAS AS
SELECT
    J.TITULO,
    GROUP_CONCAT(I.IDIOMA SEPARATOR ', ') AS IDIOMAS
FROM
    JUEGOS J
    INNER JOIN JUEGO_IDIOMA JI ON J.ID = JI.ID_JUEGO
    INNER JOIN IDIOMAS I ON JI.ID_IDIOMA = I.ID
GROUP BY
    J.TITULO
ORDER BY
    J.TITULO ASC;
SELECT * FROM VW_JUEGOS_IDIOMAS;
/*
Vista para mostrar la info completa de los juegos (excepto el ID), ordenados por titulo en orden alfabetico.
Tome la decision de omitir el ID ya que funciona como PK y no es informacion relevante para el usuario.
Tambien se omitio la fecha de creacion y modificacion del registro.
*/
DROP VIEW IF EXISTS VW_JUEGOS_INFO_COMPLETA;
CREATE VIEW VW_JUEGOS_INFO_COMPLETA AS
SELECT
    J.TITULO,
    J.VALORACION,
    J.FECHA_L,
    J.PEGI,
    J.DESCRIPCION,
    J.DESARROLLADORA,
    J.MULTIPLAYER,
    J.CANTIDAD_J,
    J.PRECIO,
    J.DURACION,
    GROUP_CONCAT(DISTINCT G.GENERO SEPARATOR ', ') AS GENEROS,
    GROUP_CONCAT(DISTINCT P.PLATAFORMA SEPARATOR ', ') AS PLATAFORMAS,
	GROUP_CONCAT(DISTINCT I.IDIOMA SEPARATOR ', ') AS IDIOMAS
FROM
    JUEGOS J
    
    JOIN JUEGO_GENERO JG ON J.ID = JG.ID_JUEGO
    JOIN GENEROS G ON JG.ID_GENERO = G.ID
    
    JOIN JUEGO_PLATAFORMA JP ON J.ID = JP.ID_JUEGO
	JOIN PLATAFORMAS P ON JP.ID_PLATAFORMA = P.ID
    
	JOIN JUEGO_IDIOMA JI ON J.ID = JI.ID_JUEGO
    JOIN IDIOMAS I ON JI.ID_IDIOMA = I.ID
    
GROUP BY
    J.TITULO,
    J.VALORACION,
    J.FECHA_L,
    J.PEGI,
    J.DESCRIPCION,
    J.DESARROLLADORA,
    J.MULTIPLAYER,
    J.CANTIDAD_J,
    J.PRECIO,
    J.DURACION
ORDER BY
    J.TITULO ASC;
SELECT * FROM VW_JUEGOS_INFO_COMPLETA ;

-- DCL --

/*
Vamos a crear dos usuarios, con sus diferentes permisos:
1. Usuario Primer Nivel: solo tiene permisos de lectura.
2. Usuario Segundo Nivel: tiene permisos de lectura, escritura y modificación.
3. Usuario Tercer Nivel: tiene permisos de lectura, escritura, modificación, eliminación y administración de usuarios.
*/

-- Usuario de Primer Nivel
DROP USER IF EXISTS '1_level_user'@'localhost';
CREATE USER '1_level_user'@'localhost' IDENTIFIED BY '1_level_pw';
GRANT SELECT ON 503190_jorge_pineiro.* TO '1_level_user'@'localhost';

-- Usuario de Segundo Nivel
DROP USER IF EXISTS '2_level_user'@'localhost';
CREATE USER '2_level_user'@'localhost' IDENTIFIED BY '2_level_pw';
GRANT SELECT, INSERT, UPDATE ON 503190_jorge_pineiro.* TO '2_level_user'@'localhost';

-- Usuario de Tercer Nivel
DROP USER IF EXISTS '3_level_user'@'localhost';
CREATE USER '3_level_user'@'localhost' IDENTIFIED BY '3_level_pw';
GRANT ALL PRIVILEGES ON 503190_jorge_pineiro.* TO '3_level_user'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;