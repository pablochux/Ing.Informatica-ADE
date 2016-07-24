PROGRAM ReadTextFile;
{Programa que lee un archivo txt caracter a caracter y lo muestra por pantalla. Si ha habido un error al leer el archivo muestra un aviso}
VAR
	myTextFile: Text;
	c: Char;
BEGIN
	assign(myTextFile, 'mevameva.txt');
	{$I-}
	reset(myTextFile);
	{$I-}
	IF (IOResult = 0) THEN
	BEGIN
		WHILE (NOT eof(myTextFile)) DO
		BEGIN
		 	 IF (eoln(myTextFile)) THEN
		 	 BEGIN
		 	 	readln(myTextFile); 
		 	 	writeln;
		 	END
		 	ELSE
		 	BEGIN
		 		read(myTextFile, c);
		 		write(c);
		 	END;
		END; 
		writeln();
		close(myTextFile);
	END
	ELSE
	BEGIN
		writeln('Ha habido un error leyendo el myTextFile.'); 
	END;
	
END.