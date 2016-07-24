{Programa que imprima en la consola la tabla de multiplicar de 7}
PROGRAM ej;
VAR
i: integer;

BEGIN
{i es el valor del contador para el bucle while}
i:= 1;
FOR i:= 1 TO 10 DO
BEGIN
	writeln('7 * ', i, ' = ', 7 * i);
	{Para evitar que no sea un bucle infinito}
END;



END.