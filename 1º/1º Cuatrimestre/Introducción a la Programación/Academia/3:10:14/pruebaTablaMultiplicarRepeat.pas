{Programa que imprima sobre la pantalla la tabla de multiplicar de 7 desde 1 hasta 10}
PROGRAM ej;
VAR
i: integer;
BEGIN
{i es el valor del contador para el bucle}
i:= 1;
REPEAT 
BEGIN
	writeln('7 * ', i, ' = ', 7 * i);
	i:= i + 1;
	{Para evitar que no sea un bucle infinito se incrementa la variable contadora. También se puede usar el succ(i)}
END
UNTIL ( i > 10 );
END.