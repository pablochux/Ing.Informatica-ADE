Ejercicio Auxiliar Árboles
{Contar el número de nodos que solo tienen el hiojderecho vacio, es decir, solo cuando el nodo tiene el hioj deerecho y el otro no. Si tiene los dos vacios no}
FUNCTION ContarNumNodosSoloHijoDerechoVacio (arbol: TArbolBin): ;
VAR
	hi, hd: TArbolBin;

BEGIN
	{Caso base, si el árbol es vacio no tiene hijos}
	IF (EsArbolVacia(arbol)) THEN 
	BEGIN
		ContarNumNodosSoloHijoDerechoVacio:= 0;
	END
	ELSE 
	BEGIN
		{Se destripa el árbol}
		HijoDer(arbol, hd);
		HijoIzq(arbol, hi);
		{Caso que queremos, si el nodo ante el que estamos tiene el hijo derecho vacio pero el otro no. Se suma 1 y se busca por el hijoIzquierdo, ya que el derecho es vacio}
		IF ((EsArbolVacia(hd)) AND (NOT EsArbolVaci(hi))) THEN 
		BEGIN
			ContarNumNodosSoloHijoDerechoVacio:= 1 + ContarNumNodosSoloHijoDerechoVacio(hi);
		END
		{En caso de que no se encuentre, se siguen buscando por los dos hijos}
		ELSE 
		BEGIN
			ContarNumNodosSoloHijoDerechoVacio:= ContarNumNodosSoloHijoDerechoVacio(hi) + ContarNumNodosSoloHijoDerechoVacio(hd);
		END;
	END;
END;