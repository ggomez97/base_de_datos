
CONNECT TO 'proyecto_x@miServidor' USER 'its'  USING 'kakurira';

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
    nom_orientacion varchar (100) not null,
    descripcion lvarchar (400),
    baja boolean not null constraint orientacion_baja
);

 create table grupo 
(
    cod_grupo serial primary key constraint grupo_primaria not null,
    nom_grupo varchar (10) not null,
    turno VARCHAR (20) not null check (turno in ('Matutino','Vespertino','Nocturno')),
    fk_cod_orientacion integer references orientacion (cod_orientacion) constraint grupo_fk_cod_orientacion, 
    fk_cod_instituto INTEGER REFERENCES instituto (cod_instituto) CONSTRAINT grupo_fk_cod_instituto,
    baja boolean not null constraint grupo_baja
);

CREATE TABLE persona
(
    ci integer PRIMARY KEY  CONSTRAINT persona_primaria not null  ,
    p_nombre varchar (20) NOT NULL,
    s_nombre varchar (20),
    p_apellido varchar (20) not null,
    s_apellido varchar (20) not null,
    tipo varchar (20) not null CHECK (tipo in ('Alumno','Docente','Gestion')),    
    telefono varchar (100) not null,
    dir_calle varchar (100) not null,
    dir_numero varchar (100) not null,
    grado integer CHECK ( grado > 0 AND grado < 7),
    nota_final_proyecto integer check (nota_final_proyecto > 0 AND nota_final_proyecto < 13),     
    email varchar (50),    
    sexo char not null CHECK (sexo IN ('M', 'F','O')),
    fecha_nac date not null,
    hace_proyecto boolean,
    baja boolean NOT NULL CONSTRAINT persona_baja
);

create table materia 
(
    cod_materia serial primary key constraint materia_primaria not null,
    fk_cod_orientacion integer references orientacion (cod_orientacion) constraint materia_fk_cod_orientacion not null,
    nom_materia varchar (100) not null,
    baja boolean not null constraint baja_materia 
);

create table lista
(
    cod_lista serial primary key constraint lista_primaria not null,
    fk_cod_grupo integer references grupo (cod_grupo) constraint lista_fk_cod_grupo not null,
    fk_ci_docente integer references persona (ci) on delete cascade constraint lista_fk_ci_docente not null,
    fk_cod_materia integer references materia (cod_materia) constraint lista_fk_cod_materia not null,
    baja boolean not null constraint baja_lista
);

create table calificacion
(
    cod_nota serial primary key constraint nota_primaria not null,
    fechaHora date null,    
    fk_ci_alumno integer references persona (ci) on delete cascade constraint nota_fk_ci_alumno not null,
    fk_cod_lista integer references lista (cod_lista) constraint nota_fk_cod_lista not null,
    nota integer check (nota > 0 and nota < 13) constraint nota,
    tipo_nota varchar (30) check (tipo_nota in ('Oral','Escrito','Proyecto')) not null ,
    baja boolean not null constraint baja_nota
);

create table historico
(
    cod_historico serial primary key constraint historico_primaria not null,
    fk_ci_persona integer references persona (ci) on delete cascade constraint historico_fk_ci_persona not null,
    accion lvarchar (500) not null,
    fechaHora datetime year to minute not null,
    ip_terminal varchar (20) not null,
    baja boolean not null constraint baja_historico
);

create table relacion_persona_pertenece_instituto
(
    fk_cod_instituto integer references instituto (cod_instituto) constraint relacion_persona_pertenece_instituto_fk_instituto not null ,
    fk_ci_persona integer references persona (ci) on delete cascade constraint relacion_persona_pertenece_instituto_fk_ci not null,
    PRIMARY KEY (fk_cod_instituto, fk_ci_persona) CONSTRAINT relacion_persona_pertenece_instituto_primarias
);
create table relacion_alumno_pertenece_grupo
(
    fk_cod_grupo integer references grupo (cod_grupo) constraint relacion_alumno_pertenece_grupo_fk_cod_grupo not null ,
    fk_ci_alumno integer references persona (ci) on delete cascade constraint relacion_alumno_pertenece_grupo_fk_ci_alumno not null,
    PRIMARY KEY (fk_cod_grupo, fk_ci_alumno) CONSTRAINT relacion_alumno_pertenece_grupo_primarias
);

create table relacion_docente_dicta_materia
(
    fk_cod_materia integer references materia (cod_materia) constraint relacion_docente_dicta_materia_fk_cod_materia not null ,
    fk_ci_docente integer references persona (ci) on delete cascade constraint relacion_docente_dicta_materia_fk_ci_docente not null,
    PRIMARY KEY (fk_cod_materia, fk_ci_docente) CONSTRAINT relacion_docente_dicta_materia_primarias
);
create table relacion_alumno_tiene_materia
(
    fk_cod_materia integer references materia (cod_materia) constraint relacion_alumno_tiene_materia_fk_cod_materia not null ,
    fk_ci_alumno integer references persona (ci) on delete cascade constraint relacion_alumno_tiene_materia_fk_ci_alumno not null,
    nota_final_materia int check (nota_final_materia > 0 and nota_final_materia < 13) constraint nota_final_materia,
    p_oral int check (p_oral> 0 and p_oral < 13) constraint p_oral,
    p_escrito int check (p_escrito > 0 and p_escrito < 13) constraint p_escrito,
    p_proyecto int check (p_proyecto > 0 and p_proyecto < 13) constraint p_proyecto,
    PRIMARY KEY (fk_cod_materia, fk_ci_alumno) CONSTRAINT relacion_alumno_tiene_materia_primarias
);



