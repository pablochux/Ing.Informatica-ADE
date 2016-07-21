{Encontrar si hay un número mayor que element dentro de una }
FUNCTION FindHigherNumber (list: TypeList; number: TypeData): Integer;
VAR
	counter: Integer;

BEGIN
	counter:= 0;
	WHILE (list <> NIL) DO
	BEGIN
		IF (list^.info > number) THEN 
		BEGIN
			list:= NIL;
		END
		ELSE 
		BEGIN
			list:= auxLista^.next;
			counter:= counter + 1;
		END;
	END;
	FindHigherNumber:= counter;
END;