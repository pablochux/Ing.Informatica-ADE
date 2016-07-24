PROGRAM arrayMatriz;
CONST
	MIN = 1;
	MAX_COL = 2;
	MAX_FIL = 2;

TYPE
	TipoMatrizFilas = MIN..MAX_FIL;
	TipoMatrizColumnas = MIN..MAX_COL;
	TipoMatriz = ARRAY [TipoMatrizFilas , TipoMatrizColumnas] of Integer;

VAR
	matriz: TipoMatriz;
	i, j: integer;

BEGIN
	writeln('Inicio del programa.');
	writeln('Introduce los valores del array: ');
	{Algoritmo para rellenar el array}
	FOR i:=MIN TO MAX_COL DO
	BEGIN
		FOR j:=MIN TO MAX_FIL DO
		BEGIN
			readln(matriz[i][j]);
		END;
	END;
	writeln('Has terminado de introducir los datos de la matriz.');
	{Algoritmo para imprimir el array en pantalla}
	FOR i:=MIN TO MAX_COL DO
	BEGIN
		FOR j:=MIN TO MAX_FIL DO
		BEGIN
			write(matriz[i][j], ' ');
		END;
		IF ( j = MAX_FIL) THEN
		BEGIN
			writeln();
		END;
	END;
	
END.
