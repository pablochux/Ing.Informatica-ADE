PROCEDURE FirstTail (tail: TypeTail; VAR element: TypeElement);
BEGIN
	IF (NOT(tail = NIL)) THEN
	BEGIN
		element:= tail^.next^.info;
		{Cuando estamos en el TAD cola podemos hacer una operacion := sobre un tipo elemento o debemos utilizar asignar. Por que?}
	END;
END;