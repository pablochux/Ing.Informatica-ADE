{Subprograma iterativo que reciba un array de 200 elementos enteros y diga si el vector es un desorden o no. Se dice que un vector es un desorden cuando el primer elemento es mayor que el segundo, el segundo es menor que el tercero, el tercero es mayor que el cuarto, el cuarto es menor que el quinto........}
PROGRAM 

CONST
	MAX = 200;

TYPE
	TIndice: 1..MAX;
	TElemento = Integer;
	TVector = ARRAY [TIndice] of TElemento;

FUNCTION EsDesordenado (vector: TVector; cont: Integer): boolean;
BEGIN
	IF (cont < MAX) THEN
	BEGIN
		IF (odd(cont)) THEN
		BEGIN
			EsDesordenado:= (vector[cont] > vector [cont+1]) AND EsDesordenado(vector, cont+1);
		END
		ELSE 
		BEGIN
			EsDesordenado:= (vector[cont] < vector [cont+1]) AND EsDesordenado(vector, cont+1);
		END;
	END
	ELSE
	BEGIN
		{Para contemplar que el array tenga solo una posición}
		EsDesordenado:= TRUE;
	END;
END;