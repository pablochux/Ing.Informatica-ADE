PROCEDURE DeleteNFromList (VAR list: TypeList; number: Integer);
VAR
	auxList: TypeList;

BEGIN
	WHILE (list <> NIL) AND (number > 0) DO
	BEGIN
		auxList:= list;		
		list:=list^.next;
		dispose(auxList);
		number:= number - 1;
	END;
END;

{Modificación para que diga la cantidad de elementos que se han eliminado}

PROCEDURE DeleteNFromList (VAR list: TypeList; number: Integer);
VAR
	auxList: TypeList;
	auxNumber: Integer;

BEGIN
	auxNumber:= number;
	WHILE (list <> NIL) AND (number > 0) DO
	BEGIN
		auxList:= list;		
		list:=list^.next;
		dispose(auxList);
		number:= number - 1;
	END;
	IF (number = 0) THEN
	BEGIN
		writeln('Se han eliminado ', number ,' nodos (todos los nodos)');
	END
	ELSE 
	BEGIN
		writeln('No se han podido eliminar todos los nodos, solo se han podido eliminar ', auxNumber - number);
	END;
END;