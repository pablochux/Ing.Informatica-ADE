ESPECIFICACION ListaExtension
USA Listas
PARAMETROS GENÉRICOS
	OPERACIONES
		Propiedad: TipoElemento -> Booleano

FIN PARAMETROS GENERICOS
OPERACIONES

	ExistePropiedad: TipoLista -> Booleano

VARIABLES
	lista: TipoLista
	e1: TipoElemento
Ecuaciones
	ExistePropiedad(CrearVacia) = NO/ FALSO
	ExistePropiedad(Construir(e1, lista)) =
		Si Propiedad(e1) ->
			Cierto
		| Construir(e1, ExistePropiedad(lista))