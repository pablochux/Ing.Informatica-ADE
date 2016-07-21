{Subprograma que elimina todos los elementos de un array}
{Si queremos borrar todos los elementos de una lista, podemos utilizar el puntero lista, o lo vamos eliminando con dos auxiliares?}

PROCEDURE DeleteAll (VAR list: TypeList);
VAR
	auxList: TypeList;

BEGIN
	auxList:= list;
	WHILE (list <> NIL) DO
	BEGIN
		list:= list^.next;
		dispose(auxList);
		auxList:= list;
	END;
END;