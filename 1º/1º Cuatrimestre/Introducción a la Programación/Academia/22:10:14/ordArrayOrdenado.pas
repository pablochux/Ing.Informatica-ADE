PROGRAM ordenarArrays;
{Búsqueda en un array ya ordenado}
CONST
	MAX = 10;
	MIN = 1;

TYPE
	TipoRangoArray = MIN..MAX;
	TipoArray = ARRAY [TipoRangoArray] of Integer;

VAR
	array1: TipoArray;
	ini, fin, mitad: Integer;
	encontrado: Boolean;

BEGIN
	{La mitad del array se halla: (inicioArray + finArray) DIV 2	
	La mitad del array será exacta si es un número impar pero no lo será si es un número par}
	readln(n);
	ini:= MIN;
	fin:= MAX;
	encontrado:= false;
	WHILE (NOT encontrado) AND (ini <= fin)
	BEGIN
		mitad:= (ini + fin) DIV 2;
		IF (vector[mitad]) THEN
		BEGIN
			encontrado:= true;
		END
		ELSE
		BEGIN
			IF ( n < array1[mitad]) THEN
			BEGIN
				fin: mitad - 1;
			END
			ELSE
			BEGIN
				ini:= mitad + 1;
			END;
 		END;
	END;


	IF (ini > fin ) THEN
	BEGIN
	END;
	{
	mitad:= (inicioArray + inArray) DIV 2;
	
IF (array1[mitad] = num) THEN

	si vas para la derecha se actualiza el valor ini a ini + 1. Si se va hacia la izquierda se actualiza el valor fin a fin - 1
	fin:= mitad - 1;
	ini:= mitad + 1;}

	
END.