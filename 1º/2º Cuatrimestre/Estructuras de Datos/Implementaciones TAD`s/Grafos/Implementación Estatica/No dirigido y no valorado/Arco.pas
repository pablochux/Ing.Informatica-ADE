UNIT Arco;
INTERFACE
	USES Nodo;
	TYPE
		{TipoArco representa una arista. La cual une dos nodos, que en la implementación serán extremo1 y extremo2. Como es un Grafo No dirigido no importa el orden de extremo1 y extremo2}
		TipoArco = RECORD
			extremo1: TipoNodo;
			extremo2: TipoNodo;
		END;

	{Cabeceras Subprogramas}
		
	PROCEDURE CrearArco (nodo1: TipoNodo; nodo2: TipoNodo; VAR arco: TipoArco);
	PROCEDURE Extremo1 (arco: TipoArco; VAR n: TipoNodo);
	PROCEDURE Extremo2 (arco: TipoArco; VAR n: TipoNodo);
	
	PROCEDURE Asignar (arcoO: TipoArco; VAR arcoD: TipoArco);
	FUNCTION Iguales (arcoA: TipoArco; arcoB: TipoArco): Boolean;
IMPLEMENTATION
	{Subprogramas}
	PROCEDURE CrearArco (nodo1: TipoNodo; nodo2: TipoNodo; VAR arco: TipoArco);
	BEGIN
		Nodo.Asignar(nodo1, arco.extremo1);
		Nodo.Asignar(nodo2, arco.extremo2);
	END;	
	PROCEDURE Extremo1 (arco: TipoArco; VAR n: TipoNodo);
	BEGIN
		Nodo.Asignar(arco.extremo1, n);	
	END;

	PROCEDURE Extremo2 (arco: TipoArco; VAR n: TipoNodo);
	BEGIN
		Nodo.Asignar(arco.extremo2, n);
	END;

	PROCEDURE Asignar (arcoO: TipoArco; VAR arcoD: TipoArco);
	VAR
		auxArco1, auxArco2: TipoNodo;

	BEGIN
		Extremo1(arcoO, auxArco1);
		Extremo2(arcoO, auxArco2);
		Nodo.Asignar(auxArco1, arcoD.extremo1);
		Nodo.Asignar(auxArco2, arcoD.extremo2);
	END;
	FUNCTION Iguales (arcoA: TipoArco; arcoB: TipoArco): Boolean;
	VAR
		auxArcoA1, auxArcoA2, auxArcoB1, auxArcoB2: TipoNodo;

	BEGIN
		Extremo1(arcoA, auxArcoA1);
		Extremo2(arcoA, auxArcoA2);
		Extremo1(arcoB, auxArcoB1);
		Extremo2(arcoB, auxArcoB2);
		{Como el Grafo no es dirigido, se comprueba que los extremos no estén cambiados. Ya que es igual el arco (3,4) que el (4,3)}
		Iguales:= Nodo.Iguales(auxArcoA1, auxArcoB1) AND Nodo.Iguales(auxArcoA2, auxArcoB2) OR Nodo.Iguales(auxArcoA2, auxArcoB1) AND Nodo.Iguales(auxArcoA1, auxArcoB2);
	END;
END.