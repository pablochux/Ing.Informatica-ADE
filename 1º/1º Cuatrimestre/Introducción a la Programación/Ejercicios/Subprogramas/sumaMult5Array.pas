{Con las secciones de constantes y tipos dadas se pide implementar un subprograma recursivo que reciba un array de 200 elementos enteros y devuelva la suma de todos los números que contenga el array que son multiplos de 5}
CONST
	MAX = 200;

TYPE
	TIndice: 1..MAX;
	TElemento = Integer;
	TVector = ARRAY [TIndice] of TElemento;

FUNCTION SumaMultiplos5 (vector: TVector; pos: Integer): Integer;
BEGIN
	{A pesar de ser un algoritmo recursivo, no se especifica el caso base, simplemente se considera eese caso, porque cuando se llegue al caso base no se va a hacer nada en especial. Solo se tiene que}
	{Mientras no se halla llegado al fin del array}
	IF (pos <= MAX) THEN
	BEGIN
		{Si el numero que hay en vector[pos] es multiplo de 5}
		IF (vector[pos] MOD 5 = 0) THEN
		BEGIN
		 	SumaMultiplos5:= vector[pos] + SumaMultiplos5(vector, pos + 1); 
		END
		ELSE 
		BEGIN
		 	SumaMultiplos5:= SumaMultiplos5(vector, pos + 1); 
		END;
	END;
END;

	