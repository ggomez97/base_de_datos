
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
    cod_ciudad integer references ciudad (cod_ciudad) constraint instituto_ci not null,
    nombre_instituto varchar (50) not null,
    calle_instituto varchar (50) not null,
    telefonos varchar (100)not null,
    email varchar (80) not null,
    baja boolean not null constraint instituto_baja
);

create table orientacion 
(
    cod_orientacion serial primary key constraint orientacion_primaria not null,
    nomb_orientacion varchar (20) not null,
    descripcion lvarchar (400),
    baja boolean not null constraint orientacion_baja
);

 create table grupo 
(
    cod_grupo serial primary key constraint grupo_primaria,
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
(fk_cod_materia integer references materia (cod_materia) constraint relacion_alumno_tiene_materia_fk_cod_materia not null ,
fk_ci_alumno integer references persona (ci) constraint relacion_alumno_tiene_materia_fk_ci_alumno not null,
PRIMARY KEY (fk_cod_materia, fk_ci_alumno) CONSTRAINT relacion_alumno_tiene_materia_primarias
);