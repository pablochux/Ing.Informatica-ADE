
{Recorrido en profundidad}
PROCEDURE Profundidad (g: TGrafo; VAR lista: TLista; nodoInicio: TNodo);
	VAR
		conjunto: TConjNodo;
		Pila: TPIla;
		auxElemento: TElemento;

	BEGIN
		{Se crea vacia la lista en la que se devuelve el recorrido en profundidad}
		CrearVacia(lista);
		{Se crea la pila vacia para el recorrido en profundidad}
		CrearPilaVacia(pila);
		{Se apila el nodo origen en la pila}
		Apilar(nodoInicio, pila);
		WHILE (NOT EsPilaVacia(pila)) DO
		BEGIN
			{Se saca el elemento de la pila y se borra (para avanzar)}
			Cima(pila, auxElemento);
			Desapilar(pila):
			{Si el elemento no pertenece a la lista final}
			IF (NOT Pertenece(auxElemento, lista)) THEN 
			BEGIN	
				{Se inserta al final de la lista}			
				InsertarFinal(auxElemento, lista);
				{Se sacan los adyacentes}
				Adyacentes(g, auxElemento, conjunto);
				{Se van añadiendo los adyacentes a la pila}
				WHILE (NOT EsConjVacio(conjunto)) DO
				BEGIN
					Elegir(conjunto, auxElemento);
					Quitar(conjunto, auxElemento);
					Apilar(pila, auxElemento);
				END;
			END;
		END;
	END;

{Recorrido en anchura (con estructura auxiliar cola)}
PROCEDURE Anchura (g: TGrafo; VAR lista: TLista; n: TNodo);
	VAR
		conjunto: TConjNodo;
		cola: Tcola;
		e: TElemento;

	BEGIN
		{Se crea vacia la lista en la que se devuelve el recorrido en profundidad}
		CrearVacia(lista);
		{Se crea la cola vacia para el recorrido en profundidad}
		CrearcolaVacia(cola);
		Insertar(n, cola);
		WHILE (NOT EscolaVacia(cola)) DO
		BEGIN
			Primero(cola, e);
			Desacolar(cola):
			IF (NOT Pertenece(e, lista)) THEN 
			BEGIN				
				InsertarFinal(e, lista);
				Adyacentes(g, e, conjunto);
				WHILE (NOT EsConjVacio(conjunto)) DO
				BEGIN
					Elegir(conjunto, e);
					Quitar(conjunto, e);
					Acolar(p, cola);
				END;
			END;
		END;
	END;
