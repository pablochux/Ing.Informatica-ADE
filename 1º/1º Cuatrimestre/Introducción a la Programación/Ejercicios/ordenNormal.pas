PROGRAM P_NormalOrder;
{Escribir un número en su mismo orden
el tamaño es el número de digitos
el caso base es cuando number < 10 (n tiene un dígito)
Este problema va al reves
primero hace todas las llamadas recursivas y luego empieza a escribir}
	PROCEDURE NormalOrder;
	VAR
		number: Integer;
	BEGIN
		readln(number);
		IF (number < 10) THEN 
		BEGIN
			write(number); 
		END
		ELSE
		BEGIN
			NormalOrder(number);
			write(number MOD 10); 
		END;
	END;
BEGIN
	NormalOrder;
END.