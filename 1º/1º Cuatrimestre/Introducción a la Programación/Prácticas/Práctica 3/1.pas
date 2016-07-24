PROGRAM p1;

VAR
	num: real;
BEGIN
	readln(num);
	IF (num < 0) THEN
		writeln( trunc(num) )
	ELSE
		IF ( num <> trunc(num) ) THEN
			writeln( succ (trunc(num) ) )	
		ELSE
			writeln( trunc(num) )	
END.