UNIT Pila;
INTERFACE
	USES Elem;
	TYPE
		{La implementación de una pila doblemente enlazada es igual que una pila simplemente enlazada pero cambia el Insertar, nada más}
		{La definición de tipos es exactamente igual que una lista simplemente enlazada}
		TipoPila = ^TipoNodo;
		TipoNodo = RECORD
			info: TipoElemento;
			sig: TipoPila;
			ant: TipoPila;
		END;

	{Cabeceras Subprogramas}

	{Cabeceras Subprogramas}
	
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearPilaVacia(VAR pila: TipoPila);{O(n)}
	{Pre = TRUE}
	{Post = devuelve la pila vacía}
	PROCEDURE Apilar(VAR pila: TipoPila; elemento: TipoElemento);{O(1)}
	{Pre = recibe una pila que puede ser vacía o no}
	{Post = devuelve la pila con el elemento e en la cima}

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Cima(pila: TipoPila; VAR elemento: TipoElemento);{O(1)}
	{Pre = Recibe la pila no vacía}
	{Post = devuelve el primer elemento de la pila}
	PROCEDURE Desapilar(VAR pila: TipoPila);{O(1)}
	{Pre = recibe una pila no vacía}
	{Post = devuelve una pila sin el primer elemento de la original}

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsPilaVacia(pila: TipoPila): BOOLEAN;{O(1)}
	{Pre = recibe una pila que puede ser vacía o no}
	{Post = devuelve TRUE si la pila es vacía, FALSE en caso contrario}
	PROCEDURE Copiar (pila1: TipoPila; VAR pila2: TipoPila);{O(2n)}
	{Pre = la variable destino es una pila creada, vacía o con elementos}
	{Post = la variable destino es una copia exacta de la pila origen}

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(pila1, pila2: TipoPila): Boolean;{O(n)}
	{Pre = TRUE}
	{Post = devuelve TRUE si las dos pilas son iguales}
	PROCEDURE Destruir (VAR pila: TipoPila);{O(n)}
	{Pre = TRUE}
	{Post = libera la memoria utilizada y devuelve la pila vacía}
IMPLEMENTATION
	{Subprogramas}
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearPilaVacia (VAR pila: TipoPila);
	BEGIN
		pila:= NIL;
	END;
	
	{Como estamos en la estructura Pila, la insercción de elementos se hace por el principio. Siendo una estructura FILO (al igual que la lista)}
	PROCEDURE Apilar (VAR pila: TipoPila; elemento: TipoElemento);
	VAR
		auxPila: TipoPila;

	BEGIN
		NEW(auxPila);
		Elem.Asignar(auxPila^.info, elemento);
		auxPila^.sig:= pila;
		pila^.ant:= NIL;
		IF (NOT EsPilaVacia) THEN 
		BEGIN
			pila^.ant:= auxPila; {Si la Pila no es vacia se enlazada el antiguo primer elemento al que ahora será el nuevo elemento}		
		END;
		pila:= auxPila;
	END;

	{OBSERVADORAS SELECTORAS}
	{La selección de elementos se hace por el principio. Cima corresponde a Primero en otros TAD`s}
	PROCEDURE Cima (pila: TipoPila; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsPilaVacia(pila)) THEN 
		BEGIN
			Elem.Asignar(elemento, pila^.info);
		END;
	END;

	{La eliminación de elementos se hace por el principio, al igual que la insercción. Es una estructura FILO}
	PROCEDURE Desapilar (VAR pila: TipoPila);
	VAR
		auxPila: TipoPila;

	BEGIN
		IF (NOT EsPilaVacia(pila)) THEN 
		BEGIN
			auxPila:= pila;
			pila:= pila^.sig;
			DISPOSE(auxPila);
		END;
	END;

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsPilaVacia (pila: TipoPila): Boolean;
	BEGIN
		EsPilaVacia:= (pila = NIL);
	END;

	{Métafora muelle}
	{Para copiar una pila a otra es necesario utilizar una pila auxiliar, ya que como solo se puede acceder a los elementos de la pila mediante Cima, si lo insertaramos directamente en la otra pila, esta quedaría desordenada. Se copia la pila a la auxiliar y posteriormente de la auxiliar a la nueva pila}
	PROCEDURE Copiar (pila1: TipoPila; VAR pila2: TipoPila);
	VAR
		auxPila: TipoPila;
		auxElemento: TipoElemento;

	BEGIN
		CrearPilaVacia(auxPila);
		CrearPilaVacia(pila2);	
		WHILE (pila1 <> NIL) DO
		BEGIN
			Cima(pila1, auxElemento);
			pila1:= pila1^.sig; {También se podría poner Desapilar(pila1) pero eso destruiría la pila1}
			Apilar(auxPila, auxElemento);
		END;
		WHILE (auxPila <> NIL) DO
		BEGIN
			Cima(auxPila, auxElemento);
			Desapilar(auxPila);
			Apilar(pila2, auxElemento);
		END;
	END;

	{CONSTRUCTORAS NO GENERADORAS}
	{El procedimiento Iguales es igual que en otros TAD`s}
	FUNCTION  Iguales (pila1, pila2: TipoPila): Boolean;
	VAR
		auxElem1, auxElem2: TipoElemento;
		igual: Boolean;

	BEGIN
		igual:= TRUE;
		WHILE (igual) AND (pila1 <> NIL) AND (pila2 <> NIL) DO
		BEGIN
			Cima(pila1, auxElem1);
			Cima(pila2, auxElem2);
			Elem.Iguales(auxElem1, auxElem2);
			IF (igual) THEN 
			BEGIN	
				pila1:= pila1^.sig;
				pila2:= pila2^.sig;
			END;
		END;
		IF (pila1 <> NIL) AND (pila2 <> NIL) THEN 
		BEGIN
			igual:= FALSE;
		END;
		Iguales:= igual;
	END;

	PROCEDURE Destruir (VAR pila: TipoPila);
	BEGIN
		WHILE (NOT EsPilaVacia(pila)) DO
		BEGIN
			Desapilar(pila);
		END;
	END;
END.