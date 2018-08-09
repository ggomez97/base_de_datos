AlumnoMateria = open("insert_alumno_materia.sql", "w")

ori = 1
mat = 1
notaFinal="NULL"
for ci in open("cedula.txt"):
    ci = ci.strip("\n")
    ci = ci.split("-")
    materias = []
    if ori == 1:
        while mat <= 7:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)

        ori += 1

    elif ori == 2:    
        while mat <= 13:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 3:    
       while mat <= 21:
           materias.append(mat)
           mat+=1
       for materia in materias:
           sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
           values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
           sentencia+=values
           AlumnoMateria.write(sentencia)
       ori += 1

    elif ori == 4:    
        while mat <= 26:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 5:    
        while mat <= 33:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 6:    
        while mat <= 37:
            materias.append(mat)
            mat+=1

        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 7:    
        while mat <= 42:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 8:    
        while mat <= 47:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 9:    
        while mat <= 53:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        ori += 1

    elif ori == 10:    
        while mat <= 60:
            materias.append(mat)
            mat+=1
        for materia in materias:
            sentencia = "INSERT INTO relacion_alumno_tiene_materia (fk_cod_materia, fk_ci_alumno, nota_final_materia)\n"
            values = 'VALUES ({}, {}{}, {});\n'.format(materia,ci[0],ci[1],notaFinal)
            sentencia+=values
            AlumnoMateria.write(sentencia)
        mat = 1    
        ori = 1    
