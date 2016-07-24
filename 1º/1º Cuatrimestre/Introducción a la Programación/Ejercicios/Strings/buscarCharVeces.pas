PROGRAM ejString;
{Programa que busca un caracter en un string y dice si se ha encontrado y la cantidad de veces que se ha encontrado.}
VAR
	i, veces: Integer;
	cadena: String;
	c: Char;

BEGIN
	readln(cadena);
	readln(c);
	veces:= 0;
	{Como se tiene que buscar en todas las posiciones se utiliza un FOR}
	FOR i:=1 TO (length(cadena)) DO
	BEGIN
		IF (cadena[i] = c) THEN
		BEGIN
		veces:= veces + 1;
		END;
	END;
	writeln('El caracter ', c, ' se ha encontrado en el string ', veces, ' veces.');
END.