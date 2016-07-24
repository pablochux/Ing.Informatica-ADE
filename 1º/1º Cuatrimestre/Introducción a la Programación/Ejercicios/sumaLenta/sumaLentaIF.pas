{Sumar dos números no negativos donde solo podemos usar incrementos y decrementos (de una unidad) y no se puede usar el operador +}
{Solución se va restando uno y se va sumando uno al otro}
PROGRAM sumalenta;
VAR
	{La variable aux se utiliza para cambiar los valores de las variables}
	x, y, aux: integer;
	
BEGIN
	readln(x, y);
	{Para evitar que el primer número sea inferior y por lo tanto no funcione el programa se utiliza un IF que valora el número mayor y lo pone como x}
	IF (x > y) THEN
	BEGIN
		aux:= x;
		x:= y;
		y:= aux;
	END
	{Por cada iteración del bucle se le resta una unidad al primer número y se le suma una unidad al segundo}
	WHILE a > 0 DO
	BEGIN
		a:=a - 1;
		b:=b + 1;
	END;
	writeln(b);
END.