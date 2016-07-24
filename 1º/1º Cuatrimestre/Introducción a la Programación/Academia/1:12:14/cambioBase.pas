PROGRAM cambioBase;

FUNCTION Potencia (base: Integer; exponente: Integer): Integer;
BEGIN
	IF (exponente = 0) THEN 
	BEGIN
		Potencia:= 1;
	END
	ELSE 
	BEGIN
		Potencia:= base * Potencia(base, exponente - 1);
	END;
END;

FUNCTION Binario2Decimal (binario: Integer; pos: Integer): Integer;
VAR
	resto: Integer;
BEGIN
	IF (binario = 0) THEN 
	BEGIN
		Binario2Decimal:= 0;
	END
	ELSE 
	BEGIN
		resto:= binario MOD 10;
		IF (resto = 0) THEN 
		BEGIN
			Binario2Decimal:= Binario2Decimal(binario DIV 10, pos + 1);
		END
		ELSE 
		BEGIN
			 Binario2Decimal:= Potencia(2, pos) + Binario2Decimal(binario DIV 10, pos + 1);
		END;
	END;
END;

VAR
	num: Integer;
	
BEGIN
 	readln(num);
 	writeln(Binario2Decimal(num, 0));
END.