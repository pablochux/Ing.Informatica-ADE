{Especificación operación BorrarUltimo de una lista}
OPERACIONES
	BorrarUltimo: TipoLista -> TipoLista
VARIABLES
	e: TipoElemento
	lista: TipoLista

ECUACIONES
	BorrarUltimo(CrearVacia) = CrearVacia
	BorrarUltimo(Construir(e, lista)) =
		Si EsVacia(lista) ->
			CrearVacia
		| Construir(e, BorrarUltimo(lista))
		{Como se saca el elemento pero no es el que se quiere borrar, se mete y se sigue buscando por la lista}