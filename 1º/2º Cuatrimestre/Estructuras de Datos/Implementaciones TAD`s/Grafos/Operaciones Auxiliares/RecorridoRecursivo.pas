{Se pide implementar un recorrido sobre grafos de forma recursiva}

PROCEDURE Recorrido (g: TGrafo; VAR lista: TipoLista);
VAR
	conjuntoNodos: TipoConjuntoNodos;
	n: TipoNodo;

BEGIN
	CrearVacia(lista);
	IF (NOT EsGrafoVacio(g)) THEN {Si la lista no es vacía tengo nodos por lo que tengo recorrigo}
	BEGIN
		Nodos(g, conj-nodos); {Como no se ha dado el nodo de principio del recorrido se busca un nodo al azar}
		Elegir(conjuntoNodos, n); {Se elige un nodo}
		RecorridoAux(g, lista, n, n); {La cabecera no vale porque falta el nodo de partida, por lo que debes pasar la cabecera}
	END;
END;

PROCEDURE RecorridoAux (g: TipoGrafo; VAR lista: TipoLista; ant, actual: TipoNodo);
VAR
	conjuntoNodos: TipoConjuntoNodos;
	n: TipoNodo;

BEGIN
	IF (NOT Pertenece(actual, lista)) THEN {Si el 1 no está en la lista}
	BEGIN
		InsertarFinal(actual, lista); {Se inserta el nodo que no estaba en la lista}
		Adyacentes(g, actual, conjuntoNodos); {Se sacan los adyacentes del nodo}
		Quitar(conjuntoNodos, ant); {Esto evita que el nodo vaya por atrás y hace al nodo avanzar (quitas el anterior del nodo para que no lo ponga)}
		WHILE (NOT EsConjuntoVacio(conjuntoNodos)) DO
		BEGIN
			Elegir(conjuntoNodos, n);
			Quitar(n, conjuntoNodos);
			IF (NOT Pertenece(n, lista)) THEN 
			BEGIN
				RecorridoAux(g, lista, actual, n);
			END;
		END;
	END;
END;
{El ultimo caso comprueba que el nodo ya estaba, por lo que se ha visto por dos ramas distintas, con lo cual es un ciclo}