PROGRAM par;
{Dado un número entero, se pide hallar un subprograma que sume sus cifras pares}
FUNCTION SumarCifrasPares (num: Integer): Integer;
VAR
	cifra: Integer;
BEGIN
	IF (num = 0) THEN
	BEGIN
		SumarCifrasPares:= 0; 
	END
	ELSE
	BEGIN
		cifra:= num mod 10;
		IF (cifra mod 2 = 0) THEN
		BEGIN
		 	SumarCifrasPares:= cifra + SumarCifrasPares(num DIV 10); 
		END
		ELSE
		BEGIN
		 	SumarCifrasPares(num DIV 10); 
		END; 
	END;
END;