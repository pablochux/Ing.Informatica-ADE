PROGRAM pinvertirCadena;
{Programa que pide una cadena y le da la vuelta}
VAR
	cadena: string;
	aux: char;
	FUNCTION InvertirCadena (cadena: String): String;
	VAR 
		resultado:= string;
		i, j: Integer;
	BEGIN
		resultado:= '';
		j:= longitud;
		FOR i:=1 TO longitud DO
		BEGIN
			resultado:= cadena[i] + resultado
			j:= j - 1;
		END;
		InvertirCadena:= resultado;
	END;
BEGIN