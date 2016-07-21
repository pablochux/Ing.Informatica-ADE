{Especificar e implementar el procedimiento llamado SubArbolNodoDado, que devuelva el Subarbol (S) perteneciente al Árbol A, enraizado en el nodo N.
SubarbolNodoDado: TipoArbolBin x N → TipoArbolBin}

(* ESPECIFICACION *)
{Especificación Examen
Usa Arboles
Operaciones 
	(* Constructoras No Generadoras *)
	SubArbolNodoDado: TipoArbolBin x TipoElemento -> TipoArbolBin
Variables

Ecuaciones 
	SubArbolNodoDado(CrearArbolBinarioVacio, n) = CrearArbolBinVacio
	SubArbolNodoDado(ConstruirArbolBin(hi, R, hd), n) =
		|Si R = n ->
			ConstruirArbolBin(hi, R, hd)
		|Si Pertenece(n, hi) ->
			SubArbolNodoDado(hi, n)
		|Si Pertenece(n, hd) ->
			SubArbolNodoDado(hd, n)
		|CrearArbolBinVacio

}
PROCEDURE SubArbolNodoDado (arbolBinario: TipoArbolBinario; elemento: TipoElemento; VAR subArbolBinario: TipoArbolBinario);
VAR
	encontrado: Boolean;
	hijoDer, hijoIzq, auxRaiz: TipoArbolBinario;

BEGIN
	TADArbolBinario.CrearArbolBinVacio(subArbolBinario); {Se crea el arbol binario que se va a devolver}
	IF (NOT TADArbolBinario.EsArbolBinarioVacio(arbolBinario)) THEN {Si arbolBinario es vacio, no se hace nada. Como se ha iniciado subArbolBinario a NIL, ambos serán iguales.}
	BEGIN
		{Si arbolBinario no es vacio, se destripa}
		TADArbolBinario.Raiz(arbolBinario, auxRaiz);
		TADArbolBinario.HijoIzquierdo(arbolBinario, hijoIzq);
		HijoDerecho(arbolBinario, hijoDer);
		{Si la raiz de arbolBinario es el nodo que buscabamos}
		IF (TADElemento.Iguales(auxRaiz, elemento)) THEN 
		BEGIN
			{Se copia arbolBinario a subArbolBinario. Ya hemos encontrado el nodo del subArbolBinario por lo que hemos terminado. subArbolBinario será el subArbol del nodo (elemento)}
			Copiar(arbolBinario, subArbolBinario); 
		END
		{Sino elemento no es la raiz, se busca por la rama del hijoIzquierdo de arbolBinario}
		ELSE IF (TADArbolBinario.Pertenece(elemento, hijoIzq)) THEN 
		BEGIN
			{Si el elemento pertenece a la rama del hijoIzquierdo, se hace una llamada recursiva para que se siga buscando el nodo (elemento) por esa rama}
			SubArbolNodoDado(hijoIzq, elemento, subArbolBinario); 
		END
		{Sino elemento no es la raiz, se busca por la rama del hijoDerecho de arbolBinario}
		ELSE IF (TADArbolBinario.Pertenece(elemento, hijoDer)) THEN 
		BEGIN
			{Si el elemento pertenece a la rama del hijoDerecho, se hace una llamada recursiva para que se siga buscando el nodo (elemento) por esa rama}
			SubArbolNodoDado(hijoDer, elemento, subArbolBinario);
		END;
	END;
END;
