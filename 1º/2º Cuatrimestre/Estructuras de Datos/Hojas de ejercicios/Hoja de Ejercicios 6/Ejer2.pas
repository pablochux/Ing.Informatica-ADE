{Implementar una función que dado un ArbolBinario devuelva la suma máxima de los elementos desde la raíz la una hoja.
FUNCTION SumaMaxima (arbol: TArbolBin):Integer;}
FUNCTION SumaMaxima (arbol: TArbolBin): Integer;
VAR
	elemento: TipoElemento;
BEGIN
	IF (EsArbolBinVacio(arbol)) THEN {Caso base, la suma de los nodos es 0}
	BEGIN
		SumaMaxima:= 0;
	END
	ELSE 
	BEGIN
		{Se destripa el arbol}
		Raiz(ArbolBinario, elemento);
		HijoDerecha(arbol, hijoDer);
		HijoIzquierdo(arbol, HijoIzquierdo);
		{SuumaMAxima es igual a lo que vale el primero (raiz), más el mayor de la suma máxima de el hijoIzquierdo o el hijoDerecho}
		SumaMaxima:= elemento + Mayor(SumaMaxima(hijoIzq, elemento), SumaMaxima(hijoDer, elemento));
		
	END;
END;

{La función mayor devuelve el mayor elemento de los dos que recibe}
FUNCTION Mayor (elem1, elem2: TipoElemento): TipoElemento;
BEGIN
	IF (elem1 > elem2) THEN 
	BEGIN
		Mayor:= elem1;
	END
	ELSE 
	BEGIN
		Mayor:= elem2;
	END;
END;