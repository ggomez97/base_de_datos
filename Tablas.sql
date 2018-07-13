<<<<<<< HEAD
CREATE TABLE persona
(
ci integer PRIMARY KEY  CONSTRAINT persona_primaria,
p_nombre varchar (20) NOT NULL,
s_nombre varchar (20),
p_apellido varchar (20) not null,
s_apellido varchar (20) not null,
telefono varchar (100) not null,
dir_calle varchar (100) not null,
dir_numero varchar (100) not null,
grupo_alumno integer references grupo (cod_grupo) constraint persona_grupo_alumno_fk_grupo,
num_funcionario serial not null,
grado integer not null CHECK ( grado > 0 AND grado < 8), 
email varchar (50),
sexo char not null,
baja boolean NOT NULL CONSTRAINT persona_baja
);
=======
CREATE TABLE grupo
( 
cod_grupo serial primary key not null constraint grupo_key_primaria,
orientacion_grupo int references orientacion (cod_orientacion) constraint grupo_fk_orientacion_grupo not null,
baja boolean NOT NULL constraint grupo_baja
)

CREATE TABLE alumno
( 
num_alumno serial not null,
grupo_alumno int references grupo (cod_grupo) constraint alumno_fk_grupo not null,
ci_alumno smallint references persona (ci) constraint ci_alumno_fk_persona not null,
baja boolean NOT NULL constraint alumno_baja
);

CREATE TABLE nota
( 
num_funcionario serial not null,
ci_alumno smallint references persona (ci) constraint nota_ci_alumno_fk_persona not null,
cod_materia int not null,
fechah_hora_nota  datetime year to minute primary key  NOT NULL CONSTRAINT Historial_fecha,
nota int check (nota > 0 and nota < 13),
tipo varchar(30) check (tipo in ('Oral','Escrito','Proyecto')) not null , 
baja boolean NOT NULL constraint nota_baja
);

CREATE TABLE lista (
cod_lista serial primary key constraint lista_primaria not null,
cod_grupo integer references grupo (cod_grupo) constraint lista_cod_grupo_fk_grupo not null,
ci_docente integer references persona (ci) constraint lista_ci_docente_fk_persona,
baja boolean NOT NULL constraint lista_baja
)
>>>>>>> e5c6055c2fa54352a68bf96acf9a386419e7d276
