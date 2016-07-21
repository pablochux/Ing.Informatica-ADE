{Nodo fuente es el nodo que tiene adyacentes pero otros nodos no lo tienen como adyacente, es decir, solo tiene arcos de salida no de entrada}
PROCEDURE NodosFuente (grafo: TGrafo; VAR lista: TLista);
VAR
	
BEGIN
	CrearListaVacia(lista);
	Nodos(grafo, conjuntoNodos);
	WHILE (NOT EsConjuntoVacio(conjuntoNodos)) DO
	BEGIN
		Elegir(conjuntoNodos, nodo);
		Quitar(conjuntoNodos, nodo);
		IF (TieneAdyacentes(grafo, nodo) AND (NOT EstaComoDestino(grafo, nodo)) THEN 
		BEGIN
			InsertarFinal(n, lista);
		END;
	END;
END;