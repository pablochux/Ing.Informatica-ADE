PROGRAM maxArray;
{Programa que busca el valor máximo dentro de un array}
CONST 
	MIN = 1;
	MAX = 10;

TYPE
	TipoRangoVector = MIN..MAX;
	TipoVector= ARRAY [TipoRangoVector] OF Integer;

VAR
	vector: TipoVector;
	i: Integer;
	maxValue: integer;

BEGIN
	FOR i:=MIN to MAX DO
	BEGIN
		write('vector[', i, '] = ');
		readln(vector[i]);
	END;
	maxValue:= vector[MIN];
	FOR i:=succ(MIN) TO MAX DO
	BEGIN
		IF (vector[i] > maxValue) THEN
		BEGIN
			maxValue:= vector[i];
		END;
	END;
	writeln(maxValue);
END.