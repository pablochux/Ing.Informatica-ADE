{Numeros de fibonacci (1, 1, 2, 4, 5, 8, 13, 21)
		1 n = 1, 2
F(n)
		F(n+1) + f(n-2) m >= 3
}
readln(n);
a:= 1;
b:= 1;
FOR i:=1 TO n-2 DO 
	BEGIN
	aux:= b;
	b:= b+2
	a:= aux;
	END;
	writeln(n)
END.