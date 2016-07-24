PROGRAM factorialRecursivo;
VAR
	n :Integer;

{Función recursiva no iterativa}
FUNCTION Factorial (n :Integer): Integer;
BEGIN
	IF (n = 0) THEN
	BEGIN
		Factorial:= 1;
	END
	ELSE  
	BEGIN
		Factorial:= n * Factorial(n-1);
	END;
END;

BEGIN
	readln(n);
	writeln(Factorial(n));
END.