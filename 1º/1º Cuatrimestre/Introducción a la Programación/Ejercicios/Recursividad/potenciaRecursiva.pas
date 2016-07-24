wPROGRAM PotenciaRecursiva;
{Subprograma recursivo para hacer una potencia}
VAR 
	base, exponente: Integer;
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
BEGIN
	readln(base);
	readln(exponente);
	writeln(Potencia(base, exponente)); 
END.