PROCEDURE ImprimirEntreNiveles (arbol: TArbolBin; n1, n2: Integer);
VAR
	auxRaiz: TipoNodo;
	auxHd, auxHi: TArbolBin;
	
BEGIN
	{Si el árbol no es vacio}
	IF (NOT EsArbolBinVacio(arbol)) THEN 
	BEGIN
		{Se destripa}
		Raiz(arbol, auxRaiz);
		HijoDerecho(arbol, auxHd);
		HijoIzquierdo(arbol, auxHi);
		{Si el }
		IF (n1 = 1) THEN 
		BEGIN
			Imprimir(auxRaiz)
			{En el caso que no solo se quiera imprimir un nivel sino varios}
			IF (n2 > 1) THEN 
			BEGIN
				{Las llamadas recursivas imprimen las raices hasta que n2 sea 1}
				ImprimirEntreNiveles(auxHi, n1, n2 - 1);
				ImprimirEntreNiveles(auxHd, n1, n2 - 1);
			END;
		END
		{Si n <> 1, estamos ante un nivel de nodos que no queremos imprimir. Por lo que se resta un a ambos contadores y se llama a los procedimientos con los hijos}
		ELSE 
		BEGIN
			ImprimirEntreNiveles(auxHi, n1-1, n2-1);
			ImprimirEntreNiveles(auxHd, n1-1, n2-1);
		END;
	END;
END;