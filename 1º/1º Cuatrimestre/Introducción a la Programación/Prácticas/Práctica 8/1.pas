PROGRAM Ejercicio1;
CONST
	N=100;
TYPE
	TAlumno = RECORD
		Nombre: String;
		Apellido: String;
		Exp:Integer;
		nota: Real;
		superada: Char;
	END;
	TAlumnos = ARRAY [1..N] OF TAlumno;
VAR
	alumnos: TAlumnos;
	cantidad: Integer;
	PROCEDURE LeerAlumnos (num: Integer; VAR alumnos: TAlumnos);
	VAR 
		i: Integer;
	BEGIN
		FOR i:=1 TO num DO
		BEGIN
			readln (alumnos[i].nombre);
			readln (alumnos[i].apellido);
			readln (alumnos[i].exp);
			readln (alumnos[i].nota);
			readln (alumnos[i].superada);
		END;
	END;
	
	PROCEDURE OrdenarAlumnos (num: Integer; VAR alumnos: TAlumnos);
	VAR
		i,j: Integer;
		aux: TAlumno;
	BEGIN
		FOR i:=1 TO num-1 DO
			FOR j:=i+1 TO num DO 
			BEGIN
				IF (alumnos[i].exp > alumnos[j].exp) THEN
				BEGIN
					aux:=alumnos[i];
					alumnos[i]:=alumnos[j];
					alumnos[j]:=aux;
				END;
			END;
	END;
	PROCEDURE ImprimirAlumnos (num: Integer; alumnos: TAlumnos);
	VAR
		i: Integer;
	BEGIN
		FOR i:=1 TO num DO
		BEGIN
			writeln (alumnos[i].nombre);
			writeln (alumnos[i].apellido);
			writeln (alumnos[i].exp);
			writeln (alumnos[i].nota:0:2);
			IF (alumnos[i].superada='s') OR (alumnos[i].superada='S') THEN
				writeln ('Prueba superada')
			ELSE
				writeln ('Prueba NO superada');
			writeln;
		END;
	END;
BEGIN
	readln (cantidad);
	LeerAlumnos (cantidad, alumnos);
	OrdenarAlumnos (cantidad, alumnos);
	ImprimirAlumnos (cantidad, alumnos);
END.