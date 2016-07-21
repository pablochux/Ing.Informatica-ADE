UNIT TADNodo;
INTERFACE
	CONST
		MIN = 1;
		MAX = 5;

	TYPE
		TipoNodo = MIN..MAX;
	
	{Cabeceras Subprogramas}
	FUNCTION Mayor (nodo1, nodo2: TipoNodo): Boolean;
	PROCEDURE Asignar (nodo1: TipoNodo; VAR nodo2: TipoNodo);
	FUNCTION Iguales (nodo1, nodo2: TipoNodo): Boolean;

IMPLEMENTATION
	{Subprogramas}
	PROCEDURE Asignar (nodo1: TipoNodo; VAR nodo2: TipoNodo);
	BEGIN
		nodo2:= nodo1;
	END;

	FUNCTION Iguales (nodo1, nodo2: TipoNodo): Boolean;
	BEGIN
		Iguales:= (nodo1 = nodo2);
	END;

	FUNCTION Mayor (nodo1, nodo2: TipoNodo): Boolean;
	BEGIN
		Mayor:= (nodo2 < nodo1);
	END;

END.