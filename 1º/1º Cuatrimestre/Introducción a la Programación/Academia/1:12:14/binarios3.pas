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
 		writeln('Pos = ', filepos(fichero));
 		write(fichero, i);
 	END;
 	close(fichero);
 	{$I-}
 	reset(fichero);
 	{$I+}
 	IF (IOResult = 0) THEN
 	BEGIN
 		seek(fichero, filesize(fichero));
 		FOR i:=11 TO 20 DO
 		BEGIN
 			write(fichero, i);
 		END;
 		close(fichero);
 	END;
END.