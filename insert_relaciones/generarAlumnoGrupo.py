cont = 1
INSERT = open("insert_alumno_grupo.sql", "w")

for ci in open("cedula.txt"):
	ci = ci.strip("\n")
	ci = ci.split("-")
	if cont <= 20:
		ininto = "INSERT INTO relacion_alumno_pertenece_grupo(fk_cod_grupo, fk_ci_alumno)\n"
		values = 'VALUES ({}, {}{});\n'.format(cont, ci[0], ci[1])
		sentencia = str(ininto+values)
		INSERT.write(sentencia)
		cont+=1
	else:
		cont = 1
	#while i < 20:
	#	
	#	i+=1
	#cont+=1
	#if cont > 20:
	#	cont = 1	
		