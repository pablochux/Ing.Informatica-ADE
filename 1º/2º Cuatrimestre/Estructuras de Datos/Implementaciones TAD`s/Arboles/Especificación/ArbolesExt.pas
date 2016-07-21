ESPECIFICACION ArbolExt
Operaciones
	EliminarHojas: TipoArbol -> TipoArbol
	NumNodos: TipoArbol -> Integer
	SubArbolNodoDado: TipoArbol x TipoElemento -> 

Ecuaciones
	EliminarHojas(CrearArbolVacio) = CrearArbolVacio
	EliminarHojas(Construir(hd, raiz, hi)) =
		Si EsArbolVacio(hd) Y EsArbolVacio(hi) ->
			{Como es una hoja, se devuelve un vacio}
			CrearArbolVacio 
		| Construir(EliminarHojas(hd), raiz, EliminarHojas(hi))


	NumNodos(CrearArbolVacio) = 0
	NumNodos(Construir(hi, raiz, hd)) =
		1 + NumNodos(hi) + NumNodos(hd

	{Es una operación parcial}
	SubArbolNodoDado(ConstruirArbolBin(hi, raiz, hd), e1) =	
		Si raiz = e1 -> 
			ConstruirArbolBin(hi, raiz, hd)
		| Si Pertenece(e1, hd) ->
			SubArbolNodoDado(hd, e1)
		| SubArbolNodoDado(hi)

		Pertenece(CrearArbolVacio) = Falso
		Pertenece(ConstruirArbolBin(hi, raiz, hd), e1) =
			Si raiz = e1
				Cierto
			| Pertenece(hi, e1) O Pertenece(hd, e1)