{Subprograma iterativo que reciba un array de 200 elementos enteros y diga si el vector es un desorden o no. Se dice que un vector es un desorden cuando el primer elemento es mayor que el segundo, el segundo es menor que el tercero, el tercero es mayor que el cuarto, el cuarto es menor que el quinto........}
CONST
	MAX = 200;

TYPE
	TIndice: 1..MAX;
	TElemento = Integer;
	TVector = ARRAY [TIndice] of TElemento;

FUNCTION EsDesordenado (vector: TVector): boolean;
VAR
	cont: Integer;
	ordered: Boolean;
BEGIN
	cont:= 1;
	ordered:= false;
	{Se utiliza un bucle while porque no es necesario recorrer todo el array, en el momento en el que se encuentre un par de números que no sigan la secuencia se sale del bucle}
	{Al comparar dos números no se incluye el 200 (MAX) porque no se comparará con el 201}
	WHILE (NOT ordered) AND (cont <= (MAX - 1)) DO
	BEGIN
		{Si es impar, se compara de una forma diferente que si es par}
		IF (odd(cont)) THEN
		BEGIN
			ordered:= vector[cont] > vector [cont+1];
		END
		ELSE 
		BEGIN
			ordered:= vector[cont] < vector [cont+1];
		END;
		cont:= cont + 1;
	END;
	EsDesordenado:= ordered;
END;