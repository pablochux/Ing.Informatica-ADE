ESPECIFICACION QuadTree
PARAMETROS GENERICOS
	Tipos: TipoInteger+
FIN PARAMETROS
Tipos: TipoQuadTree
OPERACIONES
	{Constructoras generadoras}
		CrearArbolVacio: -> TipoQuadTree
		Construir: TipoQuadTree x TipoQuadTree x TipoQuadTree x TipoQuadTree x TipoElemento -> TipoQuadTree

	{Observadoras Selectoras}
	{Parcial} Raiz: TipoQuadTree -> TipoImagen
	{Parcial} Hijo1: TipoQuadTree -> TipoQuadTree
	{Parcial} Hijo2: TipoQuadTree -> TipoQuadTree
	{Parcial} Hijo3: TipoQuadTree -> TipoQuadTree
	{Parcial} Hijo4: TipoQuadTree -> TipoQuadTree

	{Observadoras no selectoras}
		EsArbolVacio: TipoQuadTree -> Boolean

	
	VARIABLES

	ECUACIONES DE DEFINITUD
		Si NoEsArbolVacio(arbol) ->
			DEF(Raiz(arbol))

		Si NoEsArbolVacio(arbol) ->
			DEF(Hijo1(arbol))	

		Si NoEsArbolVacio(arbol) ->
			DEF(Hijo2(arbol))	

		Si NoEsArbolVacio(arbol) ->
			DEF(Hijo3(arbol))	

		Si NoEsArbolVacio(arbol) ->
			DEF(Hijo4(arbol)

ECUACIONES
	Raiz(Construir(h1, h2, h3, h4, R)) = R
	Raiz(Construir(h1, h2, h3, h4, R)) = h1
	Raiz(Construir(h1, h2, h3, h4, R)) = h2
	Raiz(Construir(h1, h2, h3, h4, R)) = h3
	Raiz(Construir(h1, h2, h3, h4, R)) = h4