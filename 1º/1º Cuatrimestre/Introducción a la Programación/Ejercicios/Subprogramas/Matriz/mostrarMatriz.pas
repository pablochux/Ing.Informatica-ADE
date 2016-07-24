{Subprograma que muestra una matriz}
{En la sección VAR}
	vector: TipoMatrix;
	PROCEDURE DisplayArray (VAR vector:TypeMatrix);
	VAR
		row, column: Integer;
	BEGIN
		FOR row:=MIN_ROW TO MAX_ROW DO
		BEGIN
			FOR column:=MIN_COL TO (MAX_COL - 1) DO
			BEGIN
				write(matrix[row][column], ' ');
			END;
			writeln(matrix[row][MAX_COL]);
		END;
	END;
{En el programa principal}
DisplayMatrix(vector);
