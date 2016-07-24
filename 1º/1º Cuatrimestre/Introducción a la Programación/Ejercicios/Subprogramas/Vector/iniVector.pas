PROGRAM iniArray;
{Subprograma que lee un array completo}
CONST
	MIN = 1;
	MAX = 3;
TYPE
	TipoRangoArray = MIN..MAX;
	TipoArray = ARRAY [TipoRangoArray] of Integer;

VAR
	vector: TipoArray;
	PROCEDURE InitializeArray (VAR vector:TipoArray);
	VAR
		i: Integer;
	BEGIN
		FOR i:= MIN TO MAX DO
		BEGIN
			readln(vector[i]);
		END;
	END;
BEGIN
InitializeArray(vector);
END.