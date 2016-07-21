Ejercicio auxiliar Arboles Binarios
{EsArbolBinarioDeBusqueda te devuelve un booleano indicando si el arbol es un arbol binario de búsqueda o no}
FUNCTION EsArbolBinarioDeBusqueda (arbol: TipoArbol): Boolean;
VAR
	hd, hi: TArbolBin;
	auxRaiz, maximoHi, maximoHd: TElemento;

BEGIN
	{Caso base, si un arbol binario es vacio, es arbolBinariodeBusqueda}
	IF (EsArbolBinVacio(arbol)) THEN 
	BEGIN
		EsArbolBinarioDeBusquedaAux:= TRUE;
	END
	{Si no es vacio}
	ELSE 
	BEGIN
		{Se destripa}
		Raiz(a, auxRaiz);
		HijoDerecho(a, hd);
		HijoIzq(a, hi);
		{Se saca el mínimo del hijoDerecho}
		Minimo(hd, maximoHd);
		{Se saca el máximo del hijoIzquierdo}
		Maximo(hi, maximoHi);
		{Si la raiz es mayor que el maximo del hijoIzquierdo (en el hijo izquierdo se deben guardar los elementos que son menores que la raiz, por lo que si hay un elemento mayor -> ya no es arbolBinarioDeBusqueda)y la raiz es menor que el máximo del hijo derecho (lo mismo que antes pero al reves) y además su hijo izquierdo y su hijo derecho son Arboles binarios de busqueda}
		EsArbolBinarioDeBusqueda:= (auxRaiz > maximoHi) AND (auxRaiz < maximoHd) AND EsArbolBinarioDeBusqueda(hi) AND (EsArbolBinarioDeBusqueda(hd));
	END;
END;

{Función auxiliar que devuelve el máximo de un arbol binario}
PROCEDURE Maximo (arbol: TArbolBin; VAR m: Integer);
VAR
	aux: Integer;

BEGIN
	{Se eestripa el árbol}
	Raiz(arbol, m);
	HijoIzq(arbol, hi);
	HijoDerecho(arbol, hd);
	{Si su hijo izquierdo no es vacio}
	IF (NOT EsArbolBinVacio(hi)) THEN 
	BEGIN
		Maximo(hi, aux);
		IF (aux > m) THEN
		BEGIN
			m:= aux;	
		END;			
	END;	
	IF (NOT EsArbolBinVacio(hd)) THEN 
	BEGIN
		Maximo(hd, aux);
		IF (aux > m) THEN 
		BEGIN
			m:= aux;
		END;
	END;
END;

{Pensarlo}
FUNCTION EsArbolBinarioDeBusquedaAux (raizPrincipal: Integer; VAR raiz: Integer; arbol: TArbolBin): ;
VAR
	hi, hd: TArbolBin
	auxRaiz: TElemento;
BEGIN
	IF (EsArbolBinVacio(arbol)) THEN 
	BEGIN
		EsArbolBinarioDeBusquedaAux:= TRUE;
	END
	ELSE 
	BEGIN
		HijoDerecho(a, hd);
		HijoIzq(a, hi);
		Raiz(a, auxRaiz);
		EsArbolBinarioDeBusquedaAux:= EsArbolBinarioDeBusquedaAux(raizPrincipal, auxRaiz, arbol) OR EsArbolBinarioDeBusquedaAux(raizPrincipal, auxRaiz, arbol);
	END;
END;


{Ejercicio }