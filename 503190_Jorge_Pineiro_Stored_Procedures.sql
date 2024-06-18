use 503190_jorge_pineiro;

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
