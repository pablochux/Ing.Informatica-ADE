{Potencia de un número b perteneciente a R y n perteneciente N}
PROGRAM programPotencia;
VAR
	{b es la base de la potencia}
	b: real;
	{n es el exponente de la potencia}
	n, i: integer;
	{resultado es la variable utilizada para guardar el resultado}
	resultado: integer;
BEGIN
	readln(b, n);
	resultado:= 1;
	{Bucle que multiplica un número por si mismo b veces}
	FOR i:=1 to b DO
	BEGIN
		resultado:= resultado * n;
	END
	writeln(resultado); 
END.