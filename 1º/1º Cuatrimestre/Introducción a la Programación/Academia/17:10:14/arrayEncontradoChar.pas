{Programa que encuentra el caracter que previamente has introducido y te dice su aparición}
PROGRAM programEncontrado;
CONST
	MIN = 1;
	MAX = 10;

TYPE
	{Declaración del rango del vector}
	TipoRangoLetras = MIN..MAX;
	{Declaración del tipo del vector}
	TipoVectorLetras = ARRAY [TipoRangoLetras] of Char;

VAR
	{Declaración del vector}
	Letras: TipoVectorLetras;
	i: Integer;
	{Variable para saber si se ha encontrado o no lo que se quiere}
	encontrado: Boolean;
	carPedido:Char;

BEGIN
	write('Introduce un caracter: ');
	readln(carPedido);
	writeln('Rellena el Array: ');
	{Se rellena el array de valores}	
	FOR i:=MIN TO MAX DO
	BEGIN
		readln(letras[i]);
	END;	
	{Se inicializa la variable encontrado a false ya que no se ha encontrado el valor}
	encontrado:= false;
	{i es el contador del while, que a la vez es el primer indice del array}
	i:= MIN;
	{Mientras se cumpla la condición de que encontrado sea falso y la variable i que es el contador y a la vez los indices del array sea menor o máximo, se buscaraá en el array el valor 'j'}
	WHILE (NOT encontrado) AND ( i <= MAX) DO
	BEGIN
		{El valor de i va cambiando por lo que se recorre el arrray completo}
		IF (letras[i] = carPedido) THEN
		BEGIN
			{Si se ha encontrado el valor que se pedía se cambia el valor de encontrado a true}
			encontrado:= true;
		END
		ELSE
		BEGIN
			{Para que en cada iteración del bucle busque en una caja diferente del array se aumenta la variable contadora en uno}
			i:= i + 1;
			
		END;
	END;
	{Si al finalizar el bucle la variable encontrado tiene un valor true se imprime: el valor j ha sido encontrado y sino se imprime que el valor j no ha sido encontrado}
	IF (encontrado) THEN
	BEGIN
		writeln('El valor ', carPedido, ' ha sido encontrado en la celda', i);
	END
	ELSE
	BEGIN
		writeln('El valor ', carPedido, ' no ha sido encontrado.');
	END;
END.

