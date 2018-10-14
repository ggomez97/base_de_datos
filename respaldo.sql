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
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Artigas" , "Artigas" , "f" );
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Fraile Muerto" , "Cerro Largo" , "f" );
INSERT INTO Ciudad (nom_ciudad, nom_departamento,baja)
VALUES ("Carmelo" , "Colonia" , "f" );


INSERT INTO instituto ( fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES ( 1, "Escuela Técnica Arroyo Seco", "Av. Agraciada Esq. Aguilar", "29243865:29243856", "etas010@gmail.com", "f" ,"Álvaro Ricca", "Adriana Di Loreto" );
INSERT INTO instituto ( fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (3 , "Escuela Tecnica Atlantida", "Republica Argentina esq. Republica de chile", "43723507:43728578", "utuatlantida@adinet.com.uy", "f" ,"Carmen Blanco", "Maria Spada" );
INSERT INTO instituto ( fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (5 ,"Escuela Tecnica San Jose Maria Espinola", "Sarabdu esq.Zorrilla", "43422064:4342286", "utusanjose@gmail.com", "f" ,"Adriana Delgado", "Maria Castro" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (4 , "Escuela Tecnica Alfredo Zitarrosa", "Ruta uno KM veintinueve", "23472021:23475197:23471459", "utualfredozitarrosa@gmail.com", "f" ,"Silva Silveira", "Daiana Silva" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (2, "Escuela Tecnica Superior Florida", "Gral.Flores esq. Batlle y Ordoñez", "43526757:43522280:43528045", "escuelatecnica@gmail.com", "f" ,"Mariana Morales", "Wilson Monce" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (1, 'Intituto Tecnico Superior "Buceo"', "Av. Rivera 3729 Esq. Tomas de Tesanos", "26285408:26285813:43528045", "itsbuceo@gmail.com", "f" ,"Pedro Guisante", "Alonzo fernandez" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (1, 'Escuela Tecnica Cerro "Mtro. Nicasio Garcia"', "Portugal 4257 Esq. Carlos Ma Ramirez", "23111056:231194073:23114949", "portugal4257@hotmail.com", "f" ,"Alejandra Varela", "Belen Santos" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (7, "Escuela Tecnica Fraile Muerto", "Portugal 4257 Esq. Carlos Ma Ramirez", "23111056:231194073:23114949", "portugal4257@hotmail.com", "f" ,"Pablo Stramin", "Horacio Armenio" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (6, "Escuela Agraria Artigas", "Ruta 30 Km. 5", "47724460", "agrariaart@gmail.com", "f" ,"Yamandu Rodrigez", "Fernado Nandez" );
INSERT INTO instituto (fk_cod_ciudad, nom_instituto, calle_instituto, telefonos, email, baja, directora, subdirectora)
VALUES (8, "Escuela Tecnica Carmelo", "Jose E. Rodo Esq. Ruta 21", "45422317:4542401", "utucarmelo@hotmail.com", "f" ,"Catarina Mendez", "Santiago Vazques" );

INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (47911800, "Martin", NULL ,"Kasamajeu" , "del Pino" ,"Alumno", "092228484", "Camino de los granjeros", "4860",NULL ,NULL,"martin@casamayou.net", "O",11/03/1999 ,"t", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (48543076,"Gabriel","Fernando","Gomez","Mendaro","Docente","092055380","Bernardo susviela","4117",NULL , 8 ,"gabito.mini@gmail.com","O",01/02/1993 ,"f", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (15987414,"Pedro","Jose","Aguiar","Rodrigez","Alumno","092987666","Castro","117",NULL,NULL,"pedro.jose@gmail.com","M",17/09/1969 ,"t", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (45673164,"Victoria","Josefina","Perez","Gato","Docente","097318663","Minas","67",2,NULL,"victoria.perez@gmail.com","F",04/09/1978 ,"f", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (24517632,"Ana",NULL,"Gamio","Rodrigez","Docente","094563219","Isla de flores","647",6,NULL,"ana.gamio@gmail.com","F",05/02/1995 ,"f", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (43267946,"Hubert","Isaul","Bravo","Caballero","Docente","092666999","Flores","6837",2,NULL,"xxx@gmail.com","O",28/07/1985 ,"f", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (16921234,"Kima","Soul","Reguetto","Perez","Alumno","092222999","Margaritas","837",NULL, 2 ,"2xxx@gmail.com","F",09/12/1993,"t", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (35469987,"Ice","Cube","Amerikka","Wanted","Alumno","092000999","Nipple","1237",NULL, 9 ,"11xxx@gmail.com","M",29/06/1997 ,"t", "f");
INSERT INTO persona (ci, p_nombre, s_nombre, p_apellido, s_apellido, tipo, telefono, dir_calle, dir_numero, grado, nota_final_proyecto, email, sexo, fecha_nac, hace_proyecto, baja)
VALUES (55564155,"Rodrigo", NULL,"Gonzales","Gutierrez","Alumno","091225430","Grecia","8437", NULL , NULL ,"42x51xx@gmail.com","M",11/07/1999,"t", "f");


insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (4,15987414);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (5,45673164);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (2,24517632);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (1,43267946);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (4,16921234);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (3,35469987);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (5,55564155);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (3,48543076);
insert into relacion_persona_pertenece_instituto (fk_cod_instituto,fk_ci_persona)
values (1,47911800);


insert into orientacion (nom_orientacion, descripcion,baja)
values ("Administracion", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Agrario", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Aviacion", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Construccion", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Deporte y Recreacion", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Electromecanica - Automotriz", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Electromecanica", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Electronica", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Energia Renovables", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Informatica", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Maquinista Naval", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Quimica Basica e Industrial", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Termodinamica", '"Aca va una descripcion"',"f");
insert into orientacion (nom_orientacion, descripcion,baja)
values ("Turismo", '"Aca va una descripcion"',"f");





insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"APT","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"Adminsitracion y contabilidad Informatizada","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"Comercializacion","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"Contabilidad Superior" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"Economia y Finanzas","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"Matematica A","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (1,"Matematica B","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (2,"Agronegocios","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (2,"Administracion y Gestion de la Empresa Agropecuaria","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (2,"Fisica Aplicada a la Agrotecnologia III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (2,"Quimica Aplicada a la Agrotecnologia III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (2,"Sistemas Productivos Agrarios Vegetales","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (2,"Sistemas Productivos Agrarios Animal","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,"Ingles Tecnico","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,"Fisica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,"Sistemas de Control","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,'Avionica I "Instrumentos"' ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,'Avionica II "Electricidad"' ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,'Avionica III "Comunicaciones"' ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,'Avionica IV "Navegacion"' ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (3,"Practicas y Materiales de Mantenimiento II" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (4,"Administracion y Gestion de Obras III" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (4,"Informatica Aplicada C.A.D III" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (4,"Procesos Constructivos III" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (4,"Tecn. del Diseño de la Construccion III" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (4,"Teoricas Constructivas Contemporaneas" ,"f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Fisica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Biomecanica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Psicologia del Deporte","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Estadistica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Primeros Auxilios","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Gestion y Proyectos","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (5,"Taller de Deporte","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (6,"Administracion y Organizacion de Taller","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (6,"Electronica Analogica - Digital","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (6,"Electromecanica Automotriz II","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (6,"Fisica Tecnica III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (7,"Analisis y Montaje de Sistemas Electricos","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (7,"Dispositivos Mecanicos de Control","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (7,"Electronica y Laboratorio III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (7,"Fisica tecnica III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (7,"Gestion del Mantenimiento Industrial","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (8,"Comunicaciones","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (8,"Electronica III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (8,"Comunicaciones","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (8,"Fisica Tecnica III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (8,"Potencia y Control","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (9,"Laboratorio de Electronica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (9,"Gestion Empresarial","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (9,"Eficiancia Energetica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (9,"Laboratorio de Biomasa","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (9,"Proyecto Electrico","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (9,"Proyecto Termico","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Analisis y Diseño de Aplicaciones","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Formacion Empresarial","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Programacion III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Proyecto","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Sistemas Operativos III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Base de Datos II","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (10,"Taller de Mantenimiento III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (11,"Embrague Calificado","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (11,"Taller Naval III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (11,"Termodinamica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (11,"Maquinas Auxiliares","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (11,"Laboratorios de Electricidad","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (11,"Soldadura","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (12,"Fisica III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (12,"Quimica Bio-Organica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (12,"Quimica General III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (12,"Introduccion a los Procesos Industriales","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (12,"Introduccion al Analisis Quimico","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (13,"Biologia Aplicada","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (13,"Electricidad III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (13,"Seguridad Industrial","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (13,"Termofluidos y Proyecto","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Geografia III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Historia de la Cultura III","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Taller de Recreacion y Cultura Ludica II","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Gestion Empresarial Turistica","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Contabilidad","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Legislacion Turistica Aplicada","f");
insert into materia (fk_cod_orientacion, nom_materia, baja)
values (14,"Planeamineto de Actividades Turisticas","f");


INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AA","Matutino",1, 1, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AB","Matutino",2, 2, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AC","Matutino",3, 3, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AD","Matutino",4, 4, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AE","Matutino",5, 5, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AF","Matutino",6, 6, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AG","Matutino",7, 7, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto, baja)
VALUES ("3°AJ","Matutino",8, 8, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°BA","Nocturno",9, 1, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°BB","Nocturno",10, 2, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°BC","Nocturno",11, 3, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°BE","Nocturno",12, 4, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°BC","Nocturno",13, 5, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°BD","Nocturno",14, 6, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°CA","Vespertino",1,7, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°CB","Vespertino",2,8, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°CC","Vespertino",3, 1, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°CE","Vespertino",4, 2, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°CD","Vespertino",5, 3, "f");
INSERT INTO grupo(nom_grupo, turno, fk_cod_orientacion,fk_cod_instituto,baja)
VALUES ("3°CF","Vespertino",6, 4, "f");




insert into lista (fk_cod_grupo,fk_ci_docente, fk_cod_materia, baja)
values (1,48543076,2,"f");
insert into lista (fk_cod_grupo,fk_ci_docente, fk_cod_materia, baja)
values (2,45673164,10,"f");
insert into lista (fk_cod_grupo,fk_ci_docente, fk_cod_materia, baja)
values (3,24517632,10,"f");
insert into lista (fk_cod_grupo,fk_ci_docente, fk_cod_materia, baja)
values (3,43267946,11,"f");

insert into nota (fechahora,fk_ci_alumno,fk_cod_lista,nota,tipo_nota,baja)
values ( 2017-07-23 ,47911800,2,8,"Escrito","f" );

insert into relacion_alumno_pertenece_grupo (fk_cod_grupo, fk_ci_alumno)
values ( 1 ,48543076);
insert into relacion_alumno_pertenece_grupo (fk_cod_grupo, fk_ci_alumno)
values ( 8 ,47911800);
insert into relacion_alumno_pertenece_grupo (fk_cod_grupo, fk_ci_alumno)
values ( 2 ,15987414);
insert into relacion_alumno_pertenece_grupo (fk_cod_grupo, fk_ci_alumno)
values ( 2 ,16921234);
insert into relacion_alumno_pertenece_grupo (fk_cod_grupo, fk_ci_alumno)
values ( 3 ,55564155);

insert into relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)
values (26 , 48543076, 8);
insert into relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)
values (24 , 47911800, 12);
insert into relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)
values (1 , 15987414, 1);
insert into relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)
values (8, 16921234, 4);
insert into relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)
values (1 , 55564155, 1);

insert into relacion_docente_dicta_materia (fk_cod_materia, fk_ci_docente)
values (26 , 48543076);
insert into relacion_docente_dicta_materia(fk_cod_materia, fk_ci_docente)
values (24 , 45673164);
insert into relacion_docente_dicta_materia (fk_cod_materia, fk_ci_docente)
values (1 , 24517632);
insert into relacion_docente_dicta_materia (fk_cod_materia, fk_ci_docente)
values (8, 43267946);

create role admin;
grant resource to brune;
grant all on ciudad to admin;
grant all on grupo to admin;
grant all on historico to admin;
grant all on instituto to admin;
grant all on martin to admin;
grant all on nota to admin
grant all on orientacion to admin;
grant all on persona to admin,
grant all on relacion_alumno_pertenece_grupo to admin;
grant all on relacion_alumno_tiene_materia to admin;
grant all on relacion_docente_dicta_materia to admin;
grant all on relacion_persona_pertenece_instituto to admin;
set role admin;

select ciudad.cod_ciudad,instituto.nom_instituto,ciudad.nom_departamento,ciudad.nom_ciudad
from ciudad
inner join instituto on ciudad.cod_ciudad=instituto.fk_cod_ciudad;