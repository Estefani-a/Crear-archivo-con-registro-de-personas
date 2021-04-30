       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREAR-ARCHIVO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT OPTIONAL PERSONAS-ARCHIVO
       ASSIGN TO "C:\Users\Usuario\OneDrive\Escritorio\personas.dat"
       ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD PERSONAS-ARCHIVO.
           01 PERSONAS-REGISTRO.
               05 PERSONA-ID PIC X(6).
               05 PERSONA-NOMBRE PIC X(25).
               05 PERSONA-APELLIDOS PIC X(35).
               05 PERSONA-EDAD PIC X(3).
               05 PERSONA-TELEFONO PIC X(9).
               05 PERSONA-DIRECCION PIC X(35).
       WORKING-STORAGE SECTION.
       01  IDENTIFICADOR PIC X(36)
           VALUE "Introduce un ID del nuevo empleado: ".
       01  NOMBRE PIC X(33)
           VALUE "Introduce un nombre de empleado: ".
       01  APELLIDOS PIC X(25)
           VALUE "Introduce los apellidos: ".
       01  EDAD PIC X(19)
           VALUE "Introduce la edad: ".
       01  TELEFONO PIC X(33)
           VALUE "Introduce un número de teléfono: ".
       01  DIRECCION PIC X(25)
           VALUE "Introduce una dirección: ".
       01  SI-NO PIC X.
       01  ENTRADA PIC X.
       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.
       PERFORM PROCEDIMIENTO-DE-APERTURA.
       MOVE "S" TO SI-NO.
       PERFORM AGREGAR-REGISTROS
       UNTIL SI-NO = "N".
       PERFORM PROCEDIMIENTO-DE-CIERRE.
       PROGRAM-DONE.
       STOP RUN.
       PROCEDIMIENTO-DE-APERTURA.
       OPEN EXTEND PERSONAS-ARCHIVO.
       PROCEDIMIENTO-DE-CIERRE.
       CLOSE PERSONAS-ARCHIVO.
       AGREGAR-REGISTROS.
       MOVE "N" TO ENTRADA.
       PERFORM OBTENER-CAMPOS
       UNTIL ENTRADA = "S".
       PERFORM ESCRIBIR-REGISTRO.
       PERFORM REINICIAR.
       OBTENER-CAMPOS.
       MOVE SPACE TO PERSONAS-REGISTRO.
       DISPLAY IDENTIFICADOR " ? ".
       ACCEPT PERSONA-ID.
       DISPLAY NOMBRE " ? ".
       ACCEPT PERSONA-NOMBRE.
       DISPLAY APELLIDOS " ? ".
       ACCEPT PERSONA-APELLIDOS.
       DISPLAY EDAD " ? ".
       ACCEPT PERSONA-EDAD.
       DISPLAY TELEFONO "?".
       ACCEPT PERSONA-TELEFONO
       DISPLAY DIRECCION.
       ACCEPT PERSONA-DIRECCION.
       PERFORM CONTINUAR.
       CONTINUAR.
       MOVE "S" TO ENTRADA.
       IF  PERSONA-NOMBRE = SPACE
       MOVE "N" TO ENTRADA.
       ESCRIBIR-REGISTRO.
       WRITE PERSONAS-REGISTRO.
       REINICIAR.
       DISPLAY "¿Desea almacenar otro registro en la base de datos?".
       ACCEPT SI-NO.
       IF SI-NO = "s"
       MOVE "S" TO SI-NO.
       IF SI-NO NOT = "S"
       MOVE "N" TO SI-NO.
       END PROGRAM CREAR-ARCHIVO.
