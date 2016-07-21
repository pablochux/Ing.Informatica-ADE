{Ejercicio 4. Hacer una función que te devuelva el número de arcos de un Árbol.}

{Teoría: Los arcos de un arbol son el número de nodos menos 1
arcos(arbolBinario) = nodos(arbolBinario) - 1}
FUNCTION NumArcos (arbolBinario: TipoArbolBinario): Integer;
BEGIN
	IF (EsArbolBinVacio(arbol)) THEN {Si arbolBinario es vacio, su numero de arcos es 0}
	BEGIN
		NumArcosArcos:= 0;
	END
	{Si no es vacío, su número de arcos es el numero de nodos - 1}
	ELSE 
	BEGIN
		NumArcos:= NumNodos - 1;
	END;
END;

{Implementación alternativa}
FUNCTION NumArcos (arbolBinario: TipoArbolBinario): Integer;
VAR
	contador: Integer;
	hijoIzq, hijoDer: TipoArbolBinario;

BEGIN
	{Si arbolBinario es vacio, su numero de arcos es 0}
	IF (EsArbolBinVacio(arbol)) THEN 
	BEGIN
		NumArcos:= 0;
	END
	ELSE 
	BEGIN
		{Se destripa el árbol y se inicializa el contador a 0}
		HijoIzq(arbol, HijoIzq);
		HijoDer(arbol, HijoDer);
		contador:= 0;
		{Si el hijoIzq del árbol no es vacio}
		IF (NOT EsArbolBinVacio(HijoIzq)) THEN 
		BEGIN
			contador:= contador + 1; {Existe un arco entre raiz e hijoIzq, por lo que se aumenta el contrador}
			contador:= contador + NumArcos(HijoIzq); {El número de arcos es igual al número de arcos más el número de arcos de la llamada recursiva a la función del resto del hijoIzq.}
		END
		{Si el hijoIzq del árbol no es vacio}
		IF (NOT EsArbolBinVacio(HijoDer)) THEN 
		BEGIN
			{Existe un arco entre raiz e hijoDee, por lo que se aumenta el contrador}
			contador:= contador + 1;
			{El número de arcos es igual al número de arcos más el número de arcos de la llamada recursiva a la función del resto del hijoDer.}
			contador:= contador + NumArcos(HijoDer);
		END;
		NumArcos:= contador;
	END;
END;