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
