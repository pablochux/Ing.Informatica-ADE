PROGRAM practica8;
CONST
	MIN = 1;
	MAX = 1000;
	
TYPE
	TRangoArray = MIN..MAX;
	TRegistro = RECORD
		Nombre: String;
		Apellido: String; 
		NExpediente: Integer;
		Nota: Real;
		PruebaSuperada: char;
	END;
	TArrayRegistro = ARRAY [TRangoArray] of TRegistro;

	{Procedimiento Insertar alumnos en el registro}
	PROCEDURE InsertarAlumnoRegistro (VAR arrayRegistro: TArrayRegistro; contadorRegistros: Integer);
	VAR
		contador: Integer;
	BEGIN
		FOR contador:=1 TO contadorRegistros DO
		BEGIN
			readln(arrayRegistro[contador].Nombre);
			readln(arrayRegistro[contador].Apellido);
			readln(arrayRegistro[contador].NExpediente);
			readln(arrayRegistro[contador].Nota);	
			readln(arrayRegistro[contador].PruebaSuperada);
		END;
	END;
	

	{Procedimiento para ordenar los registros}
	PROCEDURE OrdenarRegistro (VAR arrayRegistro: TArrayRegistro; contadorRegistros: Integer);
	VAR
		i, j: Integer;
		registroAuxiliar: TRegistro;
	BEGIN
		FOR i:= 1 TO (contadorRegistros - 1) DO
		BEGIN
		 	FOR j:=i+1 TO contadorRegistros DO
		 	BEGIN
		 		IF (arrayRegistro[j].NExpediente < arrayRegistro[i].NExpediente) THEN 
		 		BEGIN	
			 		registroAuxiliar:= arrayRegistro[i];
			 		arrayRegistro[i]:= arrayRegistro[j];
			 		arrayRegistro[j]:= registroAuxiliar;
			 	END;
		 	END;
		END;
	END;
	{Procedimiento para mostrar los registros}
	PROCEDURE MostrarRegistro (arrayRegistro: TArrayRegistro; contadorRegistros: Integer);
	VAR
		contador: Integer;
	BEGIN
		FOR contador:=1 TO contadorRegistros DO
		BEGIN
			writeln;
			writeln(arrayRegistro[contador].Nombre);
			writeln(arrayRegistro[contador].Apellido);
			writeln(arrayRegistro[contador].NExpediente);
			writeln(arrayRegistro[contador].Nota:0:2);	
			IF (arrayRegistro[contador].PruebaSuperada = 's') OR (arrayRegistro[contador].PruebaSuperada = 'S')  THEN
			BEGIN
			 	writeln('Prueba superada');
			END
			ELSE
			BEGIN
			 	writeln('Prueba NO superada');
			END;
		END;
	END;
	
VAR 
	arrayRegistro: TArrayRegistro;
	contadorRegistros: Integer;

BEGIN
 	readln(contadorRegistros);
 	InsertarAlumnoRegistro(arrayRegistro, contadorRegistros);
 	OrdenarRegistro(arrayRegistro, contadorRegistros);
 	MostrarRegistro(arrayRegistro, contadorRegistros);
END.