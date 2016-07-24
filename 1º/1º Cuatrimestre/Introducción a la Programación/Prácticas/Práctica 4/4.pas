PROGRAM sumatorios;
VAR
	i, j, n, resultado: Integer;
BEGIN
	readln(n);
	resultado:= 0;
	FOR i:=1 TO n-1 DO
	BEGIN
		FOR j:=i+1 TO n DO
		BEGIN
			resultado:= resultado + sqr(i+j);
		END;
	END;		
	writeln(resultado);
END.