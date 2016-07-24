PROGRAM iniMatrix;
{Subprograma que lee una matriz completo}
CONST
	MIN_ROW = 1;
	MIN_COL = 1;
	MAX_ROW = 3;
	MAX_COL = 3;
TYPE
	TypeRankRows = MIN_ROW..MAX_ROW;
	TypeRankColumns = MIN_COL..MAX_COL;
	TypeMatrix = ARRAY [TypeRankRows, TypeRankColumns] of Integer;
VAR
	matrix: TypeMatrix;
	PROCEDURE InitializeMatrix (VAR matrix:TypeMatrix);
	VAR
		row, column: Integer;
	BEGIN
		FOR row:= MIN_ROW TO MAX_ROW DO
		BEGIN
			FOR column:= MIN_COL TO MAX_COL DO
			BEGIN
				readln(matrix[row][column]);
			END;
		END;
	END;
BEGIN
InitializeMatrix(matrix);
END.