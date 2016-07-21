UNIT TADConjuntoNodos;
INTERFACE
	USES TADNodo;
	TYPE
		{Implementación del TAD ConjuntoNodos mediante una lista simplemente enlazada en memoria dinámica}
		{Aunque nos encontramos ante la implementación de un conjunto, en realidad es una lista, por lo que muchas operaciones serán prácticamente iguales}
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

	{ CONSTRUCTORAS GENERADORAS }
	{Crea un conjunto vacio}
	PROCEDURE CrearConjuntoVacio (VAR conjuntoNodos: TipoConjuntoNodos);
	BEGIN
		conjuntoNodos:= NIL;
	END;

	{"Pone" en el conjunto el nodo que recibe. Si ya pertenece al conjunto no hace nada}
	PROCEDURE Poner (VAR conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo);
	VAR
		auxConjuntoNodos: TipoConjuntoNodos;

	BEGIN
		IF (NOT Pertenece(conjuntoNodos, elemento)) THEN {Una de las características de los conjuntos es que la idempotencia(no hay números repetidos, por lo que si se intenta Poner un número que ya está, se omite)}
		BEGIN
			NEW(auxConjuntoNodos);
			TADNodo.Asignar(elemento, auxConjuntoNodos^.info);
			auxConjuntoNodos^.sig:= conjuntoNodos;
			conjuntoNodos:= auxConjuntoNodos;
		END;
	END;

	{Elige un nodo del conjunto (en este caso el primero)}
	PROCEDURE Elegir (conjuntoNodos: TipoConjuntoNodos; VAR auxNodo: TipoNodo);
	BEGIN
		TADNodo.Asignar(conjuntoNodos^.info, auxNodo);
	END;

	{ OBSERVADORAS NO SELECTORAS }
	{Devuelve el valor booleano de igualar el conjunto a NIL}
	FUNCTION EsConjuntoVacio (conjuntoNodos: TipoConjuntoNodos): Boolean;
	BEGIN
		EsConjuntoVacio:= (conjuntoNodos = NIL);
	END;

	{Devuelve el valor booleano de si pertenece un nodo al conjunto}
	FUNCTION Pertenece (conjuntoNodos: TipoConjuntoNodos; elemento: TipoNodo): Boolean;
	VAR
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		WHILE (NOT encontrado) AND (conjuntoNodos <> NIL) DO
		BEGIN
			encontrado:= TADNodo.Iguales(elemento, conjuntoNodos^.info);
			IF (NOT encontrado) THEN 
			BEGIN
				conjuntoNodos:= conjuntoNodos^.sig;
			END;
		END;
		Pertenece:= encontrado;
	END;

	{ CONSTRUCTORAS NO GENERADORAS }
	{Quita un elemento del conjunto}
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
			encontrado:= TADNodo.Iguales(auxConjuntoNodos^.info, elemento);
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