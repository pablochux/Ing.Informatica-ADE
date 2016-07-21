{**************************************************************************
* Modulo: TAD Lista                  									  *
* Tipo: Programa(x) Interfaz-Implementacion TAD Lista(Práctica 3)     	  *
* Autor: Pablo Alonso                                                     *
* Fecha: 2015                                                             *
* Descripcion: Implementación del TAD Lista  							  *
***************************************************************************}
UNIT Lista;
INTERFACE
	USES elem;
	TYPE
		TInfo = TElem;
		TLista = ^TipoNodo;
		TipoNodo = RECORD
			ant, sig: TLista;
			info: TInfo;
		END;

	{Cabeceras Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearListaVacia(VAR l: TLista);{O(1)}
	{Pre = TRUE}
	{Post = devuelve la lista vacía}
	PROCEDURE Construir(VAR l: TLista; e: TInfo);{O(1)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve la lista con el elemento e en la primera posición}

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(l: TLista; VAR e: TInfo);{O(1)}
	{Pre = Recibe la lista no vacía}
	{Post = devuelve el primer elemento de la lista}
	PROCEDURE Resto(l: TLista; VAR l2: TLista);{O(1)}
	{Pre = recibe una lista no vacía}
	{Post = devuelve una lista sin el primer elemento de la original}

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsListaVacia(l: TLista): BOOLEAN;{O(1)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve TRUE si la lista es vacía, FALSE en caso contrario}
	FUNCTION Longitud(l: TLista): integer;{O(n)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve el número de elementos de la lista}
	PROCEDURE Ultimo(l: TLista; VAR e: TInfo);{O(n)}
	{Pre = recibe una lista no vacía}
	{Post = en e devuelve la información del último elemento de la lista}
	FUNCTION Pertenece(l: TLista; e: TInfo): BOOLEAN;{O(n)}
	{Pre = recibe una lista que puede ser vacía o no, y un elemento}
	{Post = si el elemento está en la lista devuelve TRUE, en caso contrario FALSE}

	{CONSTRUCTORAS NO GENERADORAS}
	PROCEDURE Concatenar(l1,l2: TLista; VAR l3: TLista);{n^4)}
	{Pre = recibimos dos listas, l1 y l2, que pueden ser vacías o no}
	{Post = devolvemos una nueva lista que primero tiene los elementos de l1 y luego los de l2}
	PROCEDURE BorrarElemento(VAR l: TLista; e: TInfo);{O(?)}
	{Pre = recibe una lista que puede ser o no vacía, y un elemento}
	{Post = si el elemento pertenece a la lista, devolvemos la lista sin la primera aparición del elemento. En caso contrario, devolvemos la lista original}
	PROCEDURE InsertarFinal(VAR l: TLista; e: TInfo);{O(n^2)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve la lista con el elemento en la última posición}

	{OPERACIONES AUXILIARES}
	PROCEDURE Copiar (VAR l1: TLista; l2: TLista); {O(n^2)}
	{Pre = recibe una lista que puede ser o no vacía}
	{Post = en l1 devolvemos una copia de l2}
	FUNCTION Iguales(l1, l2: TLista): Boolean; {O(n)}
	{Pre = recibe dos listas que pueden ser o no vacías}
	{Post = si son iguales, es decir, contienen los mismos elementos en el mismo orden, devuelve cierto}
	PROCEDURE Destruir(VAR l: TLista); {O(n^2)}
	{Pre = TRUE}
	{Post = devuelve la lista vacía después de liberar toda la memoria que utilizaba}

IMPLEMENTATION
	{Subprogramas}
	{OPERACIONES CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearListaVacia (VAR l: TLista);
	BEGIN
		l:= NIL;
	END;

	PROCEDURE Construir (VAR l: TLista; e: TInfo);
	VAR
		auxLista: TLista;

	BEGIN
		NEW(auxLista);
		Elem.Asignar(e, auxLista^.info);
		auxLista^.sig:= l;
		auxLista^.ant:= NIL;
		IF (NOT EsListaVacia(l)) THEN 
		BEGIN
			l^.ant:= auxLista;
		END;
		l:= auxLista;
	END;

	{OPERACIONES OBSERVADORAS SELECTORAS}
	{PARCIAL} PROCEDURE Primero (l: TLista; VAR e: TInfo);
	BEGIN
		IF (NOT EsListaVacia(l)) THEN 
		BEGIN
			Elem.Asignar(l^.info, e);
		END;
	END;

	{PARCIAL} PROCEDURE Resto (l: TLista; VAR l2: TLista);
	BEGIN
		CrearListaVacia(l2);
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

	{PARCIAL} PROCEDURE Ultimo (l: TLista; VAR e: TInfo);
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

	FUNCTION Pertenece (l: TLista; e: TInfo): Boolean;
	VAR
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		WHILE (l <> NIL) AND (NOT encontrado) DO
		BEGIN
			encontrado:= Elem.Iguales(l^.info, e);
			l:= l^.sig;
		END;
		Pertenece:= encontrado;
	END;

	{OPERACIONES CONSTRUCTORAS NO GENERADORAS}
	PROCEDURE Concatenar (l1, l2: TLista; VAR l3: TLista);
	BEGIN
		CrearListaVacia(l3);
		WHILE (l1 <> NIL) DO
		BEGIN
			InsertarFinal(l3, l1^.info);
			l1:= l1^.sig;
		END;
		WHILE (l2 <> NIL) DO
		BEGIN
			InsertarFinal(l3, l2^.info);
			l2:= l2^.sig;
		END;
	END;
	
	PROCEDURE BorrarElemento (VAR l: TLista; e: TInfo);
	VAR
		auxPuntero: TLista;
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		auxPuntero:= l;
		WHILE (auxPuntero <> NIL) AND (NOT encontrado) DO
		BEGIN
			encontrado:= Elem.Iguales(auxPuntero^.info, e);
			IF (NOT encontrado) THEN 
			BEGIN
				auxPuntero:= auxPuntero^.sig;					
			END;
		END;
		IF (encontrado) THEN 
		BEGIN 
			{Primer y único nodo}
			IF (auxPuntero = l) AND (auxPuntero^.sig = NIL) THEN
			BEGIN
				l:= NIL;
			END
			{Ultimo nodo}
			ELSE IF (auxPuntero <> l) AND (auxPuntero^.sig = NIL) THEN 
			BEGIN
				auxPuntero^.ant^.sig:= NIL;
			END
			{Primer nodo pero no único}
			ELSE IF (auxPuntero = l) AND (auxPuntero^.sig <> NIL) THEN 
			BEGIN
				l:= l^.sig;
				l^.ant:= auxPuntero^.ant;
			END
			{Si está entre medias de dos nodos}
			ELSE 
			BEGIN
				auxPuntero^.ant^.sig:= auxPuntero^.sig;
				auxPuntero^.sig^.ant:= auxPuntero^.ant;
			END;
			DISPOSE(auxPuntero);
		END;
	END;
	
	PROCEDURE InsertarFinal (VAR l: TLista; e: TInfo);
	VAR
		auxLista, auxPuntero: TLista;

	BEGIN
		NEW(auxLista);
		Elem.Asignar(e, auxLista^.info);
		auxLista^.sig:= NIL;
		auxPuntero:= l;
		IF (EsListaVacia(auxPuntero)) THEN 
		BEGIN
			auxLista^.ant:= NIL;
			l:= auxLista;
		END
		ELSE
		BEGIN 
			WHILE (auxPuntero^.sig <> NIL) DO
			BEGIN
				auxPuntero:= auxPuntero^.sig;
			END;
			auxPuntero^.sig:= auxLista;
			auxLista^.ant:= auxPuntero;
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

	FUNCTION Iguales (l1,l2: TLista): Boolean;
	VAR
		igual: Boolean;

	BEGIN
		igual:= TRUE;
		WHILE ((l1 <> NIL) AND (l2 <> NIL) AND (igual)) DO
		BEGIN
			igual:= Elem.Iguales(l1^.info, l2^.info);
			IF (igual) THEN 
			BEGIN
				l1:= l1^.sig;	
				l2:= l2^.sig;	
			END;		
		END;	
		IF ((l1 <> NIL) OR (l2 <> NIL)) THEN
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