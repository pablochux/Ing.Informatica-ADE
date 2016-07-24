PROGRAM P_reversaOrder;
{Escribir por pantalla los digitos de un nº negativo en orden inverso (digito a digito)}
{EJ: n = 5342 -> 2435}
{Primero pensar en el tamaño del problema
	Número de digitos
Caso base (n tiene un digito)
Caso recursivo
	5342 ------> 2435
	534 -------> 
	534 es n div 10
	2 es n mod 10
	Sacar el último número con mod 10 mientras que sacar los 3 otros con DIV 10t
	El último dígito se saca con MOD 10
	Mientras que los primeros con DIV 10

Funcionamiento
5342
Escribe 2 (ELSE)
534
Escribe 4 (ELSE)
53
Escribe 3 (ELSE)
5
Escribe 5 (IF)
}

VAR
	number: Integer;
	PROCEDURE ReverseOrder (number: Integer);
	BEGIN
		IF (number < 10) THEN
		BEGIN
			 write(number);
		END
		ELSE 
		BEGIN
			write(number mod 10);
			ReverseOrder(number DIV 10); 
		END;
		writeln();
	END;
BEGIN
	readln(number);
	ReverseOrder(number);
END.