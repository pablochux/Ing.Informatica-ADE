{Potencia de un número b perteneciente a R y n perteneciente N.}
PROGRAM programPotencia;
VAR
	{n es el exponente de la potencia}
	n: real;
	{b es la base de la potencia}
	b: integer;
	{p es el resultado de la operación}
	p: integer;
BEGIN
	readln(b, n);
	p:= 1;
	{Cuando el bucle llegue a 0 se habrá realizado el bucle tantas veces como la potencia}
	WHILE n > 0 DO
	BEGIN
		{Se multiplica al resultado por la base de la potencia}	
		p:= p * b;
		{Se le resta 1 cada vez que el bucle itera (cada vez que se multiplica)}
		n:= n-1;
	END;
	writeln(p); 
END.