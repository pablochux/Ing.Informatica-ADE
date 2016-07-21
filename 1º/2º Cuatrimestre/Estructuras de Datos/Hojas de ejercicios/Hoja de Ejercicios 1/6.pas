{No elimina los nodos}
FUNCTION CountNodes (list1: TypeList): Integer;
VAR
	auxList: TypeList;
	counter: Integer;

BEGIN
	auxList:= list1;
	counter:= 0;
	WHILE (auxList <> NIL) DO
	BEGIN
		counter:= counter + 1;
		auxList:= auxList^.next;
	END;
	CountNodes:= counter;
END;

PROCEDURE NLastElements (list1: TypeList; number: Integer; VAR list2: TypeList);
VAR
	auxPointerList: TypeList;
	counter: Integer;

BEGIN
	counter:= CountNodes(list1) - number;
	auxPointerList:= list1;
	auxDeleterList:= list1;
	WHILE (auxPointerList <> NIL) AND (counter > 0) DO
	BEGIN
		auxPointerList:= auxPointerList^.next;
		counter:= counter - 1;
		dispose(auxDeleterList);
		auxDeleterList:= auxPointerList;
	END;
	list2:= auxPointerList;
END;

