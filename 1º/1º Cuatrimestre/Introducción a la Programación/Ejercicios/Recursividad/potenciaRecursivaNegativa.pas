PROGRAM PotenciaRecursiva;
{Subprograma recursivo para hacer una potencia negativa}
VAR 
	base: Real;
	exponente: Integer;
	FUNCTION Potencia (base: real; exponente: Integer): real;
	BEGIN
		IF (exponente = 0) THEN
		BEGIN
		 	Potencia:= 1;
		END
		ELSE IF (exponente > 0) THEN
		BEGIN
			Potencia:= base * Potencia(base, exponente - 1); 
		END
		ELSE
		BEGIN
			Potencia:= base * Potencia(1 / base, -exponente) / base;
		END;
	END;
BEGIN
	readln(base);
	readln(exponente);
	writeln(Potencia(base, exponente):0:5); 
END.