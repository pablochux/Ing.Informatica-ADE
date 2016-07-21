FUNCTION Pertenece (element: TypeElement; list: TypeList): Boolean;
VAR
	found: Boolean;

BEGIN
	WHILE (list <> NIL) DO
	BEGIN
		found:= (list^.info = element);
	END;
	Pertenece:= found;
END;

FUNCTION AreRepeats (list: TypeList): Boolean;
VAR
	found: Boolean;

BEGIN
	found:= false;
	WHILE (NOT found) AND (List <> NIL) DO
	BEGIN
		found:= Pertenece(list^.info, list^.next);
		IF (NOT found) THEN
		BEGIN 
			list:= list^.next;
		END;
	END;
	AreRepeats:= found;
END;