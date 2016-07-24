PROGRAM ejString;
{Programa que busca un caracter en un string}
VAR
	i: Integer;
	cadena: String;
	c: Char;
	encontrado: Boolean;
BEGIN
	readln(cadena);
	readln(c);
	encontrado:= false;
	i:= 1;
	{Se utiliza un while porque no se necesita completar todas las iteraciones}
	WHILE (NOT encontrado) AND (i <= length(cadena)) DO
	BEGIN
		{Si cadena[i]=c es false el valor de encontrado seguirá siendo false mientras que cuando sea verdadera su valor cambiará a true}
		encontrado:= cadena[i]=c;
		i:= i + 1;
	END;
	{IF para escribir si se ha encontrado o no se ha encontrado}
	IF (encontrado) THEN
	BEGIN
		writeln('El caracter ', c, ' se ha encontrado en el string ', cadena);
	END
	ELSE
	BEGIN
		writeln('El caracter ', c, ' no se ha encontrado en el string ', cadena);
	END
END.