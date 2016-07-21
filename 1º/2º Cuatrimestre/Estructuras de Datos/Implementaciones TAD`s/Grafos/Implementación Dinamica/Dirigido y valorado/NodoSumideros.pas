{Nodo sumidero es el nodo que no tiene adyacentes pero otros nodos si lo tienen como adyacente, es decir, no tiene ningún arco saliente de el, pero si tiene arcos que le apuntan}
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
		{Se saca un nodo y se elimina, para que no se vuelva a mirar}
		Elegir(conjuntoNodos, nodo);
		Quitar(conjunto, Nodos);
		{Si no tiene adyacentes y está en alguna lista de }
		IF (NOT Adyacentes(grafo, nodo) AND (EstaComoDestino(grafo, nodo))) THEN 
		BEGIN
			{Se inserta por el final de la lista}
			InsertarFinal(n, lista);
		END;
	END;
END;

{Función que devuelve si el nodo está como adyacente en la lista de adyacencia de algún nodo}
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
			{Si el elemento se encuentra en la lista de adyacencia}
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
	{Se recorre la listadirectorio hasta que se encuentra el nodo}
	WHILE (NOT g^.origen = nodo) DO
	BEGIN
		grafo:= grafo^.sig;
	END;
	{Se mira si tiene algo en la lista de adyacencia}
	TieneAdyacentes:= (grafo^.accesoLista <> NIL);
END;