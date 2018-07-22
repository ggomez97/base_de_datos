
#########################################################################################
CREACION DE LAS ENTIDADES
########################################################################################

create table ciudad
(
    cod_ciudad serial not null primary key constraint ciudad_primaria,
    nom_ciudad varchar (20) not null,
    nom_departamento varchar (20) not null,
    baja boolean not null constraint ciudad_baja
);

create table instituto
(
    cod_instituto serial not null primary key constraint instituto_primaria,
    fk_cod_ciudad integer references ciudad (cod_ciudad) constraint instituto_fk_cod_ciudad not null,
    nom_instituto varchar (50) not null,
    calle_instituto varchar (50) not null,
    telefonos varchar (100)not null,
    email varchar (80) not null,
    directora varchar (20) not null,
    subdirectora varchar (20) not null,
    baja boolean not null constraint instituto_baja
);

create table orientacion 
(
    cod_orientacion serial primary key constraint orientacion_primaria not null,
    nom_orientacion varchar (20) not null,
    descripcion lvarchar (400),
    baja boolean not null constraint orientacion_baja
);

CREATE TABLE turnos
( 
    cod_turno serial primary key not null constraint turno_primaria,
    tipo varchar (20) check (tipo in ('Matutino','Vespertino','Nocturno')) not null,
    hora_inicio_fin varchar (30)not null,
    baja boolean constraint grupo_baja NOT NULL
);

 create table grupo 
(
    cod_grupo serial primary key constraint grupo_primaria not null,
    fk_cod_orientacion integer references orientacion (cod_orientacion) constraint grupo_fk_cod_orientacion, 
    fk_cod_turno integer references turnos (cod_turno) constraint grupo_fk_cod_turno not null,
    baja boolean not null constraint grupo_baja
);

CREATE TABLE persona
(
    ci integer PRIMARY KEY  CONSTRAINT persona_primaria not null,
    p_nombre varchar (20) NOT NULL,
    s_nombre varchar (20),
    p_apellido varchar (20) not null,
    s_apellido varchar (20) not null,
    tipo varchar (20) not null CHECK (tipo in ('Alumno','Docente','Funcionario de la UTU')),
    telefono varchar (100) not null,
    dir_calle varchar (100) not null,
    dir_numero varchar (100) not null,
    grado integer CHECK ( grado > 0 AND grado < 8),
    nota_final_proyecto integer check (nota_final_proyecto > 0 AND nota_final_proyecto < 13), 
    email varchar (50),    
    sexo char not null CHECK (sexo IN ('M', 'F','O')),
    baja boolean NOT NULL CONSTRAINT persona_baja
);

create table materia 
(
    cod_materia serial primary key constraint materia_primaria not null,
    fk_cod_orientacion integer references orientacion (cod_orientacion) constraint materia_fk_cod_orientacion not null,
    nom_materia varchar (20) not null,
    baja boolean not null constraint baja_materia 
);

create table lista
(
    cod_lista serial primary key constraint lista_primaria not null,
    fk_cod_grupo integer references grupo (cod_grupo) constraint lista_fk_cod_grupo not null,
    fk_ci_docente integer references persona (ci) constraint lista_fk_ci_docente not null,
    fk_cod_materia integer references materia (cod_materia) constraint lista_fk_cod_materia not null,
    baja boolean not null constraint baja_lista
);

create table nota
(
    cod_nota serial primary key constraint nota_primaria not null,
    fechaHora date null,
    fk_ci_docente integer references persona (ci) constraint  nota_fk_ci_docente not null,
    fk_ci_alumno integer references persona (ci) constraint nota_fk_ci_alumno not null,
    fk_cod_lista integer references lista (cod_lista) constraint nota_fk_cod_lista not null,
    fk_cod_materia integer references materia (cod_materia) constraint nota_fk_cod_materianot null,
    nota integer check (nota > 0 and nota < 13) constraint nota,
    tipo_nota varchar (30) check (tipo_nota in ('Oral','Escrito','Proyecto')) not null ,
    baja boolean not null constraint baja_nota
);

create table historico
(
    cod_historico serial primary key constraint historico_primaria not null,
    fk_ci_persona integer references persona (ci) constraint historico_fk_ci_persona not null,
    accion lvarchar (500) not null,
    fechaHora datetime year to minute not null,
    ip_maquina varchar (20) not null,
    baja boolean not null constraint baja_historico
);

#########################################################################################
CREACION DE LAS RELACIONES
########################################################################################


create table relacion_persona_pertence_instituto
(
    fk_cod_instituto integer references instituto (cod_instituto) constraint relacion_persona_pertence_instituto_fk_instituto not null ,
    fk_ci_persona integer references persona (ci) constraint relacion_persona_pertence_instituto_fk_ci not null,
    PRIMARY KEY (fk_cod_instituto, fk_ci_persona) CONSTRAINT relacion_persona_pertenece_instituto_primarias
);
create table relacion_alumno_pertence_grupo
(
    fk_cod_grupo integer references grupo (cod_grupo) constraint relacion_alumno_pertence_grupo_fk_cod_grupo not null ,
    fk_ci_alumno integer references persona (ci) constraint relacion_alumno_pertence_grupo_fk_ci_alumno not null,
    PRIMARY KEY (fk_cod_grupo, fk_ci_alumno) CONSTRAINT relacion_alumno_pertenece_grupo_primarias
);

create table relacion_docente_dicta_materia
(
    fk_cod_materia integer references materia (cod_materia) constraint relacion_docente_dicta_materia_fk_cod_materia not null ,
    fk_ci_docente integer references persona (ci) constraint relacion_docente_dicta_materia_fk_ci_docente not null,
    PRIMARY KEY (fk_cod_materia, fk_ci_docente) CONSTRAINT relacion_docente_dicta_materia_primarias
);
create table relacion_alumno_tiene_materia
(
    fk_cod_materia integer references materia (cod_materia) constraint relacion_alumno_tiene_materia_fk_cod_materia not null ,
    fk_ci_alumno integer references persona (ci) constraint relacion_alumno_tiene_materia_fk_ci_alumno not null,
    nota_final_materia int check (nota_final_materia > 0 and nota_final_materia < 13) constraint nota_final_materia,
    PRIMARY KEY (fk_cod_materia, fk_ci_alumno) CONSTRAINT relacion_alumno_tiene_materia_primarias
);

#########################################################################################
INGRESO DE DATOS
########################################################################################

INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Montevideo" , "Montevideo" , "f" );
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Florida" , "Florida" , "f" );
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Canelones" , "Canelones" , "f" );
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Libertad" , "San Jose" , "f" );
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Ciudad del plata" , "San Jose" , "f" );


INSERT INTO instituto ( fk_cod_ciudad, nombre_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES ( , "Escuela Técnica Arroyo Seco", "Av. Agraciada Esq. Aguilar", "29243865:29243856", "etas010@gmail.com", "f" ,"Álvaro Ricca", "Adriana Di Loreto" );
INSERT INTO instituto ( fk_cod_ciudad, nombre_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES ( , "Escuela Tecnica Atlantida", "Republica Argentina esq. Republica de chile", "43723507:43728578", "utuatlantida@adinet.com.uy", "f" ,"Carmen Blanco", "Maria Spada" );
INSERT INTO instituto ( fk_cod_ciudad, nombre_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES ( ,"Escuela Tecnica San Jose Maria Espinola", "Sarabdu esq.Zorrilla", "43422064:4342286", "utusanjose@gmail.com", "f" ,"Adriana Delgado", "Maria Castro" );
INSERT INTO instituto (fk_cod_ciudad, nombre_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES ( , "Escuela Tecnica Alfredo Zitarrosa", "Ruta uno KM veintinueve", "23472021:23475197:23471459", "utualfredozitarrosa@gmail.com", "f" ,"Silva Silveira", "Daiana Silva" );
INSERT INTO instituto (fk_cod_ciudad, nombre_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES ( , "Escuela Tecnica Superior Florida", "Gral.Flores esq. Batlle y Ordoñez", "43526757:43522280:43528045", "escuelatecnica@gmail.com", "f" ,"Mariana Morales", "Wilson Monce" );

############################################################################################################################################################################################################
DA ERROR DE DATOS REPETIDO PERO ESTA BIEN IGUAL
############################################################################################################################################################################################################
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (48543076,"Gabriel","Fernando","Gomez","Mendaro","Docente","092055380","Bernardo susviela","4117","" , 8 ,"gabito.mini@gmail.com","M","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (15987414,"Pedro","Jose","Aguiar","Rodrigez","Alumno","092987666","Castro","117","","","pedro.jose@gmail.com","M","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (45673164,"Victoria","Josefina","Perez","Gato","Docente","097318663","Minas","67",2,"","victoria.perez@gmail.com","F","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (24517632,"Ana","","Gamio","Rodrigez","Docente","094563219","Isla de flores","647",6,"","ana.gamio@gmail.com","F","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (43267946,"Hubert","Isaul","Bravo","Caballero","Docente","092666999","Flores","6837",2,"","xxx@gmail.com","O","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (16921234,"Kima","Soul","Reguetto","Perez","Alumno","092222999","Margaritas","837","", 2 ,"2xxx@gmail.com","F","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (35469987,"Ice","Cube","Amerikka","Wanted","Alumno","092000999","Nipple","1237","", 9 ,"11xxx@gmail.com","M","f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, baja)
VALUES (55564155,"Rodrigo"," ","Gonzales","Gutierrez","Alumno","091225430","Grecia","8437", "" , "" ,"42x51xx@gmail.com","M","f");



insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (4,15987414);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (5,45673164);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (6,24517632);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (7,43267946);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (3,16921234);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (3,35469987);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (3,55564155);
insert into relacion_persona_pertence_instituto (fk_cod_instituto,fk_ci_persona)
values (3,48543076)





select ciudad.cod_ciudad,instituto.nom_instituto,ciudad.nom_departamento,ciudad.nom_ciudad
from ciudad
inner join instituto on ciudad.cod_ciudad=instituto.fk_cod_ciudad;

