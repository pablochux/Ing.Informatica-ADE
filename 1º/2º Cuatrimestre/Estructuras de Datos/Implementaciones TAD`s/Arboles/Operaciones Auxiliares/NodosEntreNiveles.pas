{Se usa el TAD ArbolBin}
{Se pide un subprograma que imprima los nodos que hay entre dos niveles dados}

PROCEDURE ImprimirEntreNiveles (arbol: TArbolBin; n1, n2: Integer);
VAR
	auxRaiz: TipoNodo;
	auxHd, auxHi: TArbolBin;
	
BEGIN
	IF (NOT EsArbolBinVacio(arbol)) THEN 
	BEGIN
		Raiz(arbol, auxRaiz);
		HijoDerecho(arbol, auxHd);
		HijoIzquierdo(arbol, auxHi);
		IF (n1 = 1) THEN 
		BEGIN
			{Operación auxiliar que imprime el parametro}
			Imprimir(auxRaiz);
			IF (n2 > 1) THEN 
			BEGIN
				ImprimirEntreNiveles(auxHi, n1, n2 - 1);
				ImprimirEntreNiveles(auxHd, n1, n2 - 1);
			END;
		END
		ELSE 
		BEGIN
			ImprimirEntreNiveles(auxHi, n1-1, n2-1);
			ImprimirEntreNiveles(auxHd, n1-1, n2-1);
		END;
	END;
END;