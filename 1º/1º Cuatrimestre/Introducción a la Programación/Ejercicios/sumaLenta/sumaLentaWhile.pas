{Sumar dos números no negativos donde solo podemos usar incrementos y decrementos (de una unidad) y no se puede usar el operador +}
{Solución se va restando uno y se va sumando uno al otro}
PROGRAM sumalenta;
VAR
	x, y: integer;
BEGIN
	readln(x, y);
	{Por cada iteración del bucle se le resta una unidad al primer número y se le suma una unidad al segundo}
	WHILE x > 0 DO
	BEGIN
		x:= x - 1;
		y:= y + 1;
	END;
	writeln(y);
END.