{Comprobar si una mitad es igual a la otra de un array}
FUNCTION mitades (vector: Tvector): Boolean;
VAR
	es: Boolean;
	mitad: Integer;
BEGIN	
	mitad:= (1 + MAX) DIV 2;
	es: TRUE;
	i:= 1;
	{para hallar la mitad de un array se suma el primer numero y }
	WHILE (es) AND (cont <= 200) DO
	BEGIN
		es:= vector[cont] = vector[cont + mitad];
		cont:= cont + 1;
	END;
END;