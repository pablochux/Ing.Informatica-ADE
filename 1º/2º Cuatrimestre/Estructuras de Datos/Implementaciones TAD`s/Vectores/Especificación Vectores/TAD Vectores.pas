ESPECIFICACION Vectores
PARÁMETROS GENÉRICOS
	TIPOS TipoElemento, TipoRango
FIN PARAMETROS
TIPOS TipoVector

OPERACIONES
	( Constructoras Generadoras )
	VectorVacio: -> TipoVector
	Asignar: TipoVector x TipoRango x TipoElemento -> TipoVector
	( Obs. Selectoras )
	{Parcial} Valor: TipoVector x TipoRango -> TipoElemento

	( Obs. No Selectoras)
	Existe: TipoVector x TipoRango -> Booleano

	PARAMETROS GENERICOS
		OPERACIONES
			ModificarElemento: TipoElemento -> TipoElemento
	FIN PARAMETROS GENERICOS
	Modificar: TipoVector -> TipoVector



ECUACIONES DE DEFINITUD
	Si Existe(v, i) ->
		DEF (Valor(v, i))

ECUACIONES ENTRE GENERADORAS 
	Asignar(Asignar(v, i, e1), j, e2) =
		Si i = j
			Asignar(v, i, e2)
		| Asignar(Asignar(v, j, e2), i, e1)

ECUACIONES
	Valor(Asignar(v, i, e), j) =
		Si i = j ->
			e 
		| Valor(v, j)
		
	Existe(VectorVacio, j) = FALSO
	Existe(Asignar(v, i, e), j) =
		Si i = j
			Cierto
		| Existe(v, j)

	Modificar(VectorVacio) = VectorVacio
	Modificar(Asignar(v, i, e)) =
		Asignar(Modificar(v), i, ModificarElemento(e))	