{**************************************************************************
* Modulo: TAD Cola                  									  *
* Tipo: Programa(x) Interfaz-Implementacion TAD Cola(Práctica 10)		  *
* Autor: Pablo Alonso                                                     *
* Fecha: 2015                                                             *
* Descripcion: Implementación del TAD Cola  							  *
***************************************************************************}
UNIT Cola;
INTERFACE
	USES Pila, Elem;
	TYPE
		TInfo = TElem;
		TCola = RECORD
			pila1: TPila; {Esta pila será la pila principal, la que será "cola"}
			pila2: TPila; {Esta será una pila auxiliar para las operaciones conflictivas}
		END;
		TPila = ^TNodo;
		TNodo = RECORD
			info: TInfo;
			sig: TPila;
		END;

	{Cabeceras Subprogramas}
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearColaVacia(VAR c: TCola);{O(1)}
	{Pre = TRUE}
	{Post = devuelve la cola vacía}
	PROCEDURE Insertar(VAR c: TCola; e: TInfo);{O(2n)}
	{Pre = recibe una cola que puede ser vacía o no}
	{Post = devuelve la cola con el elemento e en la última posición}

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(c: TCola; VAR e: TInfo);{O(1)}
	{Pre = Recibe la cola no vacía}
	{Post = devuelve el primer elemento de la cola}
	PROCEDURE Eliminar(VAR c: TCola);{O(1)}
	{Pre = recibe una cola no vacía}
	{Post = devuelve la cola sin el primer elemento}

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsColaVacia(c: TCola): BOOLEAN;{O(1)}
	{Pre = recibe una cola que puede ser vacía o no}
	{Post = devuelve TRUE si la cola es vacía, FALSE en caso contrario}

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(c1,c2: TCola): BOOLEAN;{O(n)}
	{Pre = recibe una cola que puede ser vacía o no}
	{Post = devuelve TRUE si las dos colas son iguales}
	PROCEDURE Copiar(VAR c2: TCola; c1: TCola);{O(n)}
	{Pre = recibimos una cola que puede ser vacía o no}
	{Post = devolvemos una nueva cola que es una copia exacta de la primera}
	PROCEDURE Destruir(VAR c: TCola); {O(n)}
	{Pre = TRUE}
	{Post = devuelve la cola vacía}

IMPLEMENTATION
	{Subprogramas}
	PROCEDURE CrearColaVacia(VAR c: TCola);{O(?)}
	BEGIN
		CrearPilaVacia(c.pila1);
		CrearPilaVacia(c.pila2)
	END;

	PROCEDURE Insertar(VAR c: TCola; e: TInfo);{O(?)}
	VAR
		auxElem: TInfo;
	
	BEGIN
		WHILE (c.pila1 <> NIL) DO
		BEGIN
			Cima(c.pila1, auxElem);
			Apilar(c.pila2, auxElem);
			Desapilar(c.pila1);		
		END;	
		Apilar(c.pila1, e);
		WHILE (c.pila2 <> NIL) DO
		BEGIN
			Cima(c.pila2, auxElem);
			Apilar(c.pila1, auxElem);
			Desapilar(c.pila2);
		END;
	END;
	
	PROCEDURE Primero(c: TCola; VAR e: TInfo);{O(?)}
	BEGIN
		IF (NOT EsPilaVacia(c.pila1)) THEN 
		BEGIN
			Cima(c.pila1, e);
		END;
	END;

	PROCEDURE Eliminar(VAR c: TCola);{O(?)}
	BEGIN
		Desapilar(c.pila1)
	END;
	
	FUNCTION EsColaVacia(c: TCola): BOOLEAN;{O(?)}
	BEGIN
		EsColaVacia:= EsPilaVacia(c.pila1);
	END;	

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(c1,c2: TCola): BOOLEAN;{O(?)}
	BEGIN
		Iguales:= Pila.Iguales(c1.pila1, c2.pila1);
	END;

	PROCEDURE Copiar(VAR c2: TCola; c1: TCola);{O(?)}
	BEGIN
		Pila.Copiar(c2.pila1, c1.pila1);
	END;
	
	PROCEDURE Destruir(VAR c: TCola);
	BEGIN {Se eliminan las dos pilas o solo una (la principal)?}
		WHILE (NOT EsPilaVacia(c.pila1)) DO
		BEGIN
			Desapilar(c.pila1)
		END;
		WHILE (NOT EsPilaVacia(c.pila2)) DO
		BEGIN			
			Desapilar(c.pila2)
		END;
	END;
END.		