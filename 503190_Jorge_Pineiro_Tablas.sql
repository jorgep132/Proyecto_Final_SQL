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

SELECT * FROM JUEGOS;




