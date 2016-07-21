{Devuelve un booleano si el elemento pertenece o no al arbol}
FUNCTION Belong (element: TypeElement; binaryThree: TypeBinaryThree): Boolean;
	VAR
		leftSon, rightSon, root: TypeBinaryThree;
		
	BEGIN
		{Caso base, si el arbol es vacio}
		IF (IsEmpty(binaryThree)) THEN 
		BEGIN
			Belong:= FALSE;
		END
		{Sino es vacio, se destripa}
		ELSE 
		BEGIN
			GiveLeftSon(leftSon);
			GiveRightSon(rightSon);
			GiveRoot(root);
			{El elemento pertenece si es igual a la raiz, o si se encuentra en hd o hi}
			Belong:= IsEqual(element, root) OR Belong(rightSon) OR Belong(leftSon); {Comprueba en la raiz}
		END;
	END;