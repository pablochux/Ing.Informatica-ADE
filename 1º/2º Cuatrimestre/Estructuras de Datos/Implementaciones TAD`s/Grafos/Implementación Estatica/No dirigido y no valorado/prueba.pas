PROGRAM prueba;
USES Grafo, Nodo, Arco, ConjuntoNodos, ConjuntoArcos;
VAR
	miGrafo: TipoGrafo;

BEGIN
	Grafo.CrearGrafoVacio(miGrafo);
	writeln(Grafo.EsGrafoVacio(miGrafo));
	Grafo.InsertarNodo(miGrafo, 1);
	writeln(Grafo.EsGrafoVacio(miGrafo));
	Grafo.BorrarNodo(miGrafo, 1);
	writeln(Grafo.EsGrafoVacio(miGrafo));
END.