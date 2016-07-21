OPERACIONES
	BorrarUltimoElemento: TipoLista x TipoElemento -> TipoLista

VARIABLES

ECUACIONES
	BorrarUltimoElemento(e, CrearVacia) = CrearVacia
	BorrarUltimoElemento(e, Construir(e1, lista)) =
		Si e = e1 Y NO Pertenece(e, lista)
			lista {ahora lista no tiene e1, porque se ha descompuesto con el e, construir}
		| Construir(e1, BorrarUltimoElemento(e, lista))