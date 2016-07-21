{Un grafo será conexo si la longitud de su recorrido es igual al número de elementos que tiene}
FUNCTION Conexo (g: TipoGrafo): Boolean;
VAR
	conjuntoNodos: TipoConjuntoNodos;
	lista: TipoLista;
BEGIN
	IF (EsGrafoVacio(g)) THEN 
	BEGIN
		Conexo:= TRUE;
	END
	ELSE 
	BEGIN
		Nodos(g, conjuntoNodos);
		Elegir(conjuntoNodos, n);
		Recorrido(g, n, lista);
		Conexo:= (Longitud(lista) = Cardinal(conj));
	END;
END;