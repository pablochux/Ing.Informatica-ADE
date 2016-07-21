{
	Modifica si el elemento cumple una cierta propiedad, si la cumple lo modifica de una forma
}

PARAMETROS GENERICOS
	Operaciones
		Propiedad: TipoElemento -> Booleano
		Modificar: TipoElemento -> TipoElemento
FIN PARAMETROS

OPERACIONES 
	ModificarSiPropiedad: TipoLista -> TipoLista

VARIABLES
	e: TipoElemento
	lista: TipoLista

ECUACIONES
	ModificarSiPropiedad(CrearVacia) = CrearVacia
	ModificarSiPropiedad(Construir(e, lista)) =
		Si Propiedad(e) ->
			{Se construye }
			Construir(Modificar(e), ModificarSiPropiedad(lista))
		| Construir(e, ModificarSiPropiedad(lista))