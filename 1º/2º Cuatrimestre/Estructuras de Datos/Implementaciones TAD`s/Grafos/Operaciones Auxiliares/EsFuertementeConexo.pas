{Es un grafo dirigido}
{Se comprueba que es conexo en todos los nodos}
FUNCTION EsFuertementeConexo (grafo: TipoGrafo): ;
VAR
	es: Boolean;
	lista: TLista;
	conjunto: TConjunto;

BEGIN
	IF (g:= NIL) THEN 
	BEGIN
		EsFuertementeConexo:= TRUE;
	END
	ELSE 
	BEGIN
		Es:= TRUE; 
		Nodos(g, conj);
		WHILE (NOT EsConjuntoVacio(conj)) AND (es) DO
		BEGIN
			Elegir(conj, n);
			Quitar(n, conj);
			CrearVacia(lista);
			Recorrido(g, n, lista);
			Es:= Longitud(lista) = Cardinal(conj2);
		END;
		EsFuertementeConexo:= Es;
	END;
END;