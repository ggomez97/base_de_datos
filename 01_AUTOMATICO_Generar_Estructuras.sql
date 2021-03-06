
CONNECT TO 'gestion_utu@miServidor' USER 'XXXNOMBREUSUARIOXXX'  USING 'XXXPASSWORDXXX';



-- ACA CREAMOS LAS TABLAS DE ENTIDAD
------------------------------------
DROP TABLE IF EXISTS Personas;
DROP TABLE IF EXISTS Calificaciones;
DROP TABLE IF EXISTS Grupos;
DROP TABLE IF EXISTS Institutos;
DROP TABLE IF EXISTS Asignaturas;
DROP TABLE IF EXISTS Ciudad;
DROP TABLE IF EXISTS Historial;
DROP TABLE IF EXISTS Errores;
DROP TABLE IF EXISTS Orientaciones;

CREATE TABLE Ciudad
 (
  id_ciudad SERIAL PRIMARY KEY  CONSTRAINT Ciudad_clave_primaria,
  nombre_ciudad varchar(50) NOT NULL CONSTRAINT Ciudad_nombre_vacio,
  nombre_departamento varchar(50) NOT NULL CONSTRAINT Departamento_nombre_vacio,
  baja boolean NOT NULL CONSTRAINT Ciudad_baja_vacio
 );

 
 CREATE TABLE Asignaturas
 (
  id_asignatura  SERIAL PRIMARY KEY  CONSTRAINT Materias_clave_primaria,
  nombre_asignatura  varchar(25) NOT NULL CONSTRAINT Materias_nombre_not_null,
  descripcion   varchar(255),
  baja boolean NOT NULL CONSTRAINT Materias_baja_vacio
 );

CREATE TABLE Institutos
 (
  id_instituto  SERIAL PRIMARY KEY  CONSTRAINT Institutos_clave_primaria,
  nombre  varchar(50) NOT NULL CONSTRAINT Institutos_nombre_vacio,
  calle   varchar(50) NOT NULL CONSTRAINT Institutos_calle_vacio,
  numero  INT,
  telefonos varchar(100),
  email varchar(80),
  baja boolean NOT NULL CONSTRAINT Institutos_baja_vacio,
  foranea_id_ciudad INT REFERENCES Ciudad (id_ciudad) CONSTRAINT Institutos_fk_id_ciudad
 ); 

CREATE TABLE Orientaciones
 (
  id_orientacion SERIAL PRIMARY KEY CONSTRAINT Orientaciones_clave_primaria,
  nombre_orientacion varchar(25) NOT NULL,
  descripcion lvarchar (500),
  baja boolean NOT NULL CONSTRAINT Orientaciones_baja_vacio
 );
 
CREATE TABLE Grupos
 (
  id_grupo  SERIAL,
  foranea_id_instituto INT REFERENCES Institutos (id_instituto) CONSTRAINT Grupos_fk_Instiuto_id_instituto,
  nombre_grupo  varchar(5) NOT NULL CONSTRAINT Grupos_nombre_not_null,
  turno   varchar(25) NOT NULL CHECK (turno IN ('Vespertino', 'Matutino', 'Nocturno')) CONSTRAINT turno_valido,
  baja boolean NOT NULL CONSTRAINT Grupos_baja_vacio,
  foranea_id_orientacion INT REFERENCES Orientaciones (id_orientacion) CONSTRAINT Grupos_fk_id_Orientacion,
  PRIMARY KEY (id_grupo, foranea_id_instituto) CONSTRAINT Grupos_claves_primarias
 );



CREATE TABLE Personas
 (
  CI  INT PRIMARY KEY  CONSTRAINT Personas_clave_primaria,
  primer_nombre varchar(25) NOT NULL CONSTRAINT primer_nombre_vacio,
  segundo_nombre varchar(25) NOT NULL CONSTRAINT segundo_nombre_vacio,
  primer_apellido varchar(25) NOT NULL CONSTRAINT primer_apellido_vacio,
  segundo_apellido varchar(25) NOT NULL CONSTRAINT segundo_apellido_vacio,
  fecha_nacimiento DATE NOT NULL CONSTRAINT fecha_nacimiento_vacio,
  email varchar(80),
  grado INT CHECK ( grado > 0 AND grado < 8) CONSTRAINT grado_valido,
  hace_proyecto boolean NOT NULL CONSTRAINT hace_proyecto_vacio,
  nota_final_pro INT CHECK ( nota_final_pro > 0 AND nota_final_pro < 13) CONSTRAINT nota_final_pro_valida,
  juicio_final varchar(30) NOT NULL CHECK ( juicio_final IN ('Examen Febrero', 'Examen Diciembre', 'Aprobado')) CONSTRAINT Personas_Juicio_valido,
  tipo varchar(30) NOT NULL CHECK ( tipo IN ('Alumno', 'Profesor', 'Administrador', 'Admin')) CONSTRAINT Personas_tipo_valido,
  encriptacion_hash varchar(250),
  encriptacion_sal varchar(250),
  baja boolean NOT NULL CONSTRAINT Personas_baja_vacio
 );
 

CREATE TABLE Calificaciones
 (
  id_calificacion SERIAL PRIMARY KEY  CONSTRAINT Calificaciones_clave_primaria,
  CI_docente INT REFERENCES Personas (CI) CONSTRAINT calificaciones_fk_personas_docente_CI,
  CI_alumno INT REFERENCES Personas (CI) CONSTRAINT calificaciones_fk_personas_alumno_CI,
  id_asignatura INT REFERENCES Asignaturas (id_asignatura) CONSTRAINT calificaciones_fk_asignaturas_id_asignatura,
  id_grupo INT NOT NULL CONSTRAINT calificaciones_fk_grupos_id_grupo,
  id_instituto INT NOT NULL CONSTRAINT calificaciones_fk_instituto_id_instituto,
  nombre_calificacion varchar(40) NOT NULL CONSTRAINT calificaciones_nombre_vacio,
  categoria varchar(30) NOT NULL CHECK (categoria IN ('Trabajo_laboratorio', 'Trabajo_domiciliario', 'Trabajo_practico', 'Trabajo_investigacion', 'Trabajo_escrito', 'Oral', 'Parcial', 'Primera_entrega_proyecto', 'Segunda_entrega_proyecto', 'Tercera_entrega_proyecto', 'Defensa_individual', 'Defensa_grupal', 'Es_proyecto')) CONSTRAINT calificaciones_categoria_valida,
  fecha DATE NOT NULL CONSTRAINT fecha_cal_vacio,
  comentario varchar(255),
  nota INT CHECK ( nota > 0 AND nota < 13) CONSTRAINT calificaciones_nota_valida,
  baja boolean NOT NULL CONSTRAINT calificaciones_baja_vacio,
  FOREIGN KEY  (id_grupo, id_instituto) REFERENCES Grupos CONSTRAINT calificaciones_fk_clave_foranea_valida
 );

CREATE TABLE Historial
(
    id_evento SERIAL PRIMARY KEY CONSTRAINT  Historial_claves_primarias,
    foranea_CI_Persona INT REFERENCES Personas (CI) CONSTRAINT Historial_fk_Personas_CI,
    IP varchar(20) NOT NULL CONSTRAINT ip_vacia,
    query lvarchar(1000) NOT NULL CONSTRAINT Historial_query_vacia,
    fecha_hora DATETIME YEAR TO MINUTE NOT NULL CONSTRAINT Historial_fecha_vacia
);

  
CREATE TABLE Errores
(
    codigo_error SERIAL PRIMARY KEY CONSTRAINT Errores_clave_primaria,
    foranea_CI_Persona INT REFERENCES Personas (CI) CONSTRAINT Errores_fk_Personas_CI,
    query lvarchar(1000) NOT NULL CONSTRAINT Errores_query_vacia,
    fecha_hora_e DATETIME YEAR TO MINUTE NOT NULL CONSTRAINT  Errores_fecha_error_vacio

);

                                        
-- ACA CREAMOS LAS TABLAS DE RELACIONES
------------------------------------ nota INT CHECK ( nota > 0 AND nota < 13) CONSTRAINT nota_valida,
-- grado INT CHECK ( grado > 0 AND grado < 8) CONSTRAINT validar_grado,
-- tipo varchar(20) CHECK (tipo IN ('Admin', 'Docente', 'Alumno')) CONSTRAINT tipo_valido,


  DROP TABLE IF EXISTS Relacion_Grupos_Formado_Asignaturas;
  DROP TABLE IF EXISTS Relacion_Docente_Trabaja_Instituto;
  DROP TABLE IF EXISTS Relacion_Alumno_Asiste_Instituto;
  DROP TABLE IF EXISTS Relacion_Alumno_Asignatura_Grupos;
  DROP TABLE IF EXISTS Relacion_Docente_Asignatura_Grupos;



                                        
CREATE TABLE Relacion_Docente_Trabaja_Instituto
(
    foranea_CI_docente INT REFERENCES Personas (CI) CONSTRAINT Relacion_Docente_Trabaja_Instituto_fk_Personas_CI,
    foranea_id_instituto  INT REFERENCES Institutos (id_instituto) CONSTRAINT Relacion_Docente_Trabaja_Instituto,
    PRIMARY KEY (foranea_CI_docente, foranea_id_instituto) CONSTRAINT Relacion_Docente_Trabaja_Instituto_Clave_primaria_valida
);



CREATE TABLE Relacion_Alumno_Asiste_Instituto
(
    foranea_CI_alumno INT REFERENCES Personas (CI) CONSTRAINT Relacion_Alumno_Asiste_Instituto_fk_Personas_CI,
    foranea_id_instituto  INT REFERENCES Institutos (id_instituto) CONSTRAINT Relacion_Alumno_Asiste_Instituto_fk_id_instituto,
    PRIMARY KEY (foranea_CI_alumno, foranea_id_instituto) CONSTRAINT Relacion_Alumno_Asiste_Instituto_clave_primaria
);



CREATE TABLE Relacion_Grupos_Formado_Asignaturas
(
    foranea_id_grupo INT NOT NULL CONSTRAINT Relacion_Grupos_Formado_Asignaturas_Grupos_id_grupo,
    foranea_id_asignatura INT REFERENCES Asignaturas (id_asignatura) CONSTRAINT Relacion_Grupos_Formado_Asignaturas_fk_id_asignatura,
    foranea_id_instituto INT NOT NULL CONSTRAINT Relacion_Grupos_Formado_Asignaturas_id_instituto,
    FOREIGN KEY  (foranea_id_grupo, foranea_id_instituto) REFERENCES Grupos CONSTRAINT Relacion_Grupos_Formado_Asignaturas_fk_clave_foranea_grupos_valida,
    PRIMARY KEY (foranea_id_grupo,foranea_id_asignatura,foranea_id_instituto) CONSTRAINT Relacion_Grupos_Formado_Asignaturas_clave_primaria
);


CREATE TABLE Relacion_Alumno_Asignatura_Grupos
(
    foranea_CI_alumno INT REFERENCES Personas (CI) CONSTRAINT Relacion_Alumno_Asignatura_Grupos_fk_Personas_CI,
    foranea_id_asignatura  INT REFERENCES Asignaturas (id_asignatura) CONSTRAINT Relacion_Alumno_Asignatura_Grupos_fk_id_asignatura,
    foranea_id_grupo INT NOT NULL CONSTRAINT Relacion_Alumno_Asignatura_Grupos_fk_id_grupo,
    foranea_id_instituto  INT NOT NULL CONSTRAINT Relacion_Alumno_Asignatura_Grupos_fk_id_instituto,
    nota_final_asignatura INT CHECK ( nota_final_asignatura > 0 AND nota_final_asignatura < 13) CONSTRAINT nota_final_asignatura_valida,
    FOREIGN KEY  (foranea_id_grupo, foranea_id_instituto) REFERENCES Grupos CONSTRAINT Relacion_Alumno_Asignatura_Grupos_fk_clave_foranea_grupos_valida,
    PRIMARY KEY (foranea_CI_alumno, foranea_id_asignatura, foranea_id_grupo, foranea_id_instituto) CONSTRAINT Relacion_Alumno_Asignatura_Grupos_clave_primaria
);



CREATE TABLE Relacion_Docente_Asignatura_Grupos
(
    foranea_CI_docente INT REFERENCES Personas (CI) CONSTRAINT Relacion_Docente_Asignatura_Grupos_fk_Personas_CI,
    foranea_id_asignatura  INT REFERENCES Asignaturas (id_asignatura) CONSTRAINT Relacion_Docente_Asignatura_Grupos_fk_id_asignatura,
    foranea_id_instituto  INT NOT NULL CONSTRAINT Relacion_Docente_Asignatura_Grupos_fk_id_instituto,
    foranea_id_grupo INT NOT NULL CONSTRAINT Relacion_Docente_Asignatura_Grupos_fk_id_grupo,
    FOREIGN KEY  (foranea_id_grupo,foranea_id_instituto) REFERENCES Grupos CONSTRAINT Relacion_Docente_Asignatura_Grupos_fk_clave_foranea_grupos_valida,
    PRIMARY KEY (foranea_CI_docente, foranea_id_asignatura, foranea_id_grupo, foranea_id_instituto) CONSTRAINT Relacion_Docente_Asignatura_Grupos_clave_primaria
);


                             

