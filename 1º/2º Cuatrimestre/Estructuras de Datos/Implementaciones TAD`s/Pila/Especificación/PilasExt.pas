{Especificar un subprograma que borre la posicion N que se le pasa. Si se pide una posicion que no está, no se elimina}
EliminarN: TipoPila x Positivo -> TipoPila
Variables
	n: Positivo
	pila: TipoPila
Ecuaciones
	{Como no es una operación parcial hay que especificar su comportamiento para el caso que la lista sea vacia}
	EliminarN(CrearVacia, n) = CrearVacia
	EliminarN(Apilar(pila, elem), n) =
		Si n = 1 
			pila
		| Apilar(EliminarN(pila, n - 1), elem)