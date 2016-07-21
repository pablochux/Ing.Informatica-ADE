PROCEDURE Copy ();
BEGIN
	
END;


list2:= NIL; {Lista 2 ya tiene que ser NIL}
FUNCTION Test (list1, list2: TypeList): TypeList;
BEGIN
	IF (list1 = NIL) THEN {Si es el Final de la función recursiva}{Problema en el caso que se vacía}
	BEGIN
		IF (list2 <> NIL) THEN {En el caso de que la lista 2 tenga algún elemento, se apunta el último a NIL}
		BEGIN
			list2^.next:= NIL;
		END
		ELSE {En el caso que la lista1 sea vacía y la lista2 también}
		BEGIN
			list2:= NIL;{Está mal porque ya está := NIL}
		END;
	END
	ELSE
	BEGIN
		IF (list2 = NIL) THEN {Si es el primer elmeento que se va a crear}
		BEGIN
			list2:= CreateNode(list1^.info);
			list1:= list1^.next;
		END
		ELSE 
		BEGIN
			list2^.next:= CreateNode(list1^.info);
			Test:= Test(list1^.next, list2^.next);
		END;
	END;
END;