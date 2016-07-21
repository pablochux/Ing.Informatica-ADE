{Se pide implementar una función que diga si un grafo tiene un ciclo o no de forma recursiva.}
{Algoritmo: 
	1. Se sacan todos los nodos del grafo y se ponen en un conjunto
	2. Se elige uno, se elimina del conjunto (para que no se repita), se crea la lista vacia y se prueba a ver si hay un ciclo.
	3. Si hay un ciclo, devuelve TRUE.
	4. Si no hay un ciclo, sigue sacando nodos, borrandolos e intentando probar si hay un ciclo hasta que el conjunto de nodos del grafo sea vacio.
}

FUNCTION TieneCiclo (g: TipoGrafo): Boolean;
VAR
	conjuntoNodos: TipoConjuntoNodos;
	tiene: Boolean;

BEGIN
	{No nos dan un nodo de partida por lo que se sacan todos los nodos del grafo}
	Nodos(g, conjuntoNodos);	
	Tiene:= FALSE;
	{Se comprueba si hay ciclos en el grafo hasta que el grafo sea vacio o haya un ciclo}
	WHILE (NOT EsConjuntoVacio(conjuntoNodos)) AND (NOT Tiene) DO
	BEGIN
		{Se elige un nodo}
		Elegir(conjuntoNodos, n);
		{Se elimina del conjunto para que si no hay un ciclo a partir de ese nodo no se vuelva a intentar}
		Quitar(conjuntoNodos, n); 
		{Reseteo la lista, en la que se van a ir guardado el ciclo}
		CrearVacia(lista);
		{Se llama a TieneCicloAux para que compruebe sí el grafo tiene un ciclo, en caso de que no tenga, devolverá false y una lista que posteriormente se reseteara. En caso de que tenga dvuelve TRUE se sale del bucle y la lista tiene el ciclo.}
		tiene:= TieneCicloAux(g, lista, n, n);
	END;
	{El valor de la función será el valor que tenga la variable Tiene}
	TieneCiclo:= Tiene;
END;

{La función que nos dan no nos sirve porque solo se le pasa la lista y para saber si tiene ciclo o no debemos saber cual es el nodo actual y el anterior, por lo que creamos una función auxiliar}
FUNCTION TieneCicloAux (g: TipoGrafo; VAR lista: TipoLista; ant, actual: TipoNodo): Boolean;
VAR
	Tiene: Boolean;

BEGIN
	Tiene= FALSE;
	{Si el elemento actual (en el que se encuentra "el puntero") no está incluido en la lista}
	IF (NOT Pertenece(actual, lista)) THEN 
	BEGIN
		{Se inserta el elemento actual del ciclo}
		InsertaFinal(act, lista);
		{Se sacan los adyacentes de actual}
		Adyacentes(g, act, conjuntoNodos);
		{Se quita anterior del conjunto, para que no se vuelva a repetir}
		Quitar(ant, conjuntoNodos);
		{Mientras no se hayan sacado todos los nodos del conjunto}
		WHILE (NOT EsConjuntoVacio(conjuntoNodos)) DO
		BEGIN
			{Se elige uno y se quita para que no se repita}
			Elegir(conjuntoNodos, n);
			Quitar(n, conjuntoNodos);
			{Sino pertenece a la lista, se llama a la función con el nuevo nodo como actual y el actual como anterior}
			IF (NOT Pertenece(n, lista)) THEN 
			BEGIN
				TieneCicloAux(g, lista, act, n);
			END
			{Si pertenece a la lista es que hay un ciclo, pòr lo que se devuelve TRUE}
			ELSE 
			BEGIN
				Tiene:= TRUE;
			END;
		END;
	END;
END;