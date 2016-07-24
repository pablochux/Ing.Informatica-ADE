PROGRAM arrayBidimensionalMatriz;

CONST 
	MIN = 1;
	MAX_FIL = 3;
	MAX_COL = 3;

TYPE
	TipoRangoFilas = MIN..MAX_FIL;
	TipoRangoColumnas = MIN..MAX_COL;
	TipoMatriz = ARRAY [TipoRangoFilas , TipoRangoColumnas] of Integer;

VAR
	matriz: TipoMatriz;
	fila, columna: integer;

BEGIN
	writeln('Escribe los valores de tu matriz: ');
	{Algoritmo para rellenar la matriz}
	{Se puede rellenar por filas o por columnas
	Se cambia MAX_COL por MAX_FIL e [i] por [j]
	}
	FOR fila:=MIN TO MAX_FIL DO
	BEGIN
		writeln('Fila ', fila);
		FOR columna:=MIN TO MAX_COL DO
		BEGIN
			writeln('Columna ', columna);
			readln(matriz[fila][columna]);
		END;
	END;

	FOR fila:=MIN TO MAX_FIL DO
	BEGIN
		{El writeln se puede poner antes o después del 2º bucle for}
		writeln();
		FOR columna:=MIN TO MAX_COL DO
		BEGIN
			write(matriz[fila][columna], '');
		END;
	END;
	{
	FOR fila:=MIN TO MAX_FIL DO
	BEGIN

		writeln();
		FOR columna:=MIN TO (MAX_COL - 1) DO
		BEGIN
			write(matriz[fila][columna], '');
		END;
		writeln(matriz[fila][MAX_COL]);
	END;
	}
END.