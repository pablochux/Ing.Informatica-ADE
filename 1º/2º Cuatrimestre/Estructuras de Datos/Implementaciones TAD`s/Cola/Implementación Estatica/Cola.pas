{************************************************************************
* Modulo: TAD Cola Estática                                             *
* Tipo: Programa(x) Interfaz-Implementacion TAD Cola()       Otros()    *
* Autor: Pablo Alonso                                    	            *
* Fecha: 2015                                                           *
* Descripcion: Implementación del TAD Cola 							    *
*************************************************************************}
UNIT Cola;
INTERFACE
	USES Elem;
	CONST
		NULO = 0;
		MIN = 1;
		MAX = 100;

	TYPE
		TInfo = TElem;
		TipoRangoCola = MIN..MAX;
		TipoRangoAux = NULO..MAX;
		TipoArrayCola = ARRAY [TipoRangoCola] of TInfo;
		TCola = RECORD
			accesoCola: TipoArrayCola;
			inicio, final, longitud: TipoRangoAux;
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

	{CONSTRUCTORAS NO GENERADORAS}
	PROCEDURE Eliminar(VAR c: TCola);{O(1)}
	{Pre = recibe una cola no vacía}
	{Post = devuelve la cola sin el primer elemento}

	{OBSERVADORAS SELECTORAS}
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
	FUNCTION EsColaLlena(c: TCola): BOOLEAN;{O(1)}
	{Pre = recibe una cola que puede estar llena o no}
	{Post = devuelve TRUE si en la cola no caben más elementos}

IMPLEMENTATION	
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearColaVacia(VAR c: TCola);
	BEGIN
		c.inicio:= 0;
		c.final:= 0;
		c.longitud:= 0;
	END;
	
	PROCEDURE Insertar(VAR c: TCola; e: TInfo);
	BEGIN
		{NEW(auxLista);}
		IF (NOT EsColaLlena(c)) THEN 
		BEGIN
			IF (EsColaVacia(c)) THEN 
			BEGIN
				c.inicio:= c.inicio + 1;
			END;
			c.final:= c.final + 1;
			c.longitud:= c.longitud + 1;
			Elem.Asignar(e, c.accesoCola[c.final]);
		END;
	END;

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(c: TCola; VAR e: TInfo);
	BEGIN
		IF (NOT EsColaVacia(c)) THEN 
		BEGIN
			Elem.Asignar(c.accesoCola[c.inicio] , e);
		END;
	END;

	{CONSTRUCTORAS NO GENERADORAS}
	PROCEDURE Eliminar(VAR c: TCola);
	BEGIN
		IF (NOT EsColaVacia(c)) THEN 
		BEGIN
			c.inicio:= c.inicio + 1;
			c.longitud:= c.longitud - 1;
		END;
	END;

	{OBSERVADORAS SELECTORAS}
	FUNCTION EsColaVacia(c: TCola): BOOLEAN;
	BEGIN
		EsColaVacia:= (c.longitud = 0);
	END;

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(c1,c2: TCola): BOOLEAN;
	VAR
		igual: Boolean;
		auxCola1, auxCola2: Integer;

	BEGIN
		IF (c1.longitud = 0) AND (c2.longitud = 0) THEN 
		BEGIN
			igual:= TRUE;
		END
		ELSE IF (c1.longitud <> c2.longitud) THEN 
		BEGIN
			igual:= FALSE;
		END
		ELSE 
		BEGIN
			igual:= FALSE;
			auxCola1:= c1.inicio;
			auxCola2:= c2.inicio;
			WHILE (NOT igual) AND (auxCola1 <= c1.longitud) AND (auxCola2 <= c2.longitud) DO
			BEGIN
				igual:= Elem.Iguales(c1.accesoCola[auxCola1], c2.accesoCola[auxCola2]);
				IF (NOT igual) THEN 
				BEGIN
					auxCola1:= auxCola1 + 1;
					auxCola2:= auxCola2 + 1;
				END;
			END;
		END;
		Iguales:= igual;
	END;
	PROCEDURE Copiar(VAR c2: TCola; c1: TCola);
	VAR
		i: Integer;

	BEGIN
		CrearColaVacia(c2);
		IF (NOT EsColaVacia(c1)) THEN 
		BEGIN
			FOR i:=c1.inicio TO c1.final DO
			BEGIN
				Insertar(c2, c1.accesoCola[i]);							
			END;			
		END;	
	END;

	FUNCTION EsColaLlena(c: TCola): BOOLEAN;
	BEGIN
		EsColaLlena:= (c.longitud = MAX);
	END;
END.	