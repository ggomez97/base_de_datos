#CONSULTA 1
select instituto.nom_instituto as Instituto,persona.ci as Cedula,persona.p_nombre as Nombre ,nom_orientacion as Orientacion ,grupo.nom_grupo as grupo from orientacion
left join grupo on grupo.fk_cod_orientacion = cod_orientacion
left join persona on persona.ci = (select fk_ci_alumno from relacion_alumno_pertenece_grupo where fk_cod_grupo = grupo.cod_grupo and fk_ci_alumno = persona.ci)
left join instituto on instituto.cod_instituto = (select fk_cod_instituto from relacion_persona_pertenece_instituto where fk_cod_instituto = instituto.cod_instituto and fk_ci_persona = persona.ci)
where persona.baja = 'f' and instituto.baja = 'f'and grupo.baja = 'f' and orientacion.baja = 'f'

#CONSULTA 2
select nom_instituto as Instituto,orientacion.nom_orientacion as orientacion,grupo.nom_grupo as grupo,
(select count (fk_ci_alumno) from relacion_alumno_pertenece_grupo where fk_cod_grupo = grupo.cod_grupo) as Cantidad
from instituto 
left join grupo on grupo.fk_cod_instituto = cod_instituto
left join orientacion on orientacion.cod_orientacion = grupo.fk_cod_orientacion 
where orientacion.baja = 'f'and grupo.baja='f' and instituto.baja='f'
order by cantidad desc

#CONSULTA 3
select distinct instituto.nom_instituto as instituto ,materia.nom_materia as materia,persona.ci,persona.p_apellido as apellido ,persona.p_nombre as nombre 
from lista
left join relacion_docente_dicta_materia on relacion_docente_dicta_materia.fk_ci_docente = lista.fk_ci_docente
left join materia on materia.cod_materia = lista.fk_cod_materia
left join persona on persona.ci = lista.fk_ci_docente
left join grupo on grupo.cod_grupo = lista.fk_cod_grupo
left join instituto on instituto.cod_instituto = grupo.fk_cod_instituto
where instituto.baja ='f' and materia.baja ='f' and persona.baja='f' and grupo.baja='f' and persona.baja ='f'
order by materia 

#CONSULTA 4
select nom_instituto as instituto,nom_materia as materia,
(Select count (fk_ci_docente) from relacion_docente_dicta_materia where fk_cod_materia = materia.cod_materia) as cantidad
from instituto,relacion_docente_dicta_materia
left join materia on materia.cod_materia = relacion_docente_dicta_materia.fk_cod_materia
where instituto.baja='f' and materia.baja='f'
order by cantidad desc

#CONSTULA 5
select grupo.nom_grupo as grupo,persona.ci,persona.p_nombre as nombre,persona.p_apellido as apellido,materia.nom_materia as materia,calificacion.fecha,calificacion.calificacion as calificacion,calificacion.tipo_calificacion as tipo
from relacion_alumno_pertenece_grupo
left join grupo on grupo.cod_grupo = relacion_alumno_pertenece_grupo.fk_cod_grupo
left join lista on lista.fk_cod_grupo = relacion_alumno_pertenece_grupo.fk_cod_grupo
left join materia on materia.cod_materia = lista.fk_cod_materia
left join calificacion on calificacion.fk_cod_lista = lista.cod_lista
left join persona on persona.ci = calificacion.fk_ci_alumno
where materia.baja ='f' and grupo.baja='f' and persona.baja ='f' and lista.baja='f' and calificacion.baja='f'

#CONSULTA 6
select calificacion.fecha,grupo.nom_grupo as grupo ,persona.ci,persona.p_nombre as nombre ,persona.p_apellido apellido ,materia.nom_materia as materia ,calificacion.calificacion,calificacion.tipo_calificacion as tipo 
from relacion_alumno_pertenece_grupo
left join grupo on grupo.cod_grupo = relacion_alumno_pertenece_grupo.fk_cod_grupo
left join lista on lista.fk_cod_grupo = relacion_alumno_pertenece_grupo.fk_cod_grupo
left join materia on materia.cod_materia = lista.fk_cod_materia
left join calificacion on calificacion.fk_cod_lista = lista.cod_lista
left join persona on persona.ci = calificacion.fk_ci_alumno
where materia.baja ='f' and grupo.baja='f' and persona.baja ='f' and lista.baja='f' and calificacion.baja='f'
order by fecha

#CONSULTA 7
select instituto.nom_instituto as instituto,grupo.nom_grupo as grupo ,persona.ci,persona.p_nombre as nombre ,persona.p_apellido as apellido ,materia.nom_materia as materia ,
(select round(avg((p_oral)+(p_escrito)+(p_proyecto))/3) from relacion_alumno_tiene_materia where fk_ci_alumno = persona.ci and fk_cod_materia = materia.cod_materia) as promedio
from grupo
left join relacion_alumno_pertenece_grupo on relacion_alumno_pertenece_grupo.fk_cod_grupo = grupo.cod_grupo
left join materia on materia.fk_cod_orientacion = grupo.fk_cod_orientacion
left join persona on persona.ci = relacion_alumno_pertenece_grupo.fk_ci_alumno
left join instituto on instituto.cod_instituto = grupo.fk_cod_instituto
where materia.baja='f' and persona.baja='f' and instituto.baja='f' and grupo.baja='f'

#CONSULTA 8
select instituto.nom_instituto,grupo.nom_grupo,persona.ci,persona.p_nombre,persona.p_apellido,materia.nom_materia,
(select round(avg((p_oral)+(p_escrito)+(p_proyecto))/3 from relacion_alumno_tiene_materia where fk_ci_alumno = persona.ci and fk_cod_materia = materia.cod_materia) as promedio
from grupo
left join relacion_alumno_pertenece_grupo on relacion_alumno_pertenece_grupo.fk_cod_grupo = grupo.cod_grupo
left join materia on materia.fk_cod_orientacion = grupo.fk_cod_orientacion
left join persona on persona.ci = relacion_alumno_pertenece_grupo.fk_ci_alumno
left join instituto on instituto.cod_instituto = grupo.fk_cod_instituto

#CONSULTA 9
select (select (avg((p_oral)+(p_escrito)+(p_proyecto))/3) from relacion_alumno_tiene_materia
left join calificacion on calificacion.fk_cod_lista = lista.cod_lista and calificacion.fk_ci_alumno = relacion_alumno_tiene_materia.fk_ci_alumno )as promedio,
grupo.nom_grupo as Grupo,instituto.nom_instituto as instituto
from grupo
left join lista on lista.fk_cod_grupo = grupo.cod_grupo
left join instituto on instituto.cod_instituto = grupo.fk_cod_instituto
where grupo.baja='f' and lista.baja='f' 
order by promedio desc

#CONSULTA 10 (VISTA)
create view promedio_grupo_materia (lista,grupo,materia,promedio,cantidad) as 
select lista.cod_lista as lista ,grupo.nom_grupo as grupo ,materia.nom_materia as materia,
(select (avg((p_oral)+(p_escrito)+(p_proyecto))/3) from relacion_alumno_tiene_materia
left join calificacion on calificacion.fk_cod_lista = lista.cod_lista and calificacion.fk_ci_alumno = relacion_alumno_tiene_materia.fk_ci_alumno )as promedio,
(select count (fk_ci_alumno) from relacion_alumno_pertenece_grupo where fk_cod_grupo = grupo.cod_grupo) as Cantidad
from grupo
left join lista on lista.fk_cod_grupo = grupo.cod_grupo 
left join materia on materia.cod_materia = lista.fk_cod_materia
where grupo.baja='f' and lista.baja='f' and materia.baja='f'
order by promedio desc

#CONSULTA 11 (VISTA)
create view alumnos_de_lista (ci,alumno,materia,promedio_oral,promedio_escrito,promedio_proyecto ) as
select persona.ci,(persona.p_nombre ||' , '|| persona.p_apellido) as alumno,materia.nom_materia as materia,p_oral as Promedio_oral,p_escrito as promedio_escrito,p_proyecto as promedio_proyecto
from lista
left join materia on materia.cod_materia = lista.fk_cod_materia
left join relacion_alumno_tiene_materia on relacion_alumno_tiene_materia.fk_cod_materia = lista.fk_cod_materia
left join persona on persona.ci= relacion_alumno_tiene_materia.fk_ci_alumno 
left join grupo on grupo.cod_grupo = lista.fk_cod_grupo
where grupo.baja='f' and lista.baja='f' and materia.baja='f' and persona.baja='f' 

#CONSULTA 12 (VISTA)
create view  grupos_estudiantes_docentes_en_instituto (instituto,cantidad_grupos,cantidad_estudiantes,cantidad_docentes) as
select distinct instituto.nom_instituto as instituto, 
(select count (cod_grupo) from grupo where fk_cod_instituto=instituto.cod_instituto) as cantidad_grupos,
(select count (fk_ci_alumno) from relacion_alumno_pertenece_grupo where fk_ci_alumno = (select fk_ci_persona from relacion_persona_pertenece_instituto where fk_cod_instituto = instituto.cod_instituto and 
fk_ci_persona = relacion_alumno_pertenece_grupo.fk_ci_alumno)) as cantidad_estudiantes,
(select count (fk_ci_docente)from relacion_docente_dicta_materia where fk_ci_docente = (select fk_ci_persona from relacion_persona_pertenece_instituto where fk_cod_instituto = instituto.cod_instituto and 
fk_ci_persona = relacion_docente_dicta_materia.fk_ci_docente)) as cantidad_docentes
from instituto 
left join relacion_persona_pertenece_instituto on relacion_persona_pertenece_instituto.fk_cod_instituto = instituto.cod_instituto 


sr.Pablo maidana jefe del centro de computos HRU s.A 098 511 374