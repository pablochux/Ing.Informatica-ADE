{Se pide implementar un programa que borre la ultima aparición de un elemento}
OPERACIONES
	BorrarUltimoElemento: TipoLista x TipoElemento -> TipoLista

VARIABLES
	e: TipoElemento {e es el elemento que se quiere borrar}
	e1: TipoElemento {es el elemento que está en la lista}
	
ECUACIONES
	{Si se pide borrar un elemento de una lista vacia, se da una lista vacia}
	BorrarUltimoElemento(e, CrearVacia) = CrearVacia
	BorrarUltimoElemento(e, Construir(e1, lista)) =
		{En este pertenece ya no está e, porque se ha descompuesto la operación Construir que lo insertaba}
		Si e = e1 Y NO Pertenece(e, lista) 
			{ahora lista no tiene e1, porque se ha descompuesto con el construir que insertaba e a la lista}
			lista 
		{Como es una operación constructora, se construye el elemento y se sigue buscando por la lista}
		| Construir(e1, BorrarUltimoElemento(e, lista))