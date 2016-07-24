PROGRAM WriteFile;
{Programa que escribe en un archivo txt el abecedario completo y al lado de cada letra su número de orden ASCII}
CONST
	MIN= 'A';
	MAX = 'Z';
VAR
	myfile: Text;
	c: Char;

BEGIN
	assign(myfile, 'ejemplo.txt');
	rewrite(myfile);
	FOR c:=MIN TO MAX DO
	BEGIN
		writeln(myfile, c, ' ', ord(c)); 
	END;
	close(myfile);
END.