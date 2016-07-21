{Implementación Dinámica del TAD Lista}
UNIT Lista;
INTERFACE
	USES Elem;
	TYPE
		TLista = ^TipoNodo;
		TipoNodo = RECORD
			info: TipoElemento;
			sig: TLista;
		END;
	{Cabeceras Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearListaVacia(VAR l: TLista); {O(1)}
	{Pre = TRUE}
	{Post = devuelve la lista vacía}
	PROCEDURE Construir(VAR l: TLista; e: TipoElemento); {O(1)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve la lista con el elemento e en la primera posición}

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(l: TLista; VAR e: TipoElemento); {O(1)}
	{Pre = Recibe la lista no vacía}
	{Post = devuelve el primer elemento de la lista}
	PROCEDURE Resto(l: TLista; VAR l2: TLista); {O(1)}
	{Pre = recibe una lista no vacía}
	{Post = devuelve una lista sin el primer elemento de la original}

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsListaVacia(l: TLista): BOOLEAN; {O(1)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve TRUE si la lista es vacía, FALSE en caso contrario}
	FUNCTION Longitud(l: TLista): integer; {O(n) siendo n el número de nodos de la lista}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve el número de elementos de la lista}
	PROCEDURE Ultimo(l: TLista; VAR e: TipoElemento); {O(n)}
	{Pre = recibe una lista no vacía}
	{Post = en e devuelve la información del último elemento de la lista}
	FUNCTION Pertenece(l: TLista; e: TipoElemento): BOOLEAN;{O(n)}
	{Pre = recibe una lista que puede ser vacía o no, y un elemento}
	{Post = si el elemento está en la lista devuelve TRUE, en caso contrario FALSE}

	{CONSTRUCTORAS NO GENERADORAS}
	PROCEDURE Concatenar(l1,l2: TLista; VAR l3: TLista);{O(n^2)}
	{Pre = recibimos dos listas, l1 y l2, que pueden ser vacías o no}
	{Post = devolvemos una nueva lista que primero tiene los elementos de l1 y luego los de l2}
	PROCEDURE BorrarElemento(VAR l: TLista; e: TipoElemento); {O(n)}
	{Pre = recibe una lista que puede ser o no vacía, y un elemento}
	{Post = si el elemento pertenece a la lista, devolvemos la lista sin la primera aparición del elemento. En caso contrario, devolvemos la lista original}
	PROCEDURE InsertarFinal(VAR l: TLista; e: TipoElemento); {O(n)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve la lista con el elemento en la última posición}

	{OPERACIONES AUXILIARES}
	PROCEDURE Copiar (VAR l1: TLista; l2: TLista);{O(n^2)}
	{Pre = recibe una lista que puede ser o no vacía}
	{Post = en l1 devolvemos una copia de l2}
	FUNCTION Iguales(l1, l2: TLista): Boolean;{O(n)}
	{Pre = recibe dos listas que pueden ser o no vacías}
	{Post = si son iguales, es decir, contienen los mismos elementos en el mismo orden, devuelve cierto}
	PROCEDURE Destruir(VAR l: TLista); {O(n^2)}
	{Pre = TRUE}
	{Post = devuelve la lista vacía después de liberar toda la memoria que utilizaba}

IMPLEMENTATION
	{Subprogramas}

	{ OPERACIONES CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearListaVacia (VAR l: TLista);
	BEGIN
	 	l:= NIL;
	END;

	PROCEDURE Construir (VAR l: TLista; e: TipoElemento);
	VAR
		auxLista: TLista;

	BEGIN
		NEW(auxLista);
		Elem.Asignar(e, auxLista^.info);
		auxLista^.sig:= l;
		l:= auxLista;
	END;

	{OPERACIONES OBSERVADORAS SELECTORAS}
	{PARCIAL} PROCEDURE Primero (l: TLista; VAR e: TipoElemento);
	BEGIN
		IF (NOT EsListaVacia(l)) THEN
		BEGIN
			Elem.Asignar(l^.info, e);	
		END;
	END;

	{PARCIAL} PROCEDURE Resto (l: TLista; VAR l2: TLista);		
	BEGIN
		IF (NOT EsListaVacia(l)) THEN 
		BEGIN
			Copiar(l2, l);
			BorrarElemento(l2, l^.info);
		END;
	END;

	{OPERACIONES OBSERVADORAS NO SELECTORAS}
	FUNCTION EsListaVacia (l: TLista): Boolean;
	BEGIN
		EsListaVacia:= (l = NIL);				
	END;		

	FUNCTION Longitud (l: TLista): Integer;
	VAR
		contador: Integer;

	BEGIN
		contador:= 0;
		WHILE (l <> NIL) DO
		BEGIN
			contador:= contador + 1;
			l:= l^.sig;
		END;
		Longitud:= contador;
	END;

	{PARCIAL} PROCEDURE Ultimo (l: TLista; VAR e: TipoElemento);
	BEGIN
		IF (NOT EsListaVacia(l)) THEN 
		BEGIN
			WHILE (l^.sig <> NIL) DO
			BEGIN
				l:= l^.sig;
			END;
			Elem.Asignar(l^.info, e);
		END;
	END;

	FUNCTION Pertenece (l: TLista; e: TipoElemento): Boolean;
	VAR
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		WHILE (NOT encontrado) AND (l <> NIL) DO
		BEGIN
			encontrado:= Elem.Iguales(l^.info, e);
			IF (NOT encontrado) THEN 
			BEGIN
				l:= l^.sig;
			END;
		END;
		Pertenece:= encontrado;
	END;

	{ OPERACIONES CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE Concatenar (l1, l2: TLista; VAR l3: TLista);
	VAR
		auxLista: TLista;
		i: Integer;

	BEGIN
		CrearListaVacia(l3);
		auxLista:= l1;
		FOR i:=1 TO 2 DO
		BEGIN
			WHILE (auxLista <> NIL) DO
			BEGIN
				InsertarFinal(l3, auxLista^.info);
				auxLista:= auxLista^.sig;
			END;
			auxLista:= l2;
		END;
	END;

	PROCEDURE BorrarElemento (VAR l: TLista; e: TipoElemento);
	VAR
		auxPuntero, auxPunteroPrev: TLista;
		encontrado: Boolean;

	BEGIN
		auxPunteroPrev:= NIL;
		auxPuntero:= l;
		encontrado:= FALSE;
		WHILE (auxPuntero <> NIL) AND (NOT encontrado) DO
		BEGIN
			encontrado:= Elem.Iguales(auxPuntero^.info, e);
			IF (NOT encontrado) THEN 
			BEGIN
				auxPunteroPrev:= auxPuntero;
				auxPuntero:= auxPuntero^.sig;
			END;
		END;
		IF (encontrado) THEN
		BEGIN 
			IF (auxPunteroPrev = NIL) THEN
			BEGIN
				l:= l^.sig;
			END
			ELSE 
			BEGIN
				auxPunteroPrev^.sig:= auxPuntero^.sig;
			END;
			DISPOSE(auxPuntero);
		END;
	END;

	PROCEDURE InsertarFinal (VAR l: TLista; e: TipoElemento);
	VAR
		auxLista, auxPuntero: TLista;

	BEGIN
		{Crear nodo}
		NEW(auxLista);
		Elem.Asignar(e, auxLista^.info);
		auxLista^.sig:= NIL;
		{Encontrar final}
		IF (EsListaVacia(l)) THEN 
		BEGIN
			l:= auxLista;
		END
		ELSE 
		BEGIN
			auxPuntero:= l;
			WHILE (auxPuntero^.sig<> NIL) DO
			BEGIN
				auxPuntero:= auxPuntero^.sig;
			END;
			auxPuntero^.sig:= auxLista;
		END;
	END;

	{OPERACIONES AUXILIARES}
	PROCEDURE Copiar (VAR l1: TLista; l2: TLista);
	BEGIN
		CrearListaVacia(l1);
		WHILE (l2 <> NIL) DO
		BEGIN
			InsertarFinal(l1, l2^.info);
			l2:= l2^.sig;
		END;
	END;

	FUNCTION Iguales (l1, l2: TLista): Boolean;
	VAR
		igual: Boolean;

	BEGIN
		igual:= TRUE;
		WHILE (l1 <> NIL) AND (l2 <> NIL) AND (igual) DO
		BEGIN
			igual:= Elem.Iguales(l1^.info, l2^.info);
			IF (igual) THEN 
			BEGIN
				l2:= l2^.sig;
				l1:= l1^.sig;		
			END;
		END;
		IF (l1 <> NIL) OR (l2 <> NIL) THEN
		BEGIN
			igual:= FALSE;
		END;
		Iguales:= igual;
	END;

	PROCEDURE Destruir (VAR l: TLista);
	BEGIN
		WHILE (NOT EsListaVacia(l)) DO
		BEGIN
			BorrarElemento(l, l^.info);
		END;
	END;
END.