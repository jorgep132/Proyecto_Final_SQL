use 503190_jorge_pineiro;

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

