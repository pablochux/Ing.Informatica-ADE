PROGRAM p3;
VAR
	x1, x2, x3: Real;
	aux: Real;
	solreal, solimaginaria: Real;
	sol1, sol2: Real;
BEGIN
	readln(x1,x2,x3);
	aux:=sqr(x2) - (4 * x1 * x3);

	IF (aux < 0) THEN
	BEGIN
		solreal:= (-x2 / (2 * x1));
		solimaginaria:=sqrt(abs(aux)) / (2 * x1);
		

		writeln(solreal:0:3, ' + ', solimaginaria:0:3, 'i');
		writeln(solreal:0:3, ' - ', solimaginaria:0:3, 'i');
	END

	ELSE
	BEGIN
		sol1:=(-x2 + sqrt(aux)) / (2 * x1);
		sol2:=(-x2 - sqrt(aux)) / (2 * x1);

		IF (sol1 = sol2) THEN
		BEGIN
			writeln(sol1:0:3, ' (doble)')
		END

		ELSE
		BEGIN
			writeln(sol1:0:3);
			writeln(sol2:0:3);
		END;
	END;
END.