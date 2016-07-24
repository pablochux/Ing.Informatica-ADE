PROGRAM p4;
FUNCTION BucleRecursivo (numero: Integer): Integer;
VAR
	auxiliar, contador: Integer;
BEGIN
	auxiliar:= 1;
	IF (numero = 1) OR (numero = 2) THEN
	BEGIN
	 	BucleRecursivo:= 1;
	END
	ELSE IF (numero >= 3) THEN 
	BEGIN
		FOR contador:=1 TO (numero-2) DO
		BEGIN
			auxiliar:= auxiliar + BucleRecursivo(contador);
			BucleRecursivo:= auxiliar;
		END;
	END;
END;
VAR
	numero: Integer;

BEGIN
	readln(numero);
	writeln(BucleRecursivo(numero));
END.