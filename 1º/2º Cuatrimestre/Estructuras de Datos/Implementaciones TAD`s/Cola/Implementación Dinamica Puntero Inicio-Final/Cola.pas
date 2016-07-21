{**************************************************************************
* Modulo: TAD Cola                  									  *
* Tipo: Programa(x) Interfaz-Implementacion TAD Cola(Práctica 7)		  *
* Autor: Pablo Alonso                                                     *
* Fecha: 2015                                                             *
* Descripcion: Implementación del TAD Cola  							  *
***************************************************************************}
UNIT Cola;
INTERFACE
	USES Elem;
	TYPE
		TInfo = TElem;
		TPuntero = ^TNodo;
		TCola = RECORD
			inicio: TPuntero;
			final: TPuntero;
		END;
		TNodo = RECORD
			info: TInfo;
			sig: TPuntero;
		END;

	{Cabeceras Subprogramas}
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearColaVacia(VAR c: TCola);{O(1)}
	{Pre = TRUE}
	{Post = devuelve la cola vacía}
	PROCEDURE Insertar(VAR c: TCola; e: TInfo);{O(1)}
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
		c.inicio:= NIL;
		nil{Falta poner ambos punteros a };
		c.final:= NIL;
	END;

	PROCEDURE Insertar(VAR c: TCola; e: TInfo);{O(?)}
	VAR
		auxCola: TPuntero;

	BEGIN
		NEW(auxCola);
		Elem.Asignar(e, auxCola^.info);
		auxCola^.sig:= NIL;
		IF (EsColaVacia(c)) THEN 
		BEGIN
			c.inicio:= auxCola;
			c.final:= auxCola;
		END
		ELSE 
		BEGIN
			c.final^.sig:= auxCola;
			c.final:= auxCola;
		END;
	END;

	PROCEDURE Primero(c: TCola; VAR e: TInfo);{O(?)}
	BEGIN
		Elem.Asignar(c.inicio^.info, e);
	END;

	PROCEDURE Eliminar(VAR c: TCola);{O(?)}
	VAR
		auxCola: TPuntero;

	BEGIN
		auxCola:= c.inicio;
		IF (c.inicio = c.final) THEN 
		BEGIN
			CrearColaVacia(c);
		END
		ELSE 
		BEGIN
			c.inicio:= c.inicio^.sig;
		END;
		DISPOSE(auxCola);
	END;

	FUNCTION EsColaVacia(c: TCola): BOOLEAN;{O(?)}
	BEGIN
		EsColaVacia:= (c.inicio = NIL);
	END;

	FUNCTION Iguales(c1,c2: TCola): BOOLEAN;{O(?)}
	VAR
		igual: Boolean;

	BEGIN
		igual:= TRUE;
		WHILE (c1.inicio <> NIL) AND (c2.inicio <> NIL) AND (igual) DO
		BEGIN
			igual:= Elem.Iguales(c1.inicio^.info, c2.inicio^.info);
			IF (igual) THEN 
			BEGIN
				c1.inicio:= c1.inicio^.sig;
				c2.inicio:= c2.inicio^.sig;
			END;
		END;
		IF (c1.inicio <> NIL) OR (c2.inicio <> NIL) THEN 
		BEGIN
			igual:= FALSE;
		END;
		Iguales:= igual;
	END;

	PROCEDURE Copiar(VAR c2: TCola; c1: TCola);{O(?)}
	VAR
		auxElemento: TInfo;

	BEGIN
		CrearColaVacia(c2);
		WHILE (c1.inicio <> NIL) DO
		BEGIN
			Primero(c1, auxElemento);
			Insertar(c2, auxElemento);
			c1.inicio:= c1.inicio^.sig;
		END;
	END;

	PROCEDURE Destruir(VAR c: TCola);
	BEGIN
		WHILE (NOT EsColaVacia(c)) DO
		BEGIN
			Eliminar(c);
		END;
	END;
END.