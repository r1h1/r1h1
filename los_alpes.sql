/*
    Base de datos de prueba para ASP.NET
    Daniel Rivas
    11/04/2022
*/

CREATE TABLE LA_Usuario(
    ID_Usu_NumeroDocumento INT PRIMARY KEY NOT NULL,
    Usu_NombreCompleto VARCHAR(100) NOT NULL,
    Usu_TipoDoc VARCHAR(15) NOT NULL,
    Usu_TelefonoResidencial INT NOT NULL,
    Usu_TelefonoMovil INT NOT NULL,
    Dir_ID INT,
    Usu_Direccion VARCHAR(250) NOT NULL,
    Usu_Email VARCHAR(70) NOT NULL,
    Rol_ID INT,
    Usu_Estado INT   
);


--PROCEDIMIENTO INSERTAR CLIENTE (INSERT)
CREATE OR REPLACE PROCEDURE INSERTA_USUARIO
(
    ID_Usu_NumeroDocumento INT, 
    Usu_NombreCompleto VARCHAR,
    Usu_TipoDoc VARCHAR, 
    Usu_TelefonoResidencial INT, 
    Usu_TelefonoMovil INT, 
    Dir_ID INT, 
    Usu_Direccion VARCHAR, 
    Usu_Email VARCHAR, 
    Rol_ID INT, 
    Usu_Estado INT
)
AS 
BEGIN
    INSERT INTO LA_Usuario VALUES(ID_Usu_NumeroDocumento, Usu_NombreCompleto,
    Usu_TipoDoc, Usu_TelefonoResidencial, Usu_TelefonoMovil, Dir_ID, Usu_Direccion, Usu_Email, Rol_ID, Usu_Estado);
END;

--EJECUCION DEL PROCEDURE
EXECUTE INSERTA_USUARIO(8,'Juan David Molina Morales','NIT',66254545,35458888,2,'Ciudad de Guatemala','juanbukele@outlook.es',2,1);




--PROCEDURE PARA ACTUALIZAR DATOS DEL CLIENTE (UPDATE)
CREATE OR REPLACE PROCEDURE UPDATE_CLIENTE
(
    id_usuario IN INT, 
    nombreCompleto IN VARCHAR,
    tipoDoc IN VARCHAR,
    telefonoResidencial IN NUMBER,
    telefonoMovil IN NUMBER,
    dirID IN INT,
    direccion IN VARCHAR,
    email IN VARCHAR,
    rolID IN INT,
    usuEstado IN INT
)
AS
BEGIN
    UPDATE la_usuario SET usu_nombrecompleto = nombreCompleto, usu_tipodoc = tipoDoc, usu_telefonoresidencial = telefonoResidencial, usu_telefonomovil = telefonoMovil,
    dir_id = dirID, usu_direccion = direccion, usu_email = email, rol_id = rolID, usu_estado = usuEstado
    WHERE ID_Usu_NumeroDocumento = id_usuario;
END;

--SE LE PASA COMO PRIMER PARÁMETRO EL VALOR ID_USU_NUMERODOCUMENTO
EXECUTE UPDATE_CLIENTE(305000004,'Lesly Marisol Herrera Quevedo','DPI',45458585,48459654,3,'Santa Rosa','lesly@miumg.edu.gt',1,1);




--PROCEDURE PARA BORRAR UN CLIENTE POR ID (DELETE WHERE ID)
CREATE OR REPLACE PROCEDURE DELETE_CLIENTE
(
    id_usuario IN INT
)
AS
BEGIN
    DELETE LA_Usuario WHERE id_usu_numerodocumento = id_usuario;
END;

--SE EJECUTA POR ID Y SE IMPRIME EN PANTALLA EL RESULTADO
EXECUTE DELETE_CLIENTE(305000004);




--PROCEDIMIENTO PARA LOGIN
CREATE OR REPLACE PROCEDURE INGRESO_USUARIO
(
    usu_email varchar,
    id_usu_numerodocumento int
)
AS
    usuEmail VARCHAR(50);
    usuNumeroDoc INT;
BEGIN
    SELECT usu_email, id_usu_numerodocumento INTO usuEmail,usuNumeroDoc  FROM LA_USUARIO WHERE usu_email = usu_email AND id_usu_numerodocumento = id_usu_numerodocumento;
END;



--PROCEDIMIENTO PARA DEVOLVER CLIENTES
CREATE OR REPLACE PROCEDURE MOSTRAR_CLIENTES
(
    registros out sys_refcursor
)
AS
BEGIN
    OPEN registros FOR SELECT * FROM la_usuario;
END;



SELECT * FROM la_usuario ORDER BY id_usu_numerodocumento ASC;



/*
    Sentencias DROP para borrar la tabla y procedimientos
*/

DROP TABLE LA_Usuario;
DROP PROCEDURE INSERTA_USUARIO;
DROP PROCEDURE UPDATE_CLIENTE;
DROP PROCEDURE SELECT_CLIENTE;
DROP PROCEDURE DELETE_CLIENTE;







