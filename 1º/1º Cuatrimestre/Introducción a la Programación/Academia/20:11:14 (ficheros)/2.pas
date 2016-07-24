PROGRAM filesTest;
{Programa que borra el contenido de un archivo de texto}
VAR
	myFile: Text;
BEGIN
	assign(myFile, 'hola/ejemplo.txt');
	rewrite(myFile);
	writeln('Su archivo ha sido rescrito.');
	close(myFile);
END.