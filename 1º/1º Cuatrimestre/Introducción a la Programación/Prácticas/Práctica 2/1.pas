PROGRAM potencia;
VAR
b, x, res: real;
BEGIN
	readln(b, x);
	res:= exp(x*ln(b));
	writeln(res:0:4);
END.