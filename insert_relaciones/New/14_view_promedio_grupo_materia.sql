CONNECT TO 'proyecto_x@miServidor' USER 'its'  USING '1234';
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