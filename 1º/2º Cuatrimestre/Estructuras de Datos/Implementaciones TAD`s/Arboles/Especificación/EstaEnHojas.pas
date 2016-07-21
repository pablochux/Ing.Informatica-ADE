{Se quiere saber si dado un elemento se encuentra en una hoja}

	Especificacion ArbolesExt
	USA ArbolesBinBus
	OPERACIONES 
		Observadoras no selectoras
		EstaEnHojas: TipoElemento x TipoArbolBin -> Booleano
	Variables
			e, r: TipoElemento
			hd, hi: TipoArbolBin;

	Ecuaciones
		EstaEnHoja(e, CrearArBolBinVacio) = FALSE
		EstaEnHoja(e, ConstruirArbolBin(hi, r, hd)) = 
				Si e = r ->
					Si EsArbolBinVacio(hi) Y EsArboolBinVacio(hd) ->
						Cierto
					| FALSE
				|Si e > R ->
					EstaEnHoja(e, hd)
				| EstaEnHoja(e, hi)
	FIN ESPECIFICACION
