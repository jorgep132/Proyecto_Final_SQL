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