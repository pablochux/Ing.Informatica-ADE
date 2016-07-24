PROGRAM testWrite;
{Programa que escribe un string borrando todo lo contenido en el archivo especificado}
VAR
	textFile: Text;
	myString: string;
BEGIN
	assign(textFile, 'ejemplo.txt');
	rewrite(textFile);
	read(myString);
	writeln(textFile, myString); 
	writeln(myString, ' ha sido escrito en el archivo.');
	close(textFile);
END.