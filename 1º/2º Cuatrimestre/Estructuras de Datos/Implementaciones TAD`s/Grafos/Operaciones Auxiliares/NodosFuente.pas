PROCEDURE NodosFuente (grafo: TGrafo; VAR lista: TLista);
VAR
	conjuntoNodos: TipoConjuntoNodos;
	
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