ESPECIFICACION Vectores
PARAMETROS GENERICOS
	Tipo
		TipoElemento, TipoRango
FIN PARAMETROS GENERICOS

OPERACIONES 
	{Constructoras generadoras}
	CrearVectorVacio:-> TipoVector {Con CrearVacia}
	Asignar: TipoVector x TipoRango x TipoElemento -> TipoVector

	{Observadoras selectoras}
	{PARCIAL} Valor: TipoVector x TipoRango -> TipoElemento

	{Observadoras no selectoras}
	EsAlmacenVacio: TipoVector -> Booleano
	Existe: TipoVector x TipoRango -> Booleano

	{Constructoras no generadoras}
	Concatenar: TipoVector x TipoVector -> TipoVector
	EliminarElemento: TipoVector x TipoRango -> TipoVector

	PARAMETROS GENERICOS
		OPERACIONES
			ModificarElemento: TipoElemento -> TipoElemento;
	FIN PARAMETROS
	ModificarAlmacen: TipoVector -> TipoVector

VARIABLES
vector 
elemento

ECUACIONES ENTRE GENERADORAS 
	Asignar(Asignar(vector, i, e1), j, e2) =
		Si i <> j ->
			Asignar(Asignar(u, j, e2), i , e1)
		|Si e2 > e1 ->
			Asignar(u, j, e2)
		| Asignar(u, i, e1)

ECUACIONES DE DEFINITUD
	Si Existe(u, i ) ->
		DEF (Valor(v, i))

ECUACIONES
	Valor(Asignar(v, i, e), j) =
			Si i = j ->
				e
			|Valor(v, j)
	Existe(VectorVacio, i) = FALSO
	Existe(Asignar(u, i ,e), j)
		Si i =  j ->
			cierto
		| Existe(v, j)

	EsVectorVacio(VectorVacio) = cierto
	EsVectorVacio(Asignar(u, i, e)) = FALSO

	Eliminar(VectorVacio, i) = VectorVacio
	Eliminar(Asignar(v, i, e), j) =
		Si (i = j)->
			Eliminar(v, j)
		|Asignar(Eliminar(v, j), i, e)

	Concatenar(VectorVacio, VectorVacio) = VectorVacio
	Concatenar(VectorVacio, Asignar(u, j, e)) = Asignar(v, j, e)
	Concatenar(Asignar(u, j, e), VectorVacio) = Asignar(v, j, e)
	Concatenar(Asignar(v1, i, e1), Asignar(v2, j, e2)) =
				Concatenar(Asignar(Asignar(v1, j, e1), i, e1), v2)
	