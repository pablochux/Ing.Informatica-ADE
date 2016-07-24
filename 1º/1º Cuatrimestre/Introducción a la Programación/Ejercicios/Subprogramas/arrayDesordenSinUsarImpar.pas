{Subprograma iterativo que reciba un array de 200 elementos enteros y diga si el vector es un desorden o no. Se dice que un vector es un desorden cuando el primer elemento es mayor que el segundo, el segundo es menor que el tercero, el tercero es mayor que el cuarto, el cuarto es menor que el quinto........}
PROGRAM 

CONST
	MAX = 200;

TYPE
	TIndice: 1..MAX;
	TElemento = Integer;
	TVector = ARRAY [TIndice] of TElemento;

FUNCTION EsDesordenado (vector: TVector): boolean;
VAR
	cont: Integer;
	ordered, impar: Boolean;
BEGIN
	cont:= 1;
	ordered:= false;
	WHILE (NOT ordered) AND (cont <= (MAX - 1)) DO
	BEGIN
		IF (impar) THEN
		BEGIN
			ordered:= vector[cont] > vector [cont+1];
		END
		ELSE 
		BEGIN
			ordered:= vector[cont] < vector [cont+1];
		END;
		impar:= NOT impar;
		cont:= cont + 1;
	END;
	EsDesordenado:= ordered;
END;