create table ciudad
(cod_ciudad serial not null primary key constraint ciudad_primaria,
nom_ciudad varchar (20) not null,
nom_departamento varchar (20) not null,
baja boolean not null constraint ciudad_baja
);
#########################################################################################
CREACION DE LAS ENTIDADES
########################################################################################


create table instituto
(cod_instituto serial not null primary key constraint instituto_primaria,
cod_ciudad integer references ciudad (cod_ciudad) constraint instituto_fk_cod_ciudad not null,
nombre_instituto varchar (50) not null,
calle_instituto varchar (50) not null,
telefonos varchar (100)not null,
email varchar (80) not null,
baja boolean not null constraint instituto_baja
);

create table orientacion 
(cod_orientacion serial primary key constraint orientacion_primaria not null,
nomb_orientacion varchar (20) not null,
descripcion lvarchar (400),
baja boolean not null constraint orientacion_baja
);

 create table grupo 
(cod_grupo serial primary key constraint grupo_primaria,
fk_cod_orientacion integer references orientacion (cod_orientacion) constraint grupo_fk_cod_orientacion, 
baja boolean not null constraint grupor_baja
);

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
fk_grupo_alumno integer references grupo (cod_grupo) constraint persona_grupo_alumno_fk_grupo,
num_funcionario serial not null,
grado integer not null CHECK ( grado > 0 AND grado < 8), 
email varchar (50),
sexo char not null,
baja boolean NOT NULL CONSTRAINT persona_baja
);



#########################################################################################
CREACION DE LAS
########################################################################################


create table relacion_persona_pertence_instituto
(fk_cod_instituto integer references instituto (cod_instituto) not null constraint relacion_persona_pertence_instituto_fk_instituto,
cod_ciudad integer references ciudad (cod_ciudad) constraint relacion_persona_pertence_instituto_fk_ciudad not null
);

