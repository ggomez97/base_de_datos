cont = 1
INSERT = open("InsertPersonaInstituto.sql", "w")

for ci in open("cedula.txt"):
	ci = ci.strip("\n")
	ci = ci.split("-")
	if cont <= 10:
		ininto = "INSERT INTO relacion_persona_pertenece_instituto(fk_cod_instituto, fk_ci_persona)\n"
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
		