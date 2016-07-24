PROGRAM p_practicaFinal;
CONST
	CERO = 0;
	MIN = 1;
	DOS = 2;
	MAXCIFRAS = 50;

TYPE
	TipoInteger = Integer;
	TipoRangoArrayNumeros = MIN..MAXCIFRAS;
	TipoArrayNumeros = ARRAY [TipoRangoArrayNumeros] OF TipoInteger;
	TipoNumero = RECORD
		cifras: TipoArrayNumeros;
		numCifras: TipoInteger;
		esNegativo: Boolean;
	END;
	
{Subprograma para escribir número}
PROCEDURE mostrarNumeroPorPantalla (num: TipoNumero);
VAR
	contador: Integer;

BEGIN
	IF (num.numCifras = CERO) THEN
	BEGIN
		write('0')
	END
	ELSE IF NOT (num.numCifras = CERO) THEN
	BEGIN
		IF (num.esNegativo) THEN
		BEGIN
			write('-');
		END;
		FOR contador:= num.numCifras DOWNTO (MIN) DO
		BEGIN
			write(num.cifras[contador]);
		END;
	END;
	writeln();
END;
{Subprograma para calcular el número de cifras que tiene el número introducido como parametro}
FUNCTION calcularNumeroCifras (numero: TipoArrayNumeros): Integer;
VAR
	numAuxiliar: Integer;

BEGIN
	numAuxiliar:= MAXCIFRAS;
	WHILE (numAuxiliar >= MIN) AND (numero[numAuxiliar] = CERO) DO
	BEGIN
		numAuxiliar:= numAuxiliar - MIN;
	END;
	calcularNumeroCifras:= numAuxiliar;
END;

PROCEDURE convertirEnCero (VAR x: TipoNumero);
VAR
	contador: Integer;

BEGIN
	FOR contador:= MIN TO (MAXCIFRAS) DO 
	BEGIN
		x.cifras[contador]:= CERO;
	END;
	x.numCifras:= CERO;
	x.esNegativo:= FALSE;
END;
{Subprograma que calcula si num1 es mayor que num2 y devuelve un booleano con la respuesta}
FUNCTION operacionMayor (num1: TipoNumero; num2: TipoNumero): Boolean;
VAR
	contador: Integer;
	tipoNumeroAuxiliar: TipoNumero;

BEGIN
	IF (NOT num1.esNegativo) AND (num2.esNegativo) THEN
	BEGIN
		operacionMayor:= TRUE;
	END
	ELSE IF (num1.esNegativo) AND (NOT num2.esNegativo) THEN
	BEGIN 
		operacionMayor:= FALSE;
	END
	ELSE 
	BEGIN
		IF (num1.esNegativo) AND (num2.esNegativo) THEN
		BEGIN
			tipoNumeroAuxiliar:= num2;
			num2:= num1;
			num1:= tipoNumeroAuxiliar;
		END;
		IF (num2.numCifras < num1.numCifras ) THEN
		BEGIN 
			operacionMayor:= TRUE;
		END
		ELSE IF (num1.numCifras < num2.numCifras) THEN
		BEGIN
			operacionMayor:= FALSE;
		END 
		ELSE
		BEGIN
			contador:= num1.numCifras;
			WHILE ((num1.cifras[contador] = num2.cifras[contador]) AND (contador >= MIN)) DO
			BEGIN 
				contador:= contador - MIN;
				operacionMayor:= ((num1.cifras[contador] > num2.cifras[contador]) AND (contador > CERO));
			END;
		END;
	END;
END;
{Para evitar que de error de compilación debido a que operacionResta necesita subprogramas como operacionSuma, etc..}
PROCEDURE operacionSuma (VAR desbordamiento: Boolean; num1: TipoNumero; num2: TipoNumero; VAR resultado: TipoNumero)
	FORWARD;
	
PROCEDURE operacionResta (VAR desbordamiento: Boolean; num1: TipoNumero; num2: TipoNumero; VAR resultado: TipoNumero);
VAR
	llevada: Integer;
	contador: Integer;
	maxNum: Integer;
	tipoNumeroAuxiliar: TipoNumero;

BEGIN
	IF  ((num2.esNegativo) AND (NOT num1.esNegativo)) THEN
	BEGIN
		num2.esNegativo:= FALSE;
		operacionSuma(desbordamiento, num1, num2, resultado);
	END
	ELSE IF (num1.esNegativo) AND (NOT num2.esNegativo) THEN
	BEGIN
		num1.esNegativo:= FALSE;
		operacionSuma(desbordamiento, num1,num2,resultado);
		resultado.esNegativo:= TRUE;
	END
	ELSE
	BEGIN
		IF (num2.esNegativo) AND (num1.esNegativo) THEN
		BEGIN
			tipoNumeroAuxiliar:= num1;
			num1:= num2;
			num2:= tipoNumeroAuxiliar;
			num1.esNegativo:= FALSE;
			num2.esNegativo:= FALSE;
		END;
		IF (operacionMayor (num2, num1)) THEN {si es operacionMayor op2 que op1}
		BEGIN
			tipoNumeroAuxiliar:= num1;
			num1:= num2;
			num2:= tipoNumeroAuxiliar;
			resultado.esNegativo:= TRUE;
		END;
		llevada:= CERO;
		IF (num1.numCifras > num2.numCifras) THEN
		BEGIN 
			maxNum:= num1.numCifras;
		END
		ELSE
		BEGIN 
			maxNum:= num2.numCifras;
		END;
		FOR contador:= MIN TO (maxNum) DO
		BEGIN
			IF ((num1.cifras[contador] - llevada) >= num2.cifras[contador]) THEN
			BEGIN
				resultado.cifras[contador]:= (num1.cifras[contador] - llevada) - num2.cifras[contador];
				llevada:= CERO;
			END
			ELSE
			BEGIN
				resultado.cifras[contador]:= (10 + num1.cifras[contador] - llevada) - num2.cifras[contador];
				llevada:= MIN;
			END;
		END;
		resultado.numCifras:= calcularNumeroCifras(resultado.cifras);
	END;
END;

{Subprograma que operacionSuma x e y, devuelve la operacionSuma que es z y dice si hay o no desbordamiento}
PROCEDURE operacionSuma (VAR desbordamiento: Boolean; num1: TipoNumero; num2: TipoNumero; VAR resultado: TipoNumero);
VAR
	llevada: Integer;
	maxNum: Integer;
	contador: Integer;

BEGIN
	IF  ((num2.esNegativo) AND (NOT num1.esNegativo)) THEN 
	BEGIN
		num2.esNegativo:= FALSE;
		operacionResta(desbordamiento, num1, num2, resultado);
	END
	ELSE IF ((NOT num2.esNegativo) AND (num1.esNegativo)) THEN
	BEGIN
		num1.esNegativo:= FALSE;
		operacionResta(desbordamiento, num2, num1, resultado);
	END
	ELSE
	BEGIN
		IF ((num2.esNegativo) AND (num1.esNegativo)) THEN
		BEGIN
			resultado.esNegativo:= TRUE;
		END;
		llevada:= CERO;
		IF (num2.numCifras < num1.numCifras) THEN
		BEGIN 
			maxNum:= num1.numCifras;
		END
		ELSE
		BEGIN 
			maxNum:= num2.numCifras;
		END;
		FOR contador:= MIN TO (maxNum) DO
		BEGIN
			resultado.cifras[contador]:= (num2.cifras[contador] + llevada+ num1.cifras[contador]) MOD 10;
			llevada:= (num2.cifras[contador] + llevada + num1.cifras[contador]) DIV 10;
		END;
		IF (MAXCIFRAS > maxNum) THEN
		BEGIN
			resultado.cifras[maxNum + MIN]:= llevada;
		END
		ELSE
		BEGIN
			desbordamiento:= TRUE;
		END;
		resultado.numCifras:= calcularNumeroCifras(resultado.cifras);
	END;
END;

{Subprograma }
PROCEDURE multiplicacionDeDiez (VAR desbordamiento: Boolean; num1: TipoNumero; VAR resultado: TipoNumero);
VAR
	contador: Integer;

BEGIN
	IF (num1.numCifras <> CERO) THEN
	BEGIN
		IF (num1.numCifras < MAXCIFRAS) THEN
		BEGIN
			FOR contador:= num1.numCifras DOWNTO (MIN) DO
			BEGIN
				resultado.cifras[contador + MIN]:= num1.cifras[contador];
			END;
		END
		ELSE
		BEGIN 
			desbordamiento:= TRUE;
		END;
		resultado.cifras[MIN]:= CERO;
		resultado.numCifras:= num1.numCifras + MIN;
	END
	ELSE
	BEGIN
		convertirEnCero(resultado);
	END;
END;
{Subprograma}
PROCEDURE multiplicacionDeNumero (VAR desbordamiento: Boolean; num1: TipoNumero; digito: Integer; VAR resultado: TipoNumero);
VAR
	contador: Integer;
	llevada: Integer;

BEGIN
	resultado.esNegativo:= FALSE;
	IF (num1.numCifras <> CERO) AND (digito <> CERO) THEN
	BEGIN
		llevada:= CERO;
		FOR contador:= MIN TO (num1.numCifras) DO
		BEGIN
			resultado.cifras[contador]:= (num1.cifras[contador]*digito+llevada) MOD 10;
			llevada:= (num1.cifras[contador] * digito + llevada) DIV 10;
		END;
		resultado.numCifras:= num1.numCifras;
		IF (llevada > CERO) THEN
		BEGIN
			IF (resultado.numCifras < MAXCIFRAS) THEN
			BEGIN
				resultado.cifras[contador + MIN]:= llevada
			END
			ELSE
				desbordamiento:= TRUE;
			resultado.numCifras:= resultado.numCifras + MIN;
		END
	END
	ELSE
	BEGIN 
		convertirEnCero(resultado);
	END;
END;
{Subprograma multiplicar}
PROCEDURE operacionMultiplicacion (VAR desbordamiento: Boolean; num1: TipoNumero; num2: TipoNumero; VAR resultado: TipoNumero);
VAR
	contador: Integer;
	s: TipoNumero;
	t: TipoNumero;

BEGIN
	convertirEnCero(resultado);
	FOR contador:= num2.numCifras DOWNTO (MIN) DO
	BEGIN
		convertirEnCero(s);
		multiplicacionDeDiez(desbordamiento, resultado, s);
		convertirEnCero(t);
		multiplicacionDeNumero(desbordamiento, num1, num2.cifras[contador], t);
		convertirEnCero(resultado);
		operacionSuma(desbordamiento, s,t,resultado );
	END;
END;
{Subprograma que convierte un número de string a TNumero}
PROCEDURE ConvertirString_Int ( VAR numero: TipoNumero; operando: String);
VAR
	contador: Integer;
	code: Integer;
	cont: Integer;
	ini: Integer;
	
BEGIN
	IF (operando[MIN]='-') THEN
	BEGIN
		numero.esNegativo:= TRUE;
		ini:= DOS;
	END
	ELSE
	BEGIN
		numero.esNegativo:= FALSE;
		ini:= MIN;
	END;
	cont:= MIN;
	numero.numCifras:= Length(operando);
	FOR contador:= Length(operando) DOWNTO (ini) DO
	BEGIN
		Val(operando[contador], numero.cifras[cont], code);
		IF (code > CERO) THEN
		BEGIN 
			writeln('Error al convertir');
		END;
		cont:= cont + MIN;
	END;
END;
{Procedimiento para cuando hay desbordamiento}
PROCEDURE HayDesbordamiento();
BEGIN
	writeln('DESBORDAMIENTO')
END;
{Programa Principal}
VAR
	operacion: Char;
	operando1, operando2: String;
	numero1, numero2, numero3: TipoNumero;
	desbordamiento: Boolean;

BEGIN
	readln(operacion);
	readln(operando1);
	readln(operando2);
	ConvertirString_Int( numero1, operando1);
	ConvertirString_Int(numero2, operando2);
	IF (operacion = '=') THEN 
	BEGIN
		writeln ((NOT operacionMayor(numero2, numero1)) AND (NOT operacionMayor(numero1, numero2)));
	END
	ELSE IF (operacion = '>') THEN 
	BEGIN
		writeln(operacionMayor(numero1, numero2));
	END
	ELSE IF (operacion = '<') THEN
	BEGIN
		{Si numero 2 es operacionMayor que numero 1, significa que numero 1 es menor que numero 2}
		writeln(operacionMayor(numero2, numero1));
	END
	ELSE IF (operacion = '-') THEN 
	BEGIN
		desbordamiento:= FALSE;
		operacionResta(desbordamiento, numero1, numero2, numero3);
		IF (desbordamiento) THEN
		BEGIN 
			HayDesbordamiento();
		END
		ELSE IF (NOT desbordamiento) THEN
		BEGIN 
			mostrarNumeroPorPantalla(numero3);
		END;
	END
	ELSE IF (operacion = '+') THEN 
	BEGIN
		desbordamiento:= FALSE;
		operacionSuma(desbordamiento, numero1, numero2, numero3);
		IF (NOT desbordamiento) THEN
		BEGIN 
			mostrarNumeroPorPantalla(numero3);
		END
		ELSE 
		BEGIN 
			HayDesbordamiento();
		END;
	END
	ELSE IF (operacion = '*') THEN 
	BEGIN
		desbordamiento:= FALSE;
		operacionMultiplicacion(desbordamiento, numero1, numero2, numero3);
		IF (NOT numero1.esNegativo AND numero2.esNegativo) OR (numero1.esNegativo AND NOT numero2.esNegativo) THEN
		BEGIN 
			numero3.esNegativo:= TRUE;
		END;
		IF (NOT desbordamiento) THEN
		BEGIN 
			mostrarNumeroPorPantalla(numero3);
		END
		ELSE
		BEGIN 
			HayDesbordamiento();
		END;
	END;
END.