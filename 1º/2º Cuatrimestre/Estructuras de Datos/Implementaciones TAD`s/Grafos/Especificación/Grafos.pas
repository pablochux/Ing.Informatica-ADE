ESPECIFICACION Grafos
PARAMETROS GENERICOS
	Tipos
		TipoNodo, TipoArco
FIN PARAMETROS GENERICOS

TIPOS 
	TipoGrafo



OPERACIONES
	{ Constructoras generadoras }
	CrearGrafoVacio: -> TipoGrafo
	InsertarNodo: TipoGrafo x TipoNodo -> TipoGrafo
	InsertarArco: TipoGrafo x TipoArco -> TipoGrafo

	{Observadoras Selectoras}
	Nodos: TipoGrafo -> TipoConjuntoNodos
	Arcos: TipoGrafo -> TipoConjuntoArcos

	{Observadoras No selectoras}
	EsGrafoVacio: TipoGrafo -> Booleano
	Adyacentes: TipoGrafo -> TipoConjuntoNodos

	{Constructoras no generadoras}
	BorrarArco: TipoGrafo x TipoArco -> TipoGrafo
	BorrarNodo: TipoGrafo x TipoNodo -> TipoGrafo

	ExtremosIguales: TipoArco x TipoArco -> Booleano


ECUACIONES

	Nodos(CrearGrafoVacio) = CrearConjuntoVacio
	Nodos(InsertarNodo(grafo, nodo)) =
		Poner(nodo, Nodos(grafo));
	Nodos(InsertarArco(grafo, arco)) = 
		Poner(Extremo1(arco), Poner(Extremo2(arco)), Nodos(g))

	Arcos(CrearGrafoVacio) = CrearConjuntoVacio
	Arcos(InsertarArco(grafo, arco)) =
		Poner(arco, Arcos(BorrarArco(grafo, arco)))
	Arcos(InsertarNodo(grafo, nodo)) =
		Arcos(g)