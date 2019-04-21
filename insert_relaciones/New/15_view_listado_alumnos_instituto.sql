CONNECT TO 'proyecto_x@miServidor' USER 'its'  USING '1234';
create view listado_alumnos_instituto as
select instituto.nom_instituto as Instituto,persona.ci as Cedula,persona.p_nombre as Nombre ,nom_orientacion as Orientacion ,grupo.nom_grupo as grupo from orientacion
left join grupo on grupo.fk_cod_orientacion = cod_orientacion
left join persona on persona.ci = (select fk_ci_alumno from relacion_alumno_pertenece_grupo where fk_cod_grupo = grupo.cod_grupo and fk_ci_alumno = persona.ci)
left join instituto on instituto.cod_instituto = (select fk_cod_instituto from relacion_persona_pertenece_instituto where fk_cod_instituto = instituto.cod_instituto and fk_ci_persona = persona.ci)
where persona.baja = 'f' and instituto.baja = 'f'and grupo.baja = 'f' and orientacion.baja = 'f'

