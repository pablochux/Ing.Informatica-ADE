{Sumar dos números no negativos donde solo podemos usar incrementos y decrementos (de una unidad) y no se puede usar el operador +}
{Solución se va restando uno y se va sumando uno al otro}
PROGRAM sumalenta;
VAR
	x, y, i: integer;
BEGIN
	readln(x, y);
	{Bucle for con x iteracciones}
	FOR i:= x DOWNTO 1 DO
	BEGIN
		y:= y + 1;
		writeln(y);
	END;
	writeln(y);
END.