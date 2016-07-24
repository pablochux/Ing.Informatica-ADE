PROGRAM entero;
VAR
	x, cociente, contador: integer;
BEGIN
	readln(x);
	IF (x>0) THEN
	BEGIN
		cociente:=x;
		contador:=0;
		WHILE (cociente <> 0) DO
		BEGIN
			contador:= contador + 1;
			cociente:= cociente DIV 10;
		END;
	writeln(contador);
	END;
END.