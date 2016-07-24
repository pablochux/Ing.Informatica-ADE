{Sumar dos números no negativos donde solo podemos usar incrementos y decrementos (de una unidad) y no se puede usar el operador +}
{Solución se va restando uno y se va sumando uno al otro}
PROGRAM sumalenta;
VAR
	x, y, i: integer;
BEGIN
	readln(x, y);
	{Bucle FOR con x iteraciones}
	{El bucle llega hasta el primer número y en cada iteración se le suma una unidad al segundo. Habrá x iteraciones}
	{Si el bucle fuera hasta y no funcionaría porque no habría iteraciones suficientes}
	FOR i:= 1 TO x DO
	BEGIN
		y:= y + 1;
	END;
	writeln(y);
END.