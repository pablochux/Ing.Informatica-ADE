PROGRAM encuentracharenstring;
{Programa que busca un caracter dentro de un string}
VAR
	i, longitud: Integer;
	cadena: String;
	n: Char;
	encontrado: Boolean;
BEGIN
	readln(cadena);
	readln(n);
	encontrado:= false;
	{variable contadora}
	i:= 1;

	{Se utiliza un while porque no se necesita completar todas las iteraciones, en el caso que se encuentre no hay que realizar las demás iteraciones}
	WHILE (NOT encontrado) AND (i <= length(cadena)) DO
	BEGIN
		IF (cadena[i] = n) THEN
		BEGIN
			encontrado:= true;
		END;
		i:= i + 1;
	END;
	
	{IF para escribir si se ha encontrado o no se ha encontrado}
	IF (encontrado) THEN
	BEGIN
		writeln('El caracter ', n, ' se ha encontrado en el string ', cadena);
	END
	ELSE
	BEGIN
		writeln('El caracter ', n, ' no se ha encontrado en el string ', cadena);
	END
END.