{Cuenta el número de hojas de un arbol binario}
FUNCTION NumberOfLeaves (binaryThree: TypeBinaryThree): Integer;
	VAR
		rightSon, leftSon: TypeBinaryThree;

	BEGIN
		IF (EsVacio(binaryThree)) THEN {Caso base 1, cuando el arbol sea vacio}
		BEGIN
			NumberOfLeaves:= 0;
		END
		ELSE 
		BEGIN
			GiveRightSon(rightSon);
			GiveLeftSon(leftSon);
			IF (IsEmpty(rightSon) AND IsEmpty(leftSon)) THEN {Caso base 2, cuando hi y hd sean vacios, nos encontramos ante una hoja}
			BEGIN
				NumberOfLeaves:= 1;
			END
			ELSE 
			BEGIN
				NumberOfLeaves:= NumberOfLeaves(rightSon) + NumberOfLeaves(leftSon); {Si no es una hoja, se recorren las dos ramas del árbol en busca de hojas}
			END;
		END;
	END;