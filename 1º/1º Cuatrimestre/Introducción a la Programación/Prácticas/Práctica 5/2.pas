PROGRAM psumatorio;
CONST
	MIN = 1;
	MAX =100;

TYPE
	TipoNumeral = ARRAY [MIN..MAX] of Real;

VAR
	n, i :Integer;
	num: TipoNumeral;
	media, sumatorio: Real;

BEGIN
	readln(n);
	FOR i:=MIN TO n DO 
	BEGIN
		read(num[i]);
	END;
	media := 0;
	FOR i:=MIN TO n DO
	BEGIN
		media:= media + num[i];
	END;
	media := media / n;
	sumatorio := 0;
	FOR i:=MIN TO n DO
	BEGIN
		sumatorio := sumatorio + sqr(num[i] - media);
	END;
	sumatorio := sumatorio / (n-1);
	writeln(sumatorio:0:4); 
END.