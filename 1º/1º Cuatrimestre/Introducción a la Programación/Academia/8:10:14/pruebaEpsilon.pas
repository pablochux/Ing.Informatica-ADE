{Comparación de numeros reales}
PROGRAM real;
CONST
	INTERPROFESIONAL = 645.3;
	EPSILON = 0.001; {Epsilon es un margen de error}
VAR
	salario, resultado: real;
BEGIN
	readln(salario);
	resultado:= sqrt(sqr(salario - INTERPROFESIONAL));
	IF (resultado < EPSILON) THEN
	BEGIN
		writeln('Son iguales');
	END
	ELSE 
	BEGIN
END.