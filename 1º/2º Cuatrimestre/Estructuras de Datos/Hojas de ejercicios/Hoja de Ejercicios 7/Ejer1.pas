{Implementa una función que devuelva TRUE cuando el arbol que se le manda es lleno.
FUNCTION EsArbolBinarioLleno (a: TArbolBin): Boolean;
Un árbol lleno es aquel que cumple una de estas dos condiciones para todos sus nodos:
• Es Vacio
• La altura del hijo derecho es igual que la del hijo izquierdo (para todos sus nodos).}

FUNCTION EsArbolBinarioLleno (a: TArbolBin): Boolean;
BEGIN
	IF (ArbolBinarioVacio(a)) THEN 
	BEGIN
		EsArbolBinarioLleno:= TRUE;
	END
	{Si el arbol no es vacio}
	ELSE 
	BEGIN
		{Se destripa}
		Raiz(a, R);
		hijoIzquierdo(a, hi);
		hijoDerecho(a, hd);
		{}
		{Si la altura de los hijos de la raiz es igual => puede  que sea lleno}
		{Si la altura de los hijos es igual, se comprueba si es un arbolbinariolleno en ambos hijos} {En caso que la altura sea dseristinta, como es un AND, directamente es FALSE}
		EsArbolBinarioLleno:= (Altura(hi) = Altura(hd)) AND (EsArbolBinarioLleno(hi) AND EsArbolBinarioLleno(hd));
	END;
END;