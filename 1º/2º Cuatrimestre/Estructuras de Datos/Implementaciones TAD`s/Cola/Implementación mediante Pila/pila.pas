{**************************************************************************
* Modulo: TAD Pila auxiliar                 									  *
* Tipo: Programa(x) Interfaz-Implementacion TAD Pila(auxiliar)         			  *
* Autor: Pablo Alonso                                                     *
* Fecha: 2015                                                             *
* Descripcion: Implementación del TAD Pila auxiliar 							  *
***************************************************************************}
UNIT Pila;
INTERFACE
	USES Elem;
	TYPE
		TInfo = TElem;
		TPila = ^TNodo;
		TNodo =	RECORD
			info: TInfo;
			sig: TPila;
		END;
	{Cabeceras Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearPilaVacia(VAR p: TPila);{O(?)}
	{Pre = TRUE}
	{Post = devuelve la pila vacía}
	PROCEDURE Apilar(VAR p: TPila; e: TInfo);{O(?)}
	{Pre = recibe una pila que puede ser vacía o no}
	{Post = devuelve la pila con el elemento e en la cima}

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Cima(p: TPila; VAR e: TInfo);{O(?)}
	{Pre = Recibe la pila no vacía}
	{Post = devuelve el primer elemento de la pila}
	PROCEDURE Desapilar(VAR p: TPila);{O(?)}
	{Pre = recibe una pila no vacía}
	{Post = devuelve una pila sin el primer elemento de la original}

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsPilaVacia(p: TPila): BOOLEAN;{O(?)}
	{Pre = recibe una pila que puede ser vacía o no}
	{Post = devuelve TRUE si la pila es vacía, FALSE en caso contrario}
	PROCEDURE Copiar (VAR destino: TPila; origen: TPila);
	{Pre = la variable destino es una pila creada, vacía o con elementos}
	{Post = la variable destino es una copia exacta de la pila origen}

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(p1, p2: TPila): Boolean;
	{Pre = TRUE}
	{Post = devuelve TRUE si las dos pilas son iguales}
	PROCEDURE Destruir (VAR pila: TPila);
	{Pre = TRUE}
	{Post = libera la memoria utilizada y devuelve la pila vacía}

IMPLEMENTATION
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearPilaVacia(VAR p: TPila);{O(?)}
	BEGIN
		p:= NIL;
	END;

	PROCEDURE Apilar(VAR p: TPila; e: TInfo);{O(?)}
	VAR
		auxPila: TPila;

	BEGIN
		NEW(auxPila);
		Elem.Asignar(e, auxPila^.info);
		auxPila^.sig:= p;
		p:= auxPila;
	END;

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Cima (p: TPila; VAR e: TInfo);{O(?)}
	BEGIN
		IF (NOT EsPilaVacia(p)) THEN 
		BEGIN
			Elem.Asignar(p^.info, e);
		END;
	END;

	PROCEDURE Desapilar(VAR p: TPila);{O(?)}
	VAR
		auxPila: TPila;

	BEGIN

		IF (NOT EsPilaVacia(p)) THEN 
		BEGIN
			auxPila:= p;
			p:= p^.sig;
			DISPOSE(auxPila);
		END;		
	END;

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsPilaVacia(p: TPila): BOOLEAN;{O(?)}
	BEGIN
		EsPilaVacia:= (p = NIL);
	END;

	PROCEDURE Copiar (VAR destino: TPila; origen: TPila);
	VAR
		auxPila: TPila;
		e: TInfo;
		
	BEGIN
		CrearPilaVacia(auxPila);
		WHILE (origen <> NIL) DO
		BEGIN
			Cima(origen, e);
			Apilar(auxPila, e);
			origen:= origen^.sig;
		END;
		CrearPilaVacia(destino);
		WHILE (auxPila <> NIL) DO
		BEGIN
			Cima(auxPila, e);
			Apilar(destino, e);
			Desapilar(auxPila);
		END;
	END;

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(p1, p2: TPila): Boolean;
	VAR
		auxPila: TPila;
		igual: Boolean;
		e1, e2: TInfo;

	BEGIN
		igual:= TRUE;
		WHILE (p1 <> NIL) AND (p2 <> NIL) AND (igual) DO
		BEGIN
			Cima(p1, e1);
			Cima(p2, e2);
			igual:= Elem.Iguales(e1, e2);
			IF (igual) THEN 
			BEGIN
				p1:= p1^.sig;
				p2:= p2^.sig;
			END;
		END;
		IF (p1 <> NIL) OR (p2 <> NIL) THEN 
		BEGIN
			igual:=FALSE;
		END;
		Iguales:= igual;
	END;
	
	PROCEDURE Destruir (VAR pila: TPila);
	BEGIN	
	WHILE (NOT EsPilaVacia(pila)) DO
		BEGIN
			Desapilar(pila);
		END;
	END;
END.