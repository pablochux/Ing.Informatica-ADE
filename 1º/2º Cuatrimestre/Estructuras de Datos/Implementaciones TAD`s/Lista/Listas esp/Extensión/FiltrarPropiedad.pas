{
	La operación FiltrarPropiedad borra todos los elementos que cumplen una determinada propiedad
	FiltrarPropiedad: TipoLista -> TipoLista
}

PARAMETROS GENERICOS
	Operaciones
		Propiedad: TipoElemento -> Booleano
FIN PARAMETROS GENERICOS

FiltrarPropiedad(CrearVacia) = CrearVacia
FiltrarPropiedad(Construir(e, lista)) =
	Si Propiedad(e)
		FiltrarPropiedad(lista) {Además de eliminarse el elemento, se siguen buscando elementos para eliminar}
	| Construir(e, FiltrarPropiedad(lista))