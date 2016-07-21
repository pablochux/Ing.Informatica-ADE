UNIT ConjuntoNodos;
INTERFACE
	USES Nodo;
	TYPE
		{Implementación del TAD ConjuntoNodos mediante una lista simplemente enlazada en memoria dinámica}
		TipoConjuntoNodos = ^TipoNodoConjuntoNodos;
		TipoNodoConjuntoNodos = RECORD
			info: TipoNodo;
			sig: TipoConjuntoNodos;
		END;
		
	{Cabeceras Subprogramas}

	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearConjuntoVacio (VAR conjuntoNodos: TipoConjuntoNodos);
	PROCEDURE Poner (VAR conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo);
	PROCEDURE Elegir (conjuntoNodos: TipoConjuntoNodos; VAR auxNodo: TipoNodo);

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsConjuntoVacio (conjuntoNodos: TipoConjuntoNodos): Boolean;
	FUNCTION Pertenece (conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo): Boolean;

	{ CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE Quitar (VAR conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo);


IMPLEMENTATION
{Subprogramas}
	PROCEDURE CrearConjuntoVacio (VAR conjuntoNodos: TipoConjuntoNodos);
	BEGIN
		conjuntoNodos:= NIL;
	END;

	PROCEDURE Poner (VAR conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo);
	VAR
		auxConjuntoNodos: TipoConjuntoNodos;

	BEGIN
		IF (NOT Pertenece(conjuntoNodos, elemento)) THEN {Una de las características de los conjuntos es que la idempotencia(no hay números repetidos, por lo que si se intenta Poner un número que ya está, se omite)}
		BEGIN
			NEW(auxConjuntoNodos);
			Nodo.Asignar(elemento, auxConjuntoNodos^.info);
			auxConjuntoNodos^.sig:= conjuntoNodos;
			conjuntoNodos:= auxConjuntoNodos;
		END;
	END;

	PROCEDURE Elegir (conjuntoNodos: TipoConjuntoNodos; VAR auxNodo: TipoNodo);
	BEGIN
		Nodo.Asignar(conjuntoNodos^.info, auxNodo);
	END;

	{ OBSERVADORAS NO SELECTORAS }
	
	FUNCTION EsConjuntoVacio (conjuntoNodos: TipoConjuntoNodos): Boolean;
	BEGIN
		EsConjuntoVacio:= (conjuntoNodos = NIL);
	END;

	FUNCTION Pertenece (conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo): Boolean;
	VAR
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		WHILE (NOT encontrado) AND (conjuntoNodos <> NIL) DO
		BEGIN
			encontrado:= Nodo.Iguales(elemento, conjuntoNodos^.info);
			IF (NOT encontrado) THEN 
			BEGIN
				conjuntoNodos:= conjuntoNodos^.sig;
			END;
		END;
		Pertenece:= encontrado;
	END;

	{ CONSTRUCTORAS NO GENERADORAS }

	PROCEDURE Quitar(VAR conjuntoNodos: TipoConjuntoNodos; elemento:TipoNodo);
	VAR
		encontrado: Boolean;
		auxConjuntoNodos, auxConjuntoNodosAnt: TipoConjuntoNodos;

	BEGIN
		encontrado:= FALSE;
		auxConjuntoNodos:= conjuntoNodos;
		auxConjuntoNodosAnt:= NIL;
		WHILE (NOT encontrado) AND (auxConjuntoNodos <> NIL) DO
		BEGIN
			encontrado:= Nodo.Iguales(auxConjuntoNodos^.info, elemento);
			IF (NOT encontrado) THEN 
			BEGIN
				auxConjuntoNodosAnt:= auxConjuntoNodos;
				auxConjuntoNodos:= auxConjuntoNodos^.sig;
			END;
		END;
		IF (encontrado) THEN 
		BEGIN
			IF (auxConjuntoNodosAnt = NIL) THEN 
			BEGIN
				conjuntoNodos:= NIL;
			END
			ELSE 
			BEGIN
				auxConjuntoNodosAnt^.sig:= auxConjuntoNodos^.sig;
			END;
			DISPOSE(auxConjuntoNodos);
		END;
	END;	
END.	