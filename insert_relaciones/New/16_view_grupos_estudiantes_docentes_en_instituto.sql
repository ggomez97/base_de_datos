CONNECT TO 'proyecto_x@miServidor' USER 'its'  USING '1234';
create view  grupos_estudiantes_docentes_en_instituto (instituto,cantidad_grupos,cantidad_estudiantes,cantidad_docentes) as
select distinct instituto.nom_instituto as instituto, 
(select count (cod_grupo) from grupo where fk_cod_instituto=instituto.cod_instituto) as cantidad_grupos,
(select count (fk_ci_alumno) from relacion_alumno_pertenece_grupo where fk_ci_alumno = (select fk_ci_persona from relacion_persona_pertenece_instituto where fk_cod_instituto = instituto.cod_instituto and 
fk_ci_persona = relacion_alumno_pertenece_grupo.fk_ci_alumno)) as cantidad_estudiantes,
(select count (fk_ci_docente)from relacion_docente_dicta_materia where fk_ci_docente = (select fk_ci_persona from relacion_persona_pertenece_instituto where fk_cod_instituto = instituto.cod_instituto and 
fk_ci_persona = relacion_docente_dicta_materia.fk_ci_docente)) as cantidad_docentes
from instituto 
left join relacion_persona_pertenece_instituto on relacion_persona_pertenece_instituto.fk_cod_instituto = instituto.cod_instituto 