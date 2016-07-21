FUNCTION IsHigher (list: TypeList; element: Integer): Integer;
VAR
	found: Boolean;
	counter: Integer;

BEGIN
	found:= False;
	cont:= 1;
	WHILE (list <> NIL) AND (NOT found) DO
	BEGIN
		Encontrado:= (lista)
		IF (NOT Encontrado) THEN
		BEGIN
			counter:= counter + 1;
			lista:= list^.sig;
		END;
	END;
	IF (Encontrado) THEN
	BEGIN
		IsHigher:= counter;
	END
	ELSE 
	BEGIN
		IsHigher:= 0;
	END;
END;