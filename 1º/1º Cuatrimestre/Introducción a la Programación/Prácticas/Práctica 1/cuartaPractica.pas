PROGRAM cuartaPractica;
VAR
	dividendo: integer;
	divisor: integer;
BEGIN
	readln(dividendo);
	readln(divisor);
	writeln('division entera = ', dividendo DIV divisor);
	writeln('resto = ', dividendo MOD divisor);
	writeln(dividendo, ' = ', dividendo DIV divisor, '*', divisor, ' + ', dividendo MOD divisor);
	writeln(dividendo, '/', divisor, ' = ', dividendo DIV divisor, ' + ', dividendo MOD divisor, '/', divisor);

END.