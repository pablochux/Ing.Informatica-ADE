{Se pide especificar una operación que dada una lista y un elemento, te devuelva la lista a partir del elemento (sin contarlo), si el elemento no está, devuelve vacia}
PosFijo: TipoLista x TipoElemento -> TipoLista

ECUACIONES
	PosFijo(CrearVacia) = CrearVacia
	PosFijo(Construir(e, lista), e1) = 
		Si e = e1 ->
			lista
		| PosFijo(lista, e1)