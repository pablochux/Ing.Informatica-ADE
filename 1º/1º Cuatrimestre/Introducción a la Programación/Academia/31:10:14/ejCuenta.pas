PROGRAM pCuenta;
{Subprograma que dado un número entero y positivo muestre por pantalla la cuenta atrás desde ese número hasta 0 de forma recursiva}
VAR
	n: Integer;
	PROCEDURE CuentaAtras (n:Integer);
	BEGIN
		writeln(n);
		IF (n <> 0) THEN
		BEGIN
			CuentaAtras (n - 1);
		END;
	END;
BEGIN
	readln(n);
	CuentaAtras(n);
END.