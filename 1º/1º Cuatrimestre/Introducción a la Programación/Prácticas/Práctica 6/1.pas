PROGRAM primos;
VAR
	cantidadPrimos, contarPrimos, primo, i, esPrimo: Integer;
	
BEGIN
	readln(cantidadPrimos);
	contarPrimos:= 0;
	primo:= 2;
	WHILE (contarPrimos < cantidadPrimos) DO
	BEGIN
		esPrimo:= 0; 
		FOR i:=2 TO primo-1 DO
		BEGIN
			IF (primo MOD i = 0) THEN
			BEGIN
				esPrimo:= esPrimo + 1;
			END;
		END;
		IF (esPrimo = 0) THEN
		BEGIN
			writeln(primo);
			contarPrimos:= contarPrimos + 1;
		END;
		primo:= primo + 1;
	END;
END.