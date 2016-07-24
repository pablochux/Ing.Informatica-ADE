PROGRAM test;
{Programa que realiza varias funciones}

VAR 
	numProgram: Integer;
	FUNCTION Sum: Integer;
	VAR
		num1, num2: Integer;
	BEGIN
	readln(num1);
	readln(num2);
		Sum:= num1 + num2;
	END;
	FUNCTION Subtraction: Integer;
	VAR
		num1, num2: Integer;
	BEGIN
	readln(num1);
	readln(num2);
		Subtraction:= num1 - num2;
	END;
	FUNCTION Multiplication: Integer;
	VAR
		num1, num2: Integer;
	BEGIN
	readln(num1);
	readln(num2);
		Multiplication:= num1 * num2;
	END;
	FUNCTION Division: Integer;
	VAR
		num1, num2: Integer;
	BEGIN
	readln(num1);
	readln(num2);
		Division:= num1 DIV num2;
	END;
BEGIN	
	writeln('Escribe: 1 para sumar, 2 para restar, 3 para multiplicar y 4 para dividir.');
	readln(numProgram);
	CASE (numProgram) of
	1:
	BEGIN
		writeln(sum());
	END;
	2:
	BEGIN
		writeln(subtraction());
	END;
	3:
	BEGIN
		writeln(multiplication());
	END;
	4: 
	BEGIN
		writeln(division());
	END;
	END;
END.