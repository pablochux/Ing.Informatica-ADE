PROGRAM p4;

VAR
	num: Integer;
BEGIN
	readln(num);

	CASE (num) OF
		0..4:
			writeln('SUSPENSO');
		5..6:
			writeln('APROBADO');
		7..8:
			writeln('NOTABLE');
		9:
			writeln('SOBRESALIENTE');
		10:
			writeln('MATRICULA DE HONOR');
	END;
END.