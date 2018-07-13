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

create table ciudad
(cod_ciudad serial not null primary key constraint ciudad_primaria,
nom_ciudad varchar (20) not null,
nom_departamento varchar (20) not null,
baja boolean not null constraint ciudad_baja
);

create table instituto
(cod_instituto serial not null primary key constraint instituto_primaria,
cod_ciudad integer references ciudad (cod_ciudad) constraint instituto_fk_cod_ciudad not null,
nombre_instituto varchar (50) not null,
calle_instituto varchar (50) not null,
telefonos varchar (100)not null,
email varchar (80) not null,
baja boolean not null constraint instituto_baja
);