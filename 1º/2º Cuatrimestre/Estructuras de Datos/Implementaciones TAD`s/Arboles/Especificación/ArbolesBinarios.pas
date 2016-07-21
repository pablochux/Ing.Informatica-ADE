ESPECIFICACION ArbolesBinarios
PARAMETROS GENERICOS
	Tipos
		TipoElemento
FIN PARAMETROS GENERICOS
Tipos
	TipoArbolBin

OPERACIONES
	{ Const. Generadoras }
	CrearArbolBinVacio: -> TipoArbolBin
	ConstruirArbolBin: TipoArbolBin x TipoElemento x TipoArbolBin -> TipoArbolBin

	{ Obs. Selectoras }
	{PARCIAL} Raiz: TipoArbolBin -> TipoElemento
	{PARCIAL} HijoDerecho: TipoArbolBin -> TipoArbolBin
	{PARCIAL} HijoIzquierdo: TipoArbolBin -> TipoArbolBin

	{ Obs. No selectoras }
	EsArbolBinVacio: TipoArbolBin -> Booleano

ECUACIONES DE DEFINITUD
	Si No(EsArbolBinVacio(arbol)) ->
		DEF (Raiz(arbol))
	Si No(EsArbolBinVacio(arbol)) ->
		DEF (HijoDerecho(arbol))
	Si No(EsArbolBinVacio(arbol)) ->
		DEF (HijoIzquierdo(arbol))

ECUACIONES
	Raiz(ConstruirArbolBin(hi, raiz, hd)) ->
		raiz
	HijoIzquierdo(ConstruirArbolBin(hi, raiz, hd)) ->
		hi
	HijoDerecho(ConstruirArbolBin(hi, raiz, hd)) ->
		hd

	EsArbolBinVacio(CrearArbolBinVacio) = CIERTO
	EsArbolBinVacio(ConstruirArbolBin+(hi, raiz, hd)) = FALSO

FIN ESPECIFICACION