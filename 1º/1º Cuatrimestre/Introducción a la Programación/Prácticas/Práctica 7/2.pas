PROGRAM p2;
FUNCTION cifrasNum (num: Integer): Integer ;
BEGIN
	IF (num < 10) THEN
	BEGIN
	 	cifrasNum:= 1;
	END
	ELSE 
	BEGIN
		cifrasNum:= cifrasNum(num DIV 10) + 1;
	END;
END;
VAR
	num: Integer;
BEGIN
	readln(num);
	writeln(cifrasNum(num));
END.