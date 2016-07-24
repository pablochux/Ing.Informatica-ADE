PROGRAM Pfactorial;
{Ejemplo factorial}

FUNCTION Factorial (num: Integer): Integer;
BEGIN
	IF (num = 0) THEN
	BEGIN
		Factorial:= 1;
	END
	ELSE
	BEGIN
	 	Factorial:= num * Factorial(num-1);
	END;
END;
VAR
	n: Integer;
BEGIN
	readln(n);
	writeln(Factorial(n));
END.