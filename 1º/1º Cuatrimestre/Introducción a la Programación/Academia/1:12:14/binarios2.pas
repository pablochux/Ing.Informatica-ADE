PROGRAM archivosBinarios;
 
TYPE
	TipoFichero = FILE OF Integer;
	TipoPersona = RECORD
		nombre: String;
		apellidos: String;
		edad: Integer;
	END;
	TipoFicheroPersonas = FILE OF TipoPersona;

VAR
	fichero: TipoFichero;
	i, num: Integer;
	
BEGIN
 	assign(fichero, 'enteros.dat');
 	rewrite(fichero);
 	FOR i:=1 TO 10 DO
 	BEGIN
 		writeln(filepos(fichero));
 		write(fichero, i);
 	END;
 	close(fichero);
 	{$I-}
 	reset(fichero);
 	{$I+}
 	IF (IOResult = 0) THEN
 	BEGIN
 		WHILE (NOT EOF(fichero)) DO
 		BEGIN
 			read(fichero, i);
 			writeln('I: ', i);
 		END;
 	END;
 	close(fichero);
END.