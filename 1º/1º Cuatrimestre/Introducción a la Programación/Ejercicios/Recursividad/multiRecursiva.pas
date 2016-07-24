PROGRAM multiplicacionRecursiva;
{Multiplicación recursiva}
VAR
	x, n: Integer;
	FUNCTION Ejemplo(x: Integer; n: Integer): Integer;
	BEGIN
		IF (n = 0) THEN
		BEGIN
			Ejemplo:= 0; 
		END
		ELSE IF (n > 0) THEN
		BEGIN
			Ejemplo:= x + Ejemplo(x, n-1); 
		END;
	END;
BEGIN
	 readln(x);
	 readln(n);
	 writeln(Ejemplo(x, n));
END.