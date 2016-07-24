PROGRAM testWrite;
{Programa que escribe un caracter borrando todo lo contenido en el archivo especificado}
VAR
	textFile: Text;
	c: char;
BEGIN
	assign(textFile, 'ejemplo.txt');
	rewrite(textFile);
	read(c);
	writeln(textFile, c); 
	close(textFile);
END.