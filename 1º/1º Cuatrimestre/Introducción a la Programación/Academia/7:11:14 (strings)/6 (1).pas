PROGRAM pinvertirCadena;
{Programa que pide una cadena y le da la vuelta}
VAR
	cadena: string;
	aux: char;
	FUNCTION InvertirCadena (cadena: String): String;
	VAR 
		resultado:= string;
	BEGIN
		resultado:= '';
		FOR i:=longitud DOWNTO 1 DO
		BEGIN
			resultado:=resultado + cadena[i];
		END;
	END;
BEGIN