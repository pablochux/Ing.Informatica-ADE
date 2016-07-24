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
	i, j, num, long: Integer;

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
 		FOR j:=0 TO filesize(fichero) DO
 		BEGIN
 			read(fichero, num);
 			writeln(num + 1);
 		END;
 		close(fichero);
 	END;
END.