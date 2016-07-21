{Inserta detrás de todos los elementos que cumplan una propiedad el elemento pasado como parametro}
ESPECIFICACION ListaExt
USA Listas
PARAMETROS GENERICOS
	Operaciones
		Propiedad: TipoElemento -> Booleano
FIN PARAMETROS GENERICOS

InsertarDespuesSiPropiedad: TipoElemento x TipoLista -> TipoLista
Variables
	e:
	e1:
	lista:

Ecuaciones
	InsertarDespuesSiPropiedad(CrearVacia) = CrearVacia
	InsertarDespuesSiPropiedad(e, Construir(e1, lista)) =
		Si Propiedad(e1) ->
			Construir(e1, Construir(e, InsertarDespuesSiPropiedad(e, lista))
		| Construir(e1, InsertarDespuesSiPropiedad(e, lista))
