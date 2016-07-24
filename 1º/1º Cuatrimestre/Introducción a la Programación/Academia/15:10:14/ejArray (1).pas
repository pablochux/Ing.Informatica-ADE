PROGRAM arrays;
CONST 
	MIN = 1;
	MAX = 10;

TYPE
	TipoRangoVector = MIN..MAX;
	TipoVector= ARRAY [TipoRangoVector] OF Integer;

VAR
	vector: TipoVector;
	i: Integer;

BEGIN
	{Bucle para iterar cada valor del array}
	FOR i:=MIN to MAX DO
	BEGIN
		write('vector[', i, '] = ');
		{Se lee y almacena el primer valor del array}
		readln(vector[i]);
	END;
	writeln('FIN DE INTRODUCCIÓN DE DATOS');
	{Bucle para imprimir los valores del array }
	FOR i:=MIN TO MAX DO
	BEGIN
		writeln('vector[', i, '] = ', vector[i]);
	END;
END.


