FUNCTION NivelNodo (arbol: TipoArbolBin; nodo: TipoNodo): Integer;
VAR
	auxHd, auxHi: TipoArbolBin;
	auxRaiz: TipoNodo;

BEGIN
	IF (EsArbolBinVacio(arbol)) THEN 
	BEGIN
		NivelNodo:= 0;
	END
	ELSE 
	BEGIN
		HijoDerecho(arbol, auxHd);
		HijoIzqierdo(arbol, auxHd);
		Raiz(arbol, Raiz);
		IF (auxRaiz = nodo) THEN 
		BEGIN
			NivelNodo:= 1;
		END
		ELSE 
		BEGIN
			IF (Pertenece(nodo, auxHd)) THEN 
			BEGIN
				NivelNodo:= 1 + NivelNodo(auxHd, nodo);
			END
			ELSE 
			BEGIN
				NivelNodo:= 1 + NivelNodo(auxHi, nodo);
			END;
		END;
	END;
END;