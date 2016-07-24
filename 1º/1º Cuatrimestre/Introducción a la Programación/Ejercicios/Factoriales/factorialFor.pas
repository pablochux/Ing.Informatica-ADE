{Factorial de un número}
PROGRAM factorialFor;
VAR
	f, n, i: integer;
BEGIN
	readln(n);
	f:= 1;
	{Al usar la instrucción FOR se empieza "por debajo" hasta llegar a n}
	FOR i:= 1 TO n DO
	BEGIN
		f:= f * i;
	END;
	writeln(f);
END.