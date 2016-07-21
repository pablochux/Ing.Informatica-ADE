{Función que devuelve el camino máximo de un arbol}

{Función auxiliar que recibe dos números y devuelve el mayor de ellos}
FUNCTION Max (number1, number2: Integer): Integer;
BEGIN
	IF (number1 > number2) THEN
	BEGIN
		Max:= number1;
	END
	ELSE
	BEGIN
		Max:= number2;
	END;
END;

FUNCTION Length (binaryThree: TypeBinaryThree): Integer;
VAR
	leftSon, rightSon: TypeBinaryThree;

BEGIN
	{Caso base, cuando el arbol es vacio la longitud es 0}
	IF (IsEmpty(binaryThree)) THEN 
	BEGIN
		Length:= 0;
	END
	{Sino es vacio, se destripa}
	ELSE 
	BEGIN
		GiveLeftSon(leftSon);
		GiveRightSon(rightSon);
		{El camino más largo es 1 + el máximo del camino por un lado y el camino por otro}
		Length:= 1 + Max(Length(rightSon), Length(leftSon));
	END;
END;