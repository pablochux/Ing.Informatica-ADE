PROGRAM bookExample;
{Programa que lee un archivo txt y lo escribe por pantalla}
VAR
	textFile: Text;
	c: Char;
	number: Integer;

BEGIN
	assign(textFile, 'ejemplo.txt');
	reset(textFile);
	WHILE (NOT eof(textFile)) DO
	BEGIN
		readln(textFile, c, number);
		writeln(c,' ',number);
	END;
	close(textFile);
END.