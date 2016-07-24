PROGRAM N_fibonacci;
{numúmero de fibonacci}
FUNCTION fibonacci (num: Integer): Integer;
BEGIN
	IF (num=1) OR (num=2) THEN
	BEGIN
	 	fibonacci:= 1; 
	END 
	ELSE
	BEGIN
		fibonacci:= fibonacci(num-1) + fibonacci(num-2);
	END;
END;

VAR 
	num: Integer;
	
BEGIN
	readln(num); 
	fibonacci(num)
END.
