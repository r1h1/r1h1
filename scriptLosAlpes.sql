
--CREO TABLA USUARIOS
CREATE TABLE LA_Usuario(
    ID_Usu_NumeroDocumento INT PRIMARY KEY NOT NULL,
    Usu_NombreCompleto VARCHAR(100) NOT NULL,
    Usu_TipoDoc VARCHAR(15) NOT NULL,
    Usu_TelefonoResidencial INT NOT NULL,
    Usu_TelefonoMovil INT NOT NULL,
    Usu_Pais VARCHAR(50) NOT NULL,
    Usu_Departamento VARCHAR(50) NOT NULL,
    Usu_CiudadResidencia VARCHAR(50) NOT NULL,
    Usu_Direccion VARCHAR(250) NOT NULL,
    Usu_Profesion VARCHAR(80),
    Usu_Email VARCHAR(70) NOT NULL,
    Usu_Rol VARCHAR(50) NOT NULL,
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
    Usu_Pais VARCHAR,
    Usu_Departamento VARCHAR,
    Usu_CiudadResidencia VARCHAR,
    Usu_Direccion VARCHAR, 
    Usu_Profesion VARCHAR,
    Usu_Email VARCHAR, 
    Usu_Rol VARCHAR, 
    Usu_Estado INT
)
AS 
BEGIN
    INSERT INTO LA_Usuario VALUES(ID_Usu_NumeroDocumento, Usu_NombreCompleto,
    Usu_TipoDoc, Usu_TelefonoResidencial, Usu_TelefonoMovil, Usu_Pais, Usu_Departamento, 
    Usu_CiudadResidencia, Usu_Direccion, Usu_Profesion, Usu_Email, Usu_Rol, Usu_Estado);
END;

SELECT * FROM LA_USUARIO;




--PROCEDURE PARA ACTUALIZAR DATOS DEL CLIENTE (UPDATE)
CREATE OR REPLACE PROCEDURE UPDATE_CLIENTE
(
    id_usuario IN INT, 
    nombreCompleto IN VARCHAR,
    tipoDoc IN VARCHAR,
    telefonoResidencial IN NUMBER,
    telefonoMovil IN NUMBER,
    pais IN VARCHAR,
    departamento IN VARCHAR,
    ciudadResidencia IN VARCHAR,
    direccion IN VARCHAR,
    profesion IN VARCHAR,
    email IN VARCHAR,
    rol IN VARCHAR,
    usuEstado IN INT
)
AS
BEGIN
    UPDATE la_usuario SET usu_nombrecompleto = nombreCompleto, usu_tipodoc = tipoDoc, usu_telefonoresidencial = telefonoResidencial, usu_telefonomovil = telefonoMovil,
    Usu_Pais = pais, usu_departamento = departamento, usu_ciudadresidencia = ciudadresidencia, usu_direccion = direccion, usu_profesion = profesion,
    usu_email = email, usu_rol = rol, usu_estado = usuEstado
    WHERE ID_Usu_NumeroDocumento = id_usuario;
END;



--PROCEDURE PARA BORRAR UN CLIENTE POR ID (DELETE WHERE ID)
CREATE OR REPLACE PROCEDURE DELETE_CLIENTE
(
    id_usuario int
)
AS
BEGIN
    DELETE LA_Usuario WHERE id_usu_numerodocumento = id_usuario;
END;


--PROCEDIMIENTO PARA MOSTRAR CLEINTES
CREATE OR REPLACE PROCEDURE MOSTRAR_CLIENTES
(
    registros out sys_refcursor
)
AS
BEGIN
    OPEN registros FOR SELECT ID_USU_NUMERODOCUMENTO AS Numero_Documento, USU_NOMBRECOMPLETO AS Nombre_Completo, 
                              USU_TIPODOC AS Tipo_Documento, USU_TELEFONORESIDENCIAL AS Telefono_Residencial, 
                              USU_TELEFONOMOVIL AS Telefono_Movil, USU_PAIS AS Pais, USU_DEPARTAMENTO AS Departamento, 
                              USU_CIUDADRESIDENCIA AS Ciudad, USU_DIRECCION AS Direccion, USU_PROFESION AS Profesion,
                              USU_EMAIL AS Email, USU_ROL AS Rol
                              FROM LA_Usuario;
END;



--PROCEDIMIENTO PARA BUSCAR CON WHERE LIKE
CREATE OR REPLACE PROCEDURE BUSCAR_CLIENTES
(
    datoBusqueda VARCHAR,
    reg out sys_refcursor
)
AS
BEGIN
    OPEN reg FOR SELECT ID_USU_NUMERODOCUMENTO AS Numero_Documento, USU_NOMBRECOMPLETO AS Nombre_Completo, 
                              USU_TIPODOC AS Tipo_Documento, USU_TELEFONORESIDENCIAL AS Telefono_Residencial,
                              USU_TELEFONOMOVIL AS Telefono_Movil, USU_PAIS AS Pais, USU_DEPARTAMENTO AS Departamento,
                              USU_CIUDADRESIDENCIA AS Ciudad, USU_DIRECCION AS Direccion, USU_PROFESION AS Profesion,
                              USU_EMAIL AS Email, USU_ROL AS Rol FROM LA_Usuario WHERE ID_USU_NUMERODOCUMENTO LIKE datoBusqueda
                              OR USU_NOMBRECOMPLETO LIKE datoBusqueda OR USU_TIPODOC LIKE datoBusqueda OR USU_TELEFONORESIDENCIAL LIKE datoBusqueda
                              OR USU_TELEFONOMOVIL LIKE datoBusqueda OR USU_PAIS LIKE datoBusqueda OR USU_DEPARTAMENTO LIKE datoBusqueda OR USU_CIUDADRESIDENCIA LIKE datoBusqueda
                              OR USU_DIRECCION LIKE datoBusqueda OR USU_PROFESION LIKE datoBusqueda OR USU_EMAIL LIKE datoBusqueda OR USU_ROL LIKE datoBusqueda;
END;




--PROCEDIMIENTO PARA INGRESAR AL SISTEMA SEG�N CORREO Y NUMERO DE DOCUMENTO
CREATE OR REPLACE PROCEDURE INGRESAR_SISTEMA
(
    email VARCHAR,
    numeroDoc INT,
    registros out sys_refcursor
)
AS
BEGIN
     OPEN registros FOR SELECT COUNT(*) FROM LA_USUARIO WHERE USU_EMAIL = email AND ID_USU_NUMERODOCUMENTO = numeroDoc;
END;




--CREO TABLA PRODUCTO
CREATE TABLE LA_PRODUCTO(
    PRO_ID INT NOT NULL,
    PRO_NOMBRE VARCHAR(250) NOT NULL,
    PRO_DESCRIPCION VARCHAR(250) NOT NULL,
    PRO_TIPO VARCHAR(50) NOT NULL,
    PRO_MATERIAL VARCHAR(50) NOT NULL,
    PRO_ALTO NUMBER(10,2) NOT NULL,
    PRO_ANCHO NUMBER(10,2) NOT NULL,
    PRO_PROFUNDIDAD NUMBER(10,2) NOT NULL,
    PRO_COLOR VARCHAR(50),
    PRO_PESO NUMBER(10,2),    
    PRO_PRECIO NUMBER(10,2) NOT NULL,
    PRO_CANTIDAD INT NOT NULL,
    PRO_ESTADO INT NOT NULL,--1 ACTIVO /0 INACTIVO}
    CONSTRAINT LA_PRODUCTO PRIMARY KEY (PRO_ID)
);



--CODIGO QUE HACE EL PRIMARY KEY AUTO INCREMENTABLE (SE HACE UNA POR TABLA)
CREATE SEQUENCE AUTOINCREMENTABLE_PRODUCTO
--INICIA EN 1
START WITH 1
--ICREMENTA 1
INCREMENT BY 1;



--PROCEDIMIENTO INSERTAR PRODUCTO
CREATE OR REPLACE PROCEDURE INSERTA_PRODUCTO
(
    PRONOMBRE VARCHAR,
    PRODESCRIPCION VARCHAR,
    PROTIPO VARCHAR,
    PROMATERIAL VARCHAR,
    PROALTO NUMBER,
    PROANCHO NUMBER,
    PROPROFUNDIDAD NUMBER,
    PROCOLOR VARCHAR,
    PROPESO NUMBER,    
    PROPRECIO NUMBER,
    PROCANTIDAD INT,
    PROESTADO INT
)
AS 
BEGIN
    INSERT INTO LA_PRODUCTO VALUES (AUTOINCREMENTABLE_PRODUCTO.nextval,PRONOMBRE,PRODESCRIPCION,PROTIPO,
                                    PROMATERIAL,PROALTO,PROANCHO,PROPROFUNDIDAD,PROCOLOR,PROPESO,PROPRECIO,
                                    PROCANTIDAD,PROESTADO);
END;


--PROCEDIMIENTO EDITAR PRODUCTO
CREATE OR REPLACE PROCEDURE EDITAR_PRODUCTO
(   
    PROID IN INT,
    PRONOMBRE VARCHAR,
    PRODESCRIPCION VARCHAR,
    PROTIPO VARCHAR,
    PROMATERIAL VARCHAR,
    PROALTO NUMBER,
    PROANCHO NUMBER,
    PROPROFUNDIDAD NUMBER,
    PROCOLOR VARCHAR,
    PROPESO NUMBER,    
    PROPRECIO NUMBER,
    PROCANTIDAD INT
)
AS 
BEGIN
    UPDATE LA_PRODUCTO SET Pro_Nombre = PRONOMBRE, Pro_Descripcion = PRODESCRIPCION, Pro_Tipo = PROTIPO, Pro_Material = PROMATERIAL, Pro_Alto = PROALTO,
                           Pro_Ancho = PROANCHO, Pro_Profundidad = PROPROFUNDIDAD, Pro_Color = PROCOLOR, Pro_Peso = PROPESO, Pro_Precio = PROPRECIO, 
                           Pro_Cantidad = PROCANTIDAD WHERE PRO_ID = PROID;
END;



--PROCEDURE PARA BORRAR UN PRODUCTO POR ID
CREATE OR REPLACE PROCEDURE DELETE_PRODUCTO
(
    PROID IN INT
)
AS
BEGIN
    DELETE LA_PRODUCTO WHERE PRO_ID = PROID;
END;


--PROCEDIMIENTO PARA MOSTRAR PRODUCTOS
CREATE OR REPLACE PROCEDURE MOSTRAR_PRODUCTOS
(
    registros out sys_refcursor
)
AS
BEGIN
    OPEN registros FOR SELECT PRO_ID AS Codigo_Producto, PRO_NOMBRE AS Nombre, 
                              PRO_DESCRIPCION AS Descripcion, PRO_TIPO AS Tipo, 
                              PRO_MATERIAL AS Material, 'ALTO: ' || PRO_ALTO || ', ANCHO: ' || PRO_ANCHO || ', PROFUNDIDAD: ' || PRO_PROFUNDIDAD AS Medidas,
                              PRO_COLOR AS Color, PRO_PESO AS Peso, PRO_PRECIO AS Precio_Unitario, PRO_CANTIDAD AS Cantidad FROM LA_PRODUCTO;
END;



--PROCEDIMIENTO PARA CONTAR CUANTOS PRODUCTOS HAY
CREATE OR REPLACE PROCEDURE CONTAR_CANTIDAD_PRODUCTOS
(
    regs out sys_refcursor
)
AS
BEGIN
    OPEN regs FOR SELECT COUNT(*) AS cantidadRep FROM LA_PRODUCTO;
END;


--PROCEDIMIENTO PARA MOSTRAR PRODUCTOS PARA COMPRAR
CREATE OR REPLACE PROCEDURE MOSTRAR_PRODUCTOS_COMPRAR
(
    registros out sys_refcursor
)
AS
BEGIN
    OPEN registros FOR SELECT DISTINCT PRO_NOMBRE AS nombre, PRO_PRECIO AS precio FROM LA_PRODUCTO GROUP BY PRO_NOMBRE,PRO_PRECIO;
END;

SELECT DISTINCT PRO_NOMBRE AS nombre, PRO_PRECIO AS precio FROM LA_PRODUCTO GROUP BY PRO_NOMBRE,PRO_PRECIO;


--PROCEDIMIENTO PARA BUSCAR CON WHERE LIKE
CREATE OR REPLACE PROCEDURE BUSCAR_PRODUCTOS
(
    datoBusqueda VARCHAR,
    reg out sys_refcursor
)
AS
BEGIN
    OPEN reg FOR SELECT PRO_ID AS Codigo_Producto, PRO_NOMBRE AS Nombre, 
                        PRO_DESCRIPCION AS Descripcion, PRO_TIPO AS Tipo, 
                        PRO_MATERIAL AS Material, 'ALTO: ' || PRO_ALTO || ', ANCHO: ' || PRO_ANCHO || ', PROFUNDIDAD: ' || PRO_PROFUNDIDAD AS Medidas,
                        PRO_COLOR AS Color, PRO_PESO AS Peso, PRO_PRECIO AS Precio_Unitario, PRO_CANTIDAD AS Cantidad FROM LA_PRODUCTO
                        WHERE PRO_ID LIKE datoBusqueda OR PRO_NOMBRE LIKE datoBusqueda OR PRO_DESCRIPCION LIKE datoBusqueda OR PRO_TIPO LIKE datoBusqueda
                        OR PRO_MATERIAL LIKE datoBusqueda OR PRO_ALTO LIKE datoBusqueda OR PRO_ANCHO LIKE datoBusqueda OR PRO_PROFUNDIDAD LIKE datoBusqueda
                        OR PRO_COLOR LIKE datoBusqueda OR PRO_PESO LIKE datoBusqueda OR PRO_PRECIO LIKE datoBusqueda OR PRO_CANTIDAD LIKE datoBusqueda;
END;


SELECT * FROM la_producto;



--NOTA
--PARA EL SIGUIENTE PASO LO IMPORTANTE ES QUE TU USUARIO TENGA PERMISOS DBA
---CREO TABLA DE IMAGENES
CREATE TABLE LA_IMAGENES(
    IMG_ID INT,
    IMGEN BLOB DEFAULT EMPTY_BLOB()
);


--CREO UN DIRECTORIO
-- ESTE DEBE SER CREADO CON EL  NOMBRE IMAGENES PROYECTO EN EL ESCRITORIO, LUEGO COPIA LA RUTA
CREATE OR REPLACE DIRECTORY IMAGENES AS 'C:\Users\USUARIO\Desktop\IMAGENES_PROYECTO';

--INICIA INGRESO

DECLARE 
V_TEMP BLOB;
V_BFILE BFILE;
V_NOMBRE_FOTO VARCHAR (20);
BEGIN

-- CREO EL INSERT
INSERT INTO LA_IMAGENES VALUES (2, EMPTY_BLOB()) RETURNING FOTO INTO V_TEMP;

V_NOMBRE_FOTO := '1.PNG';

V_BFILE := BFILENAME('OBJETOS_LOB', V_NOMBRE_FOTO);
DBMS_LOB.OPEN(V_BFILE, DBMS_LOB.LOB_READONLY);
DBMS_LOB.LOADFROMFILE(V_TEMP, V_BFILE, DBMS_LOB.GETLENGTH(V_BFILE));
DBMS_LOB.CLOSE(V_BFILE);
COMMIT;
END;





/*
    Sentencias DROP para borrar las tablas y procedimientos
*/

DROP TABLE LA_Usuario;
DROP PROCEDURE INSERTA_USUARIO;
DROP PROCEDURE UPDATE_CLIENTE;
DROP PROCEDURE MOSTRAR_CLIENTES;
DROP PROCEDURE DELETE_CLIENTE;
DROP TABLE LA_Producto;
DROP SEQUENCE AUTOINCREMENTABLE_PRODUCTO;
DROP PROCEDURE INSERTA_PRODUCTO;
DROP PROCEDURE MOSTRAR_PRODUCTOS;
DROP PROCEDURE EDITAR_PRODUCTO;
DROP PROCEDURE DELETE_PRODUCTO;
DROP TABLE LA_IMAGENES;
DROP DIRECTORY IMAGENES;


