UNIT TADArco;
INTERFACE
	USES TADNodo, TADCoste;
	TYPE
		{TipoArco representa una arista. La cual une dos nodos. Como el grafo en la implementación serán origen y destino.}
		TipoArco = RECORD
			origen: TipoNodo;
			destino: TipoNodo;
			coste: TipoCoste;
		END;

	{Cabeceras Subprogramas}
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearArco (nodo1: TipoNodo; nodo2: TipoNodo; coste1: TipoCoste; VAR arco: TipoArco);
	{Crea un arco a partir de los dos nodos y el coste que recibe}

	{OBSERVADORAS SELEECTORAS}
	PROCEDURE Origen (arco: TipoArco; VAR n: TipoNodo);
	{Devuelve el origen del arco que recibe}
	PROCEDURE Destino (arco: TipoArco; VAR n: TipoNodo);
	{Devuelve el destino del arco que recibe}
	PROCEDURE Coste (arco: TipoArco; VAR coste1: TipoCoste);
	{Devuelve el coste del arco que recibe}

	{OPERACIONES AUXILIARES}
	PROCEDURE Asignar (arcoOrigen: TipoArco; VAR arcoDestino: TipoArco);
	{Asigna un arco a otro}
	FUNCTION Iguales (arcoA: TipoArco; arcoB: TipoArco): Boolean;
	{Devuelve el resultado de evaluar si un arco es igual que otro}

IMPLEMENTATION
	{Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearArco (nodo1: TipoNodo; nodo2: TipoNodo; coste1: TipoCoste; VAR arco: TipoArco);
	BEGIN
		TADNodo.Asignar(nodo1, arco.origen);
		TADNodo.Asignar(nodo2, arco.destino);
		TADCoste.Asignar(coste1, arco.coste);
	END;	

	{OBSERVADORAS SELEECTORAS}	
	PROCEDURE Origen (arco: TipoArco; VAR n: TipoNodo);
	BEGIN
		TADNodo.Asignar(arco.origen, n);	
	END;

	PROCEDURE Destino (arco: TipoArco; VAR n: TipoNodo);
	BEGIN
		TADNodo.Asignar(arco.destino, n);
	END;

	PROCEDURE Coste (arco: TipoArco; VAR c: TipoCoste);
	BEGIN
		TADCoste.Asignar(arco.coste, c);
	END;

	{OPERACIONES AUXILIARES}
	{Primero se extraen los dos extremos del arcoOrigen que se recibe y se insertan en el arcoDestino}
	PROCEDURE Asignar (arcoOrigen: TipoArco; VAR arcoDestino: TipoArco);
	VAR
		auxArco1, auxArco2: TipoNodo;

	BEGIN
		Origen(arcoOrigen, auxArco1);
		Destino(arcoOrigen, auxArco2);
		TADNodo.Asignar(auxArco1, arcoDestino.origen);
		TADNodo.Asignar(auxArco2, arcoDestino.destino);
	END;

	{Primero se sacan los extremos de los arcos y luego se comparan}
	FUNCTION Iguales (arcoA: TipoArco; arcoB: TipoArco): Boolean;
	VAR
		auxArcoA1, auxArcoA2, auxArcoB1, auxArcoB2: TipoNodo;

	BEGIN
		Origen(arcoA, auxArcoA1);
		Destino(arcoA, auxArcoA2);
		Origen(arcoB, auxArcoB1);
		Origen(arcoB, auxArcoB2);
		{Como el grafo es dirigido, no hace falta comprobar las dos posibilidades}
		Iguales:= TADNodo.Iguales(auxArcoA1, auxArcoB1) AND TADNodo.Iguales(auxArcoA2, auxArcoB2);
	END;
END.