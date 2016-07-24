PROGRAM ejString;
{Programa que busca un caracter en un string y te devuelve si lo ha encontrado y la posición en la que lo ha encontrado}
VAR
	i: Integer;
	cadena: String;
	n: Char;
	encontrado: Boolean;
BEGIN
	readln(cadena);
	readln(n);
	encontrado:= false;
	i:= 1;
	{Se utiliza un while porque no se necesita completar todas las iteraciones}
	WHILE (NOT encontrado) AND (i <= length(cadena)) DO
	BEGIN
		{Forma mala}
		IF (cadena[i] = n) THEN
		BEGIN
			encontrado:= true;
		END;
		i:= i + 1;
	END;
	{IF para escribir si se ha encontrado o no se ha encontrado}
	IF (encontrado) THEN
	BEGIN
		writeln('El caracter ', n, ' se ha encontrado en el string ', cadena, ' y en la posición ', (i - 1));
	END
	ELSE
	BEGIN
		writeln('El caracter ', n, ' no se ha encontrado en el string ', cadena);
	END
END.