PROGRAM ej;
VAR
i: integer;

BEGIN
{i es el valor del contador para el bucle while}
i:= 1;
WHILE ( i <= 10) DO
BEGIN
	writeln('7 * ', i, ' = ', 7 * i);
	{Para evitar que no sea un bucle infinito}
	i:= i + 1;
	{También se puede usar el succ(i)}
END;
END.