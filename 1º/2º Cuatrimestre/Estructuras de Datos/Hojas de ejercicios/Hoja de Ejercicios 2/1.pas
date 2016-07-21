{MAL}
{Borrar todas las apariciones de un número}
PROCEDURE CountNumAppears (list: TypeList; number: TypeData; VAR counter: Integer);
VAR
	auxList: TypeList;

BEGIN
	counter:= 0;
	auxList:= list;
	WHILE (auxList <> NIL) DO
	BEGIN
		IF (auxList^.info = number) THEN
		BEGIN
			counter:= counter + 1;
		END;
		auxList:= auxList^.next;
	END;
END;

PROCEDURE DeleteNode (currentPointerList, previousPointerList: TypeList);
BEGIN
	previousPointerList^.next:= currentPointerList^.next;
	dispose(currentPointerList);
END;

PROCEDURE DeleteAllAppearances (list: TypeList; number: TypeData);
VAR
	counter: Integer;
	auxCurrentList, auxPreviousList:= TypeList;

BEGIN
	CountNumAppears(list, number, counter);
	auxList:= list;
	auxPreviousList:= NIL;
	WHILE (counter > 0) DO
	BEGIN
		IF (auxList^.info = number) THEN 
		BEGIN
			DeleteNode(auxCurrentList, auxPreviousList);
			counter:= counter - 1;
		END;
		auxPreviousList:=auxCurrentList;
		auxCurrentList:= auxCurrentList^.next;
	END;
END;

{Forma 2}

PROCEDURE DeleteAllAppearances (list: TypeList; number: TypeData);
VAR
	auxCurrentList, auxPreviousList: TypeList;

BEGIN
	auxCurrentList:= list;
	auxPreviousList:= NIL;
	WHILE (auxCurrentList <> NIL) DO
	BEGIN
		IF (auxCurrentList^.info = number) THEN 
		BEGIN
			DeleteNode(auxCurrentList, auxPreviousList);
		END;
	END;
END;