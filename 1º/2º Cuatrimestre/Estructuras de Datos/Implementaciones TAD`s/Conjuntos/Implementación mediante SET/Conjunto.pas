{En el caso de la implementación con SET, mostrar siempre el conjunto de forma "ordenada" respecto al tipo elemento. }
UNIT Conjunto;
INTERFACE
	CONST
		INI = 1;
		MAX = 100;

	TYPE
		TipoSubRangoConjunto = INI..MAX;
		TInfo = TipoSubRangoConjunto;
		TConjunto = SET of TipoSubRangoConjunto;


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
	PROCEDURE Quitar(VAR c: TConjunto; e: TInfo);{O(?)}
	{Pre = TRUE}
	{Post = e no pertenece a c}
	PROCEDURE Union(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = c3 es la unión de c1 y c2}
	PROCEDURE Interseccion(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = c3 es la interseccion de c1 y c2}
	PROCEDURE Diferencia(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = c3 es la diferencia entre c1 y c2, c1 - c2}

	{ OPERACIONES AUXILIARES }
	FUNCTION Iguales(c1, c2: TConjunto): Boolean;{O(?)}
	{Pre = TRUE}
	{Post = devuelve TRUE si c1 y c2 contienen los mismos elementos}
	PROCEDURE Copiar(VAR c2: TConjunto; c1: TConjunto);{O(?)}
	{Pre = TRUE}
	{Post = devuelve una copia del conjunto c1 en c2}

IMPLEMENTATION
	{Subprogramas}
	
	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);{O(?)}
	BEGIN
		c:= [];
	END;
	
	PROCEDURE Poner(VAR c: TConjunto; e: TInfo);{O(?)}
	BEGIN
		c:= c + [e];
	END;
	
	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsConjuntoVacio(c: TConjunto): Boolean;{O(?)}
	BEGIN
		EsConjuntoVacio:= (c = []);
	END;
	
	FUNCTION Pertenece(c: TConjunto; e: TInfo): Boolean;{O(?)}
	BEGIN
		Pertenece:= (e IN c);
	END;
	
	FUNCTION Cardinal(c: TConjunto): integer;{O(?)}
	VAR
		auxElemento: TInfo;
		auxConjunto: TConjunto;
		contador: Integer;

	BEGIN
		contador:= 0;
		Copiar(auxConjunto, c);
		WHILE (NOT EsConjuntoVacio(auxConjunto)) DO
		BEGIN
			Elegir(auxConjunto, auxElemento);
			Quitar(auxConjunto, auxElemento);
			contador:= contador + 1;
		END;
		Cardinal:= contador;
	END;

	{FormaAlternativa 
	FUNCTION Cardinal (c: TipoConjunto): Integer;
	VAR
		auxCardinal: TipoConjunto;
		i: Integer;

	BEGIN
		auxCardinal:= 0;
		IF (NOT EsConjuntoVacio(c)) THEN 
		BEGIN
			FOR i:=INI TO MAX DO
			BEGIN
				IF (Pertenece(c, i)) THEN 
				BEGIN
					auxCardinal:= auxCardinal + 1;
				END;
			END;
		END;
	END;}
	
	FUNCTION EsSubConjunto(c1,c2: TConjunto): Boolean;{O(?)}
	VAR
		auxConjunto: TConjunto;

	BEGIN
		Union(c1, c2, auxConjunto);
		EsSubConjunto:= (c1 = auxConjunto);
	END;
	
	{ OBSERVADORAS SELECTORAS }
	PROCEDURE Elegir(c: TConjunto; VAR e: TInfo);{O(?)}
	VAR
		i: TInfo;

	BEGIN
		IF (NOT EsConjuntoVacio(c)) THEN 
		BEGIN
			Randomize;
			i:= RANDOM(MAX) + 1;
			WHILE (NOT Pertenece(c, i)) DO
			BEGIN
				IF (i = 99) THEN 
				BEGIN
					i:= 1;
				END
				ELSE 
				BEGIN
					i:= succ(i);
				END;
			END;
			e:= i;
		END;
	END;
	
	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE Quitar(VAR c: TConjunto; e: TInfo);{O(?)}
	BEGIN
		c:= c - [e];
	END;

	PROCEDURE Union(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	BEGIN
		c3:= c1 + c2;
	END;
	
	PROCEDURE Interseccion(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	BEGIN
		c3:= c1 * c2;
	END;
	
	PROCEDURE Diferencia(c1,c2: TConjunto; VAR c3: TConjunto);{O(?)}
	BEGIN
		c3:= c1 - c2;
	END;
	

	{ OPERACIONES AUXILIARES }
	FUNCTION Iguales(c1, c2: TConjunto): Boolean;{O(?)}
	BEGIN
		Iguales:= (c1 = c2);
	END;

	PROCEDURE Copiar(VAR c2: TConjunto; c1: TConjunto);{O(?)}
	BEGIN
		c2:= c1;
	END;
END.