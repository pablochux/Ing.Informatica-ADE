{Implementación Cola Circular}
UNIT TADCola;
INTERFACE
USES TADELem;
	TYPE
		TipoCola = ^TipoNodo;
		TipoNodo = RECORD
			info: TipoElemento;
			sig: TipoCola;
		END;
	{Cabeceras Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearColaVacia(VAR cola: TipoCola);{O(1)}
	{Pre = TRUE}
	{Post = devuelve la cola vacía}
	PROCEDURE Insertar(VAR cola: TipoCola; e: TipoElemento);{O(1)}
	{Pre = recibe una cola que puede ser vacía o no}
	{Post = devuelve la cola con el elemento e en la última posición}
	
	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(cola: TipoCola; VAR e: TipoElemento);{O(1)}
	{Pre = Recibe la cola no vacía}
	{Post = devuelve el primer elemento de la cola}
	PROCEDURE Eliminar(VAR cola: TipoCola);{O(1)}
	{Pre = recibe una cola no vacía}
	{Post = devuelve la cola sin el primer elemento}

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsColaVacia(cola: TipoCola): BOOLEAN;{O(1)}
	{Pre = recibe una cola que puede ser vacía o no}
	{Post = devuelve TRUE si la cola es vacía, FALSE en caso contrario}

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(c1,c2: TipoCola): BOOLEAN;{O(n)}
	{Pre = recibe una cola que puede ser vacía o no}
	{Post = devuelve TRUE si las dos colas son iguales}
	PROCEDURE Copiar(VAR c2: TipoCola; c1: TipoCola);{O(n)}
	{Pre = recibimos una cola que puede ser vacía o no}
	{Post = devolvemos una nueva cola que es una copia exacta de la primera}
	PROCEDURE Destruir(VAR cola: TipoCola); {O(n)}
	{Pre = TRUE}
	{Post = devuelve la cola vacía}

IMPLEMENTATION
{Subprogramas}
	{Cabeceras Subprogramas}
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearColaVacia (VAR cola: TipoCola);{O(1)}
	BEGIN
		cola:= NIL;
	END;
	
	PROCEDURE Insertar (VAR cola: TipoCola; e: TipoElemento);{O(1)}
	VAR
		auxCola: TipoCola;

	BEGIN
		NEW(auxCola);
		TADELem.Asignar(e, auxCola^.info);
		IF (EsColaVacia(cola)) THEN 
		BEGIN
			auxCola^.sig:= auxCola;
		END
		ELSE 
		BEGIN
			auxCola^.sig:= cola^.sig;
			cola^.sig:= auxCola;
		END;
		cola:= auxCola;
	END;
	
	
	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(cola: TipoCola; VAR e: TipoElemento);{O(1)}
	BEGIN
		IF (NOT EsColaVacia(cola)) THEN 
		BEGIN
			TADELem.Asignar(cola^.sig^.info, e);
		END;
	END;
	
	PROCEDURE Eliminar(VAR cola: TipoCola);{O(1)}
	VAR
		auxPuntero: TipoCola;

	BEGIN
		IF (NOT (EsColaVacia(cola))) THEN 
		BEGIN
			IF (cola = cola^.sig) THEN 
			BEGIN
				auxPuntero:= cola;
				CrearColaVacia(cola);
			END
			ELSE 
			BEGIN
				auxPuntero:= cola^.sig;
				cola^.sig:= cola^.sig^.sig;
			END;
			DISPOSE(auxPuntero);
		END;
	END;
	

	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsColaVacia(cola: TipoCola): BOOLEAN;{O(1)}
	BEGIN
		EsColaVacia:= (cola = NIL);
	END;
	

	{OPERACIONES AUXILIARES}
	FUNCTION Iguales(c1,c2: TipoCola): BOOLEAN;{O(n)}
	VAR
		igual: Boolean;
		auxCola1, auxCola2: TipoCola;

	BEGIN
		{Comprobación último elemento de la cola sea NIL. Si uno es, o si los dos lo son}
		IF (c1 = NIL) OR (c2 = NIL) THEN 
		BEGIN
			igual:= (c1 = c2);
		END
		{Como ya hemos comprobado si son NIL, ya podemos acceder a sus campos ya que no serán NIL}
		ELSE 
		BEGIN
			{Se comprueba si el último elemento es igual}
			igual:= TADELem.Iguales(c1^.info, c2^.info); 
			{Se comprueba el resto de la lista}
			auxCola1:= c1^.sig;
			auxCola2:= c2^.sig;
			WHILE (auxCola1 <> c1) AND (auxCola2 <> c2) AND (igual) DO
			BEGIN
				igual:= TADELem.Iguales(c1^.info, c2^.info);
				IF (igual) THEN 
				BEGIN
					auxCola1:= auxCola1^.sig;
					auxCola2:=auxCola2^.sig;
				END;
			END;
			IF  ((auxCola1 <> c1) OR (auxCola2 <> c2)) AND (igual) THEN 
			BEGIN
				igual:= FALSE;
			END;
		END;
		Iguales:= igual;
	END;
	
	PROCEDURE Copiar(VAR c2: TipoCola; c1: TipoCola);{O(n)}
	BEGIN
		CrearColaVacia(c2);
		IF (NOT EsColaVacia(c1)) THEN 
		BEGIN
			WHILE (c1^.sig <> c1) DO
			BEGIN
				Insertar(c2, c1^.info);
				c1:= c1^.sig;
			END;
			Insertar(c2, c1^.info);
		END;
		
	END;
	
	PROCEDURE Destruir(VAR cola: TipoCola); {O(n)}
	BEGIN
		WHILE (NOT EsColaVacia(cola)) DO
		BEGIN
			Eliminar(cola);
		END;
	END;
END.