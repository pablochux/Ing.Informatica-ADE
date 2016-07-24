{Factorial de un número}
PROGRAM factorial;
VAR
	f, n: integer;
BEGIN
	readln(f);
	n:= 1;
	{AL usar while se empieza desde el número elegido y se va bajando}
	WHILE (f <> 0) DO 
	BEGIN
		n:= f * n;
		f:= f - 1;
	END;
	writeln(n);
END.