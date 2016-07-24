PROGRAM WriteFile;
{Programa que destuye el contenido de un txt y escribe el caracter que el usuario introduzca por pantalla}
VAR
	myfile: Text;
	c: Char
BEGIN
	assign(myfile, 'ejemplo.txt');
	rewrite(myfile);
	write('¿Qué caracter quieres escribir?');
	readln(c);
	write(myfile, c)
END.