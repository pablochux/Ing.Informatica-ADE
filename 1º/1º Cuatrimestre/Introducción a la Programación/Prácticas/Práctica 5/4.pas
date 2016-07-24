PROGRAM traspuesta;
CONST
	MIN = 1;
	PRUEBA = 2;
	MAX = 10;

TYPE
	TipoFilaColumna = 1..10;
	TipoArray = ARRAY [TipoFilaColumna, TipoFilaColumna] of Real;

VAR
	matriz: TipoArray;
	fila, columna, numMatriz: Integer;

BEGIN
	readln(numMatriz);
	FOR fila:=MIN TO numMatriz DO
	BEGIN
		FOR columna:=MIN TO numMatriz DO
		BEGIN
			read(matriz[fila][columna]);
		END;
	END;

	FOR fila:=MIN TO numMatriz DO
	BEGIN
		FOR columna:=MIN TO (numMatriz ) DO
		BEGIN
			IF (columna <> numMatriz) THEN
			BEGIN
				write(matriz[columna][fila]:6:2, ' ');
			END
			ELSE
			BEGIN
				write(matriz[columna][fila]:6:2);
			END
		END;
		writeln();
	END;

END.