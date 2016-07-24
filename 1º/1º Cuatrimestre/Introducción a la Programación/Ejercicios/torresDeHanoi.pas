PROGRAM P_TorresHanoi;
{
existen tres corres: Origen, Destino y Auxiliar.
N discos, sus radios van de n..1.
Objetivo: pasar todos los discos (n) desde la torre origen al destino
-> Solo se puede mover un disco en cada movimiento
-> No sep uede colocar un disco de tamaño mayor sobre otro de tamaño menor

Tamaño del problema
 nº discos
Caso base n = 1
Movemos el disco (de tamaño 1) desde ORIGEN al DESTINO.

Suponemos que sabemos mover bloques de n-1 discos
}
PROCEDURE Hanoi (n: Integer; origen, destino, auxiliar: Integer);
BEGIN
	IF n = 1 THEN
	BEGIN
		writeln('Mover disco 1 desde', origen, 'hasta', destino); 
	END
	ELSE
	BEGIN
		Hanoi(n-1, origen, auxiliar, destino);
		writeln('Mover disco', n, 'desde', origen,'hasta', destino);
		Hanoi(n-1, auxiliar, destino, origen);	 	 
	END;	 
END;