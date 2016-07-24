PROGRAM pdeterminante;
CONST
	MIN = 1;
	MAX = 3;

TYPE
	TipoFilaColumna = MIN..MAX;
	TipoArray = ARRAY [TipoFilaColumna, TipoFilaColumna] of real;

VAR
	matriz: TipoArray;
	fila, columna: Integer;
	determinante: Real;

BEGIN
	FOR fila:=MIN TO MAX DO
	BEGIN
		FOR columna:=MIN TO MAX DO
		BEGIN
			read(matriz[fila][columna]);
		END;
	END;
	determinante:= (matriz[1][1] * matriz[2][2] * matriz[3][3]) + (matriz[1][3] * matriz[2][1] * matriz[3][2]) + (matriz[3][1] * matriz[1][2] * matriz[2][3]) - (matriz[1][3] * matriz[2][2] * matriz[3][1]) - (matriz[1][2] * matriz[2][1] * matriz[3][3]) - (matriz[1][1] * matriz[2][3] * matriz[3][2]);
	writeln(determinante:0:3);
END.