{Función que devuelve si un grafo es un árbo.
Para que un grafo sea un árbol tiene que ser conexo pero no tener ciclos}
FUNCTION EsArbol (g: TipoGrafo): Boolean;
BEGIN
	{El grafo será árbol si es conexo pero no tiene ciclo}
	EsArbol:= EsConexo(g) AND NOT TieneCiclo(g);
END;