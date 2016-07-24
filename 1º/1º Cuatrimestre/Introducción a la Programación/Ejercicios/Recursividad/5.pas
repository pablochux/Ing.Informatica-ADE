PROGRAM hola;
{Número en digitos binarios
Binario f(n) n
0		1	0
1		1	1
10		2	2	
11		2	3
100		3	4
.		.	.
1000	4	8	

}
VAR
	n:Integer;
	FUNCTION Ejemplo (n: Integer): Integer;
	BEGIN
		IF (n < 2) THEN
		BEGIN
			Ejemplo:= 1; 
		END
		ELSE IF (n >= 2) THEN
		BEGIN
			Ejemplo:=(1 + Ejemplo(n div 2));
		END;
	END;
BEGIN
	readln(n);
	writeln(Ejemplo(n)); 
END.
