PROGRAM p1;
FUNCTION Sumatorio (num: Integer): Integer;
BEGIN
	IF (num = 1) THEN
	BEGIN
		Sumatorio:= 1;
	END
	ELSE
	BEGIN
		Sumatorio:= Sumatorio(num - 1 ) + ((2 * num) - 1);
	END;
END;
VAR
	num: Integer;

BEGIN
	readln(num);
	writeln(Sumatorio(num));
END.