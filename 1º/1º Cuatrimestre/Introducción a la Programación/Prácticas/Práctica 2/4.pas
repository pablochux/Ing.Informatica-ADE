PROGRAM grados;
VAR
	T, C: real;
BEGIN
	readln(T);
	C:= (T - 32) * (5/9);
	writeln(C:8:3);
END.