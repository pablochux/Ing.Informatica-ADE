{En la implementación sobre listas: la operación Elegir, se debe implementar llamando a Primero. 
la operación Poner, se debe implementar llamando a Construir (después de comprobar que el elemento no Pertenece al conjunto). 
las operaciones Unión, Intersección y Diferencia, deben implementarse como lo hicimos en clase. }

UNIT Conjunto;
INTERFACE
	USES Lista, Elem;
	TYPE
		TInfo = TElem;
		TConjunto = TLista;

	{Cabeceras Subprogramas}

	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = Devuelve un conjunto vacío}
	PROCEDURE Poner(VAR c: TConjunto; e: TInfo);{O(?)}
	{Pre = c es un conjunto que puede tener o no elementos}
	{Post = c contiene a e}

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsConjuntoVacio(c: TConjunto): Boolean;{O(?)}
	{Pre = TRUE}
	{Post = c = []}
	FUNCTION Pertenece(c: TConjunto; e: TInfo): Boolean;{O(?)}
	{Pre = TRUE}
	{Post = devuelve TRUE si e pertenece a c}
	FUNCTION Cardinal(c: TConjunto): integer;{O(?)}
	{Pre = TRUE}
	{Post = devuelve el número de elementos diferentes que contiene c }
	FUNCTION EsSubConjunto(c1,c2: TConjunto): Boolean;{O(?)}
	{Pre = TRUE}
	{Post = Devuelve TRUE si c1 contiene todos los elementos de c2}

	{ OBSERVADORAS SELECTORAS }
	PROCEDURE Elegir(c: TConjunto; VAR e: TInfo);{O(?)}
	{Pre = c no es vacío}
	{Post = e es un elemento que pertence a c}
	
	{ CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE Quitar(VAR c: TConjunto; e: TInfo);{O(?)} {FALLO}
	{Pre = TRUE}
	{Post = e no pertenece a c}
	PROCEDURE Union(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)} {FALLO}
	{Pre = TRUE}
	{Post = c3 es la unión de c1 y c2}
	PROCEDURE Interseccion(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = c3 es la interseccion de c1 y c2}
	PROCEDURE Diferencia(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = c3 es la diferencia entre c1 y c2, c1 - c2}

	{ OPERACIONES AUXILIARES }
	FUNCTION Iguales(c1, c2: TConjunto): Boolean;{O(?)} {FALLO}
	{Pre = TRUE}
	{Post = devuelve TRUE si c1 y c2 contienen los mismos elementos}
	PROCEDURE Copiar(VAR c2: TConjunto; c1: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = devuelve una copia del conjunto c1 en c2}
	PROCEDURE Destruir(VAR c: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = devuelve un conjunto vacío}

IMPLEMENTATION
	{Subprogramas}
	
	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);{O(?)}
	BEGIN
		Lista.CrearListaVacia(c);
	END;
	
	PROCEDURE Poner(VAR c: TConjunto; e: TInfo);{O(?)}
	BEGIN
		IF (NOT Pertenece(c, e)) THEN 
		BEGIN
			Lista.Construir(c, e);
		END;
	END;

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsConjuntoVacio(c: TConjunto): Boolean;{O(?)}
	BEGIN
		EsConjuntoVacio:= Lista.EsListaVacia(c);
	END;
	
	FUNCTION Pertenece(c: TConjunto; e: TInfo): Boolean;{O(?)}
	BEGIN
		Pertenece:= Lista.Pertenece(c, e);
	END;
	
	FUNCTION Cardinal(c: TConjunto): integer;{O(?)}
	BEGIN
		Cardinal:= Lista.Longitud(c);
	END;
	
	FUNCTION EsSubConjunto(c1,c2: TConjunto): Boolean;{O(?)}
	VAR
		auxConjunto: TConjunto;

	BEGIN
		Conjunto.Union(c1, c2, auxConjunto);
		EsSubConjunto:= Iguales(c1, auxConjunto);
	END;
	
	{ OBSERVADORAS SELECTORAS }
	PROCEDURE Elegir(c: TConjunto; VAR e: TInfo);{O(?)}
	BEGIN
		IF (NOT EsConjuntoVacio(c)) THEN 
		BEGIN
			Lista.Primero(c, e);
		END;
	END;
	
	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE Quitar(VAR c: TConjunto; e: TInfo);{O(?)}
	BEGIN
		Lista.BorrarElemento(c, e);
	END;

	PROCEDURE Union(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	VAR
		auxConjunto: TConjunto;
		auxElemento: TInfo;

{	BEGIN
		CrearConjuntoVacio(c3);
		Copiar(auxConjunto, c1);
		WHILE (NOT EsConjuntoVacio(auxConjunto)) DO
		BEGIN
			Elegir(auxConjunto, auxElemento);
			Quitar(auxConjunto, auxElemento);
			IF (NOT Pertenece(auxConjunto, auxElemento)) THEN 
			BEGIN
				Poner(c3, auxElemento);
			END;
		END;
		Copiar(auxConjunto, c2);
		WHILE (NOT EsConjuntoVacio(auxConjunto)) DO
		BEGIN
			Elegir(auxConjunto, auxElemento);
			Quitar(auxConjunto, auxElemento);
			IF (NOT Pertenece(auxConjunto, auxElemento)) THEN 
			BEGIN
				Poner(c3, auxElemento);
			END;
		END;
	END;
}
	BEGIN
		BEGIN
		CrearConjuntoVacio(c3);
		Copiar(c1, c3);
		Copiar(auxConjunto, c2);
		WHILE (NOT EsConjuntoVacio(auxConjunto)) DO
		BEGIN
			Elegir(auxConjunto, auxElemento);
			Quitar(auxConjunto, auxElemento);
			IF (NOT Pertenece(auxConjunto, auxElemento)) THEN 
			BEGIN
				Poner(c3, auxElemento);
			END;
		END;
	END;
	
	PROCEDURE Interseccion(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	VAR
		auxConjunto: TConjunto;

	BEGIN
		Diferencia(c1, c2, auxConjunto);
		Diferencia(c1, auxConjunto, c3);
	END;
	
	PROCEDURE Diferencia(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	VAR
		auxConjunto: TConjunto;
		auxElemento: TInfo;

	BEGIN
		CrearConjuntoVacio(c3);
		Conjunto.Copiar(c3, c1);
		Conjunto.Copiar(auxConjunto, c2);
		WHILE (NOT EsConjuntoVacio(auxConjunto)) DO 
		BEGIN
			Conjunto.Elegir(auxConjunto, auxElemento);
			Conjunto.Quitar(auxConjunto, auxElemento);
			IF (Conjunto.Pertenece(c3, auxElemento)) THEN 
			BEGIN
				Conjunto.Quitar(c3, auxElemento);
			END;
		END;
	END;
	

	{ OPERACIONES AUXILIARES }
	FUNCTION Iguales(c1, c2: TConjunto): Boolean;{O(?)}
	VAR
		auxConjunto1, auxConjunto2: TConjunto;
		igual: Boolean;

	BEGIN
		Copiar(auxConjunto1, c1);
		Copiar(auxConjunto2, c2)
		igual:= TRUE;
		WHILE (NOT EsConjuntoVacio(auxConjunto1) AND (igual)) DO
		BEGIN
			Elegir(auxConjunto1, auxElemento);
			Quitar(auxConjunto1, auxElemento);
			igual:= Pertenece(auxConjunto2, auxElemento);
		END;
		WHILE (NOT EsConjuntoVacio(auxConjunto2) AND (igual)) DO
		BEGIN
			Elegir(auxConjunto2, auxElemento);
			Quitar(auxConjunto2, auxElemento);
			igual:= Pertenece(auxConjunto1, auxElemento);
		END;
		Iguales:= igual;
	END;

	PROCEDURE Copiar(VAR c2: TConjunto; c1: TConjunto);{O(?)}
	BEGIN
		Lista.Copiar(c2, c1);
	END;
	PROCEDURE Destruir(VAR c: TConjunto);{O(?)}
	VAR
		auxElemento: TInfo;

	BEGIN
		WHILE (NOT EsConjuntoVacio(c)) DO
		BEGIN
			Conjunto.Elegir(c, auxElemento);
			Conjunto.Quitar(c, auxElemento);
		END;
	END;
END.