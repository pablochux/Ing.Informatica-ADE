FUNCTION MAX (num1, num2: Integer): Integer;
BEGIN
	IF (num1 > num2) THEN 
	BEGIN
		MAX:= num1;
	END
	ELSE 
	BEGIN
		MAX:= num2;
	END;
END;

FUNCTION Altura(a: TArbolBin): integer;
VAR
	auxHd, auxHi: TArbolBin;

BEGIN
	IF (ArbolBin.EsArbolBinVacio(a)) THEN 
	BEGIN
		Altura:= 0;
	END
	ELSE 
	BEGIN
		ArbolBin.HijoIzq(a, auxHi);
		ArbolBin.HijoDer(a, auxHd);
		Altura:= 1 + MAX(Altura(auxHd), Altura(auxHi));	
	END;
END;