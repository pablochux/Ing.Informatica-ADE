{BIEN}
{Buscar si un elemento se encuentra repetido o no en una lista}
PROCEDURE Searh (list: TypeList; element: TypeData; VAR found: Boolean);
VAR
	auxListFinder: TypeList;

BEGIN
	auxListFinder:= list;
	WHILE (auxListFinder <> NIL) AND (NOT found) DO
	BEGIN
		found:= (auxListFinder^.info = element);
		auxListFinder:= auxListFinder^.next;
	END;
END;

FUNCTION FindDuplicates (list: TypeList): Boolean;
VAR
	auxList: TypeList;
	found: Boolean;
	element: TypeData;

BEGIN
	found:= false;
	auxList:= list;
	WHILE (NOT found) AND (auxList <> NIL) DO
	BEGIN
		element:= auxList^.info;
		Search(auxList^.next, element, found);
		IF (NOT Found) THEN
		BEGIN 
			auxList:= auxList^.next;
		END;
	END;
	FindDuplicates:= found;
END;