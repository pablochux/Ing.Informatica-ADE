PROGRAM testWrite;
{Programa que escribe un caracter borrando todo lo contenido en el archivo especificado}
VAR
	textFile: Text;
	myString, answer: String;
BEGIN
	assign(textFile, 'ejemplo.txt');
	rewrite(textFile);
	REPEAT
	BEGIN
		write('Escribe la palabra que deseas introducir en el archivo: ');
		readln(myString);
		writeln('Como quieres que se muestre el texto: ¿en la misma línea o en una nueva?');
		readln(answer);
		IF (answer = 'en la misma linea') THEN
		BEGIN
			writeln(textFile, myString); 
		END
		ELSE IF (answer = 'en una nueva') THEN
		BEGIN
			write(textFile, myString); 
		END;
		writeln('¿Quieres seguir introduciendo texto?');
		readln(myString);
	END;
	UNTIL (myString = 'No');
	close(textFile);
END.