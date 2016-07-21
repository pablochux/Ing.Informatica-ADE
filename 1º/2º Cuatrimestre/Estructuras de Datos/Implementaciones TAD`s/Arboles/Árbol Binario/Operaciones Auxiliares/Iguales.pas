FUNCTION Iguales(a1,a2: TArbolBin): BOOLEAN;
VAR
	auxHi1, auxHi2, auxHd1, auxHd2: TArbolBin;
	auxRaiz1, auxRaiz2: TElem;

BEGIN
	IF (ArbolBin.EsArbolBinVacio(a1) AND ArbolBin.EsArbolBinVacio(a2)) THEN 
	BEGIN
		Iguales:= TRUE;
	END
	ELSE IF (ArbolBin.EsArbolBinVacio(a1) AND (NOT ArbolBin.EsArbolBinVacio(a2))) THEN 
	BEGIN
		Iguales:= FALSE;
	END
	ELSE IF (NOT ArbolBin.EsArbolBinVacio(a1) AND ArbolBin.EsArbolBinVacio(a2)) THEN 
	BEGIN
		Iguales:= FALSE;
	END
	ELSE 
	BEGIN
		{Se destripan los árboles}
		ArbolBin.Raiz(a1, auxRaiz1);
		ArbolBin.HijoDer(a1, auxHd1);
		ArbolBin.HijoIzq(a1, auxHi1);
		ArbolBin.Raiz(a2, auxRaiz2);
		ArbolBin.HijoDer(a2, auxHd2);
		ArbolBin.HijoIzq(a2, auxHi2);
		{Si las raices son iguales y los hijos son iguales}
		Iguales:= Elem.Iguales(auxRaiz1, auxRaiz2) AND (Iguales(auxHi1, auxHd2)) AND (Iguales(auxHi1, auxHi2));
	END;
END;