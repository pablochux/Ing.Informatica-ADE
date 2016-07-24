PROGRAM fGanancias;

CONST
	EPSILON = 0.0001;
	POBRE = 0;
	INTERPROFESIONAL = 645.3;
	MILEURISTA = 1200;
	PRIVILEGIADO = 2000;
	MILLONARIO = 6000;
VAR
	salario: real;
	aux: real;
BEGIN
	readln(salario);
	aux := abs(salario - INTERPROFESIONAL);
	IF ((salario >= POBRE) AND (salario < INTERPROFESIONAL) AND (aux > EPSILON)) THEN
	BEGIN
		writeln('Pobre')
	END
	ELSE IF (aux < EPSILON) THEN
		writeln('Interprofesional')
	ELSE IF ((salario > INTERPROFESIONAL) AND (aux > EPSILON) AND (salario <= MILEURISTA)) THEN
	BEGIN
		writeln('Mileurista')
	END
	ELSE IF ((salario > MILEURISTA) AND (salario <= PRIVILEGIADO)) THEN
	BEGIN
		writeln('Privilegiado')
	END
	ELSE IF ((salario > PRIVILEGIADO) AND (salario < MILLONARIO)) THEN
	BEGIN
		writeln('Rico')
	END
	ELSE IF (salario >= MILLONARIO) THEN
	BEGIN
		writeln('Millonario')
	END
END.