FUNCTION ShowLastElement (list1: TypeList): Integer ;
VAR
	auxList: TypeList;

BEGIN
	auxList:= list1;
	IF (auxList <> NIL) THEN
	BEGIN 
		WHILE (auxList^.next <> NIL) DO
		BEGIN
			auxList:= auxList^.next;
		END;
		ShowLastElement:= auxList^.info;
	END; {No se pone ninguna condición else porque da igual lo que de si la lista. No es nuestro problema}
END;