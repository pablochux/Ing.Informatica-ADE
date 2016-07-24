PROGRAM P_multRecursiva;
{Multiplicacón recursiva}
VAR
x, y: Integer;
	FUNCTION multRecursiva (x: Integer; y: Integer): Integer;
	BEGIN
		IF (y = 1) THEN
		BEGIN
			multRecursiva:= x;
		END
		ELSE
		BEGIN
			multRecursiva:= x + multRecursiva(x, y - 1); 
		END;
	END;
BEGIN
	readln(x);
	readln(y);
	writeln(multRecursiva(x, y)); 
END.