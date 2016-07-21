ESPECIFICACION RecorridosArbolesBin
USA ArbolesBinarios, Listas

{ Observadoras no selectoras }
PreOrden: TipoArbolBin -> TipoLista
InOrden: TipoArbolBin -> TipoLista
PostOrden: TipoArbolBin -> TipoLista

ECUACIONES
	PreOrden(CrearArbolBinVacio) = CrearListaVacia
	PreOrden(Construir(hi, raiz, hd)) = 
		Construir(raiz, Concatenar(PreOrden(hi), PreOrden(hd)))

	InOrden(CrearArbolBinVacio) = CrearListaVacia
	InOrden(Construir(hi, r, hd)) =
		Concatenar(InOrden(hi), Construir(raiz, InOrden(hd))

	PostOrden(CrearArbolBinVacio) = CrearListaVacia
	PostOrden(Construir(hi, raiz, hd)) = 
		InsertarFinal(raiz, Concatenar(PostOrden(hi), PostOrden(hd)))