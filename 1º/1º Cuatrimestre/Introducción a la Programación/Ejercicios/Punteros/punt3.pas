PROGRAM P_punteros;
TYPE
	tipoArray = ARRAY [1..5] of Integer;
	tipoPuntero = ^tipoArray;

VAR
	punteroArray, aux: tipoPuntero;
	i, j: Integer;
BEGIN
	New(punteroArray);
	FOR i:=1 TO 5 DO
	BEGIN
		readln(punteroArray^[i]); 
	END;
	writeln('Array relleno');
	FOR i:=1 TO 5 DO
	BEGIN
		writeln(punteroArray^[i]); 
	END;
	writeln('Inicio de ordenación');
	FOR i:=5 TO 2 DO
	BEGIN
		FOR j:=1 TO (i-1) DO
		BEGIN
		 	IF (punteroArray^[j] > punteroArray^[j+1]) THEN
		 	BEGIN
		 		aux:= punteroArray[j];
		 		punteroArray[j]:= punteroArray[j+1];
		 		punteroArray[j+1]:= aux;
		 	END;
		END; 
	END;
	writeln('Fin de ordenación');
	FOR i:=1 TO 5 DO
	BEGIN
		writeln(punteroArray^[i]); 
	END;
	dispose(punteroArray);
END.