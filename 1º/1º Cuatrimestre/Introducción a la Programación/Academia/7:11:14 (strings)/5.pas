PROGRAM ejString;
VAR
	i, longitud, veces: Integer;
	cadena: String;
BEGIN
	readln(cadena);
	veces:= 0;
	{Como se tiene que buscar en todas las posiciones se utiliza un FOR}
	FOR i:=1 TO (length(cadena)) DO
	BEGIN
		IF (cadena[i] = 'a') OR (cadena[i] = 'A') THEN
		BEGIN
			veces:= veces + 1;
		END;
	END;
	writeln('El caracter ', c, ' se ha encontrado en el string ', veces, ' veces.');
END.