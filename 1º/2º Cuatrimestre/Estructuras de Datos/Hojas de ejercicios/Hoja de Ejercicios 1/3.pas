PROCEDURE InitialiceList (VAR list: TypeList);
BEGIN
	list:= NIL;
END;

PROCEDURE ConcatLists (list1: TypeList; list2: TypeList; VAR finalList: TypeList);
VAR
	auxList: TypeList;
	i: Integer;

BEGIN
	InitialiceList(finalList);
	auxList:= list1; {En la primera iteración del bucle rellena finalList con list1}
	FOR i:=1 TO 2 DO
	BEGIN
		WHILE (auxList <> NIL) DO
		BEGIN
			InsertNodeInList(auxList^.info, finalList);
			auxList:= auxList^.next;
		END;
		auxList:= list2; {En el segundo recorrido del buclle rellena finalList con list2}
	END;
	finalList:= list1;
END;