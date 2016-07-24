{Dado un número entero, se pide hallar un subprograma que sume sus cifras pares}
FUNCTION SumarCifrasPares (num: Integer): Integer;
BEGIN
	{Si el número tiene un digito}
	IF (num < 10) THEN
	BEGIN
		{Si es par}
		IF (num MOD 2 = 0) THEN
		BEGIN
			SumarCifrasPares:= num; 
		END
		ELSE
		BEGIN
			SumarCifrasPares:= 0; 
		END;
	END
	ELSE
	BEGIN
		{Si el último digito de num es par, se suma el número y se llama a la función quitando el último dígito}
		IF ((num MOD 10) mod 2 = 0) THEN
		BEGIN
			{Como es una función, se la llama asignandola}	
		 	SumarCifrasPares:= (num MOD 10) + SumarCifrasPares(num DIV 10); 
		END
		{Si no es par se llama a la función quitandole un digito}
		ELSE
		BEGIN
		 	SumarCifrasPares:= SumarCifrasPares(num DIV 10); 
		END; 
	END;
END;
VAR
	num: Integer;
