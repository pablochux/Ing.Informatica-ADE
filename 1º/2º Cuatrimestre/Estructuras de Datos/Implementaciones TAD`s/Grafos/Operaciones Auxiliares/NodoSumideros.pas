{Se pide implementar un subprograma que devuelva en una lista los nodos que son Sumidero, es decir que solo le apuntan adyacentes pero el no apunta a ninguno}
PROCEDURE NodosSumidero (g: TGrafo; VAR lista: TLista);
VAR
	conjuntoNodos: TConjunto;

BEGIN
	CrearListaVacia(lista);
	{Se ponen todos los nodos del grafo en un conjunto}
	Nodos(grafo, conjuntoNodos);
	{Se recorre todo el conjunto}
	WHILE (NOT EsConjuntoVacio(conjuntoNodos)) DO
	BEGIN
		Elegir(conjuntoNodos, nodo);
		Quitar(conjunto, Nodos);
		{Si no tiene adyacentes y está en alguna lista de }
		IF (NOT Adyacentes(grafo, nodo) AND (EstaComoDestino(grafo, nodo))) THEN 
		BEGIN
			InsertarFinal(n, lista);
		END;
	END;
END;

{Se busca que el nodo este como adyacente en alguna lista de adyacencia de algún nodo}
FUNCTION EstaComoDestino (grafo: TGrafo): Boolean;
VAR
	encontrado:= Boolean;
	listAdyacencia: TipoListaAdyacencia;

BEGIN
	encontrado:= FALSE;
	{Se recorre la lista directorio}
	WHILE (NOT encontrado) AND (grafo <> NIL) DO
	BEGIN
		{Se recorre la lista adyacentes}
		listAdyacencia:= grafo^.accesoLista;
		WHILE (listAdyacencia <> NIL) AND (NOT encontrado) DO
		BEGIN
			encontrado:= listAdyacencia^.destino = nodo;
			IF (NOT encontrado) THEN 
			BEGIN
				listAdyacencia:= listAdyacencia^.sig;
			END;
		END;
		grafo:= grafo^.sig;
	END;
	EstaComoDestino:= encontrado;
END;

FUNCTION TieneAdyacentes (grafo: TGrafo; nodo: TNodo): Boolean;
VAR
	
BEGIN
	WHILE (NOT g^.origen = nodo) DO
	BEGIN
		grafo:= grafo^.sig;
	END;
	TieneAdyacentes:= (grafo^.accesoLista <> NIL);
END;