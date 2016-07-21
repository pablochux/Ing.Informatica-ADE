UNIT Grafo;
INTERFACE
	USES Nodo, Arco, ConjuntoNodos, ConjuntoArcos;
	TYPE
		TipoRangoGrafo = Nodo.MIN..Nodo.MAX;
		TipoGrafo = ARRAY [TipoRangoGrafo, TipoRangoGrafo] of Boolean;
		

	{Cabeceras Subprogramas}
	
	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearGrafoVacio (VAR grafo: TipoGrafo);
	(* POST: "Construye un grafo inicial sin nodos ni arcos" *)
	PROCEDURE InsertarNodo (VAR grafo: TipoGrafo; auxNodo: TipoNodo); 
	(* POST: Inserta el nodo n *)
	PROCEDURE InsertarArco (VAR grafo: TipoGrafo; auxArco: TipoArco); 
	(* POST: Inserta el arco a *)
	
	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsGrafoVacio (grafo: TipoGrafo): Boolean; 
	(* POST: resultado = "grafo es o no vacio" *)
	PROCEDURE Adyacentes (grafo: TipoGrafo; VAR conjuntoDeNodos: TipoConjuntoNodos; auxNodo: TipoNodo);
	{ POST: Devuelve los nodos adyacentes a uno dado }
	
	{ OBSERVADORAS SELECTORAS }
	PROCEDURE DameNodos (grafo: TipoGrafo; VAR conjuntoDeNodos: TipoConjuntoNodos);
	{POST: Devuelve el conjunto de los nodos actuales de un grafo}
	PROCEDURE DameArcos(grafo: TipoGrafo; VAR conjuntoDeArcos: TipoConjuntoArcos); 
	{POST: Devuelve el conjunto de los arcos actuales de un grafo}
	
	{ CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE BorrarNodo (VAR grafo: TipoGrafo; auxNodo: TipoNodo); 
	{POST: Elimina un nodo y sus arcos incidentes }
	PROCEDURE BorrarArco (VAR grafo: TipoGrafo; auxArco: TipoArco);
	{POST: Elimina un arco}

IMPLEMENTATION
	{Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	{CrearGrafoVacio crea la matriz de adyacencia y la rellena de FALSE. Como es un grafo no dirigido se puede utilizar solo una parte de la matriz. En esta implementación se ha utilizado la diagonal superior. Por eso j empieza en i y no en el mínimo.}
	PROCEDURE CrearGrafoVacio (VAR grafo: TipoGrafo);
	VAR
		i, j: TipoNodo;

	BEGIN
		FOR i:=Nodo.MIN TO Nodo.MAX DO
		BEGIN
			FOR j:=i TO Nodo.MAX DO
			BEGIN						
				grafo[i, j]:= FALSE;
			END;			
		END;	
	END;

	{Los nodos se representan en la matriz de adyacencia mediante un TRUE en la diagonal. Se cambia el valor de la matriz de adyacencia correspondiente al nodo que se quiere insertar por TRUE}
	PROCEDURE InsertarNodo (VAR grafo: TipoGrafo; auxNodo: TipoNodo); 
	BEGIN
		grafo[auxNodo, auxNodo]:= TRUE;
	END;

	{La inserción de un arco implica primero insertar los nodos y posteriormente el arco. Puede que los nodos ya esten insertados pero se insertan por si acaso, si ya están insertados no afecta. Depués se inserta el arco, que se representa como grafo[extremo1, extremo2]. Teniendo en cuenta que como solo utilizamos la diagonal superior de la matriz no es lo mismo el (3,4) que el (4,3)}
	PROCEDURE InsertarArco (VAR grafo: TipoGrafo; auxArco: TipoArco); 
	VAR
		auxExtremo1, auxExtremo2: TipoNodo;

	BEGIN
		{Se extraen los nodos que se van a insertar}
		Arco.Extremo1(auxArco, auxExtremo1);
		Arco.Extremo2(auxArco, auxExtremo2);
		{Se insertan los nodos del arco}
		InsertarNodo(grafo, auxExtremo1);
		InsertarNodo(grafo, auxExtremo2);
		{Se inserta el arco entre los dos nodos}
		IF (Nodo.Mayor(auxExtremo2, auxExtremo1)) THEN {Si [-, +], se inserta [+, -]. Como solo estamos en la diagonal superior las columna no puede ser mayor que la fila. No se inserta (5, 1) sino (1, 5)}
		BEGIN
			grafo[auxExtremo1, auxExtremo2]:= TRUE;
		END
		ELSE 
		BEGIN
			grafo[auxExtremo2, auxExtremo1]:= TRUE;
		END;
	END;

	
	{ OBSERVADORAS NO SELECTORAS }
	{Recorre la diagonal de la matriz y comprueba si el grafo es vacio}
	FUNCTION EsGrafoVacio (grafo: TipoGrafo): Boolean; 
	VAR
		vacio: Boolean;
		i: TipoNodo;

	BEGIN
		vacio:= TRUE;
		FOR i:= Nodo.MIN TO Nodo.MAX DO
		BEGIN
			vacio:= vacio AND (grafo[i, i] = FALSE);
		END;
		EsGrafoVacio:= vacio;
	END;

	{Devuelve todos los nodos adyacentes a otro nodo}
	PROCEDURE Adyacentes (grafo: TipoGrafo; VAR conjuntoDeNodos: TipoConjuntoNodos; auxNodo: TipoNodo); {Comprobar que está bien}
	VAR
		i: TipoNodo;

	BEGIN
		{Se crea un conjunto vacio para almacenar los nodos}
		ConjuntoNodos.CrearConjuntoVacio(conjuntoDeNodos);
		{Búsqueda de adyacente}
		{En su misma columna}
		FOR i:= Nodo.MIN TO PRED(auxNodo) DO
		BEGIN
			IF (grafo[i, auxNodo]) THEN 
			BEGIN
				ConjuntoNodos.Poner(conjuntoDeNodos, i);	
			END;
		END;
		{En su misma fila}
		FOR i:= SUCC(auxNodo) TO Nodo.MAX DO
		BEGIN
			IF (grafo[auxNodo, i]) THEN 
			BEGIN
				ConjuntoNodos.Poner(conjuntoDeNodos, i);	
			END;
		END;		
	END;

	
	{ OBSERVADORAS SELECTORAS }
	{Se crea un conjunto y se devuelven todos los nodos del grafo en el}
	PROCEDURE DameNodos (grafo: TipoGrafo; VAR conjuntoDeNodos: TipoConjuntoNodos);
	VAR 
		i: TipoNodo;
	BEGIN
		{Se crea un conjunto vacio para almacenar los nodos}
		ConjuntoNodos.CrearConjuntoVacio(conjuntoDeNodos);
		{Se buscan los nodos por la diagonal de la matriz y se añaden}
		FOR i:= Nodo.MIN TO Nodo.MAX DO
		BEGIN
			IF (grafo[i,i]) THEN 
			BEGIN
				ConjuntoNodos.Poner(conjuntoDeNodos, i);
			END;
		END;
	END;

	{Se devuelven todos los arcos del grafo en un conjunto}
	PROCEDURE DameArcos(grafo: TipoGrafo; VAR conjuntoDeArcos: TipoConjuntoArcos); 
	VAR
		i, j: TipoNodo;
		auxArco: TipoArco;

	BEGIN
		{Se crea un conjunto vacio para almacenar todos los arcos}
		ConjuntoArcos.CrearConjuntoVacio(conjuntoDeArcos);
		{Se recorre toda la matriz de adyacencia y se van creando arcos y poniendolos en el conjunto}
		FOR i:= Nodo.MIN TO Nodo.MAX DO
		BEGIN
			FOR j:=i TO Nodo.MAX DO
			BEGIN
				IF (grafo[i, j]) THEN 
				BEGIN
					Arco.CrearArco(i, j, auxArco);
					ConjuntoArcos.Poner(ConjuntoDeArcos, auxArco);	
				END;
			END;
		END;		
	END;

	
	{ CONSTRUCTORAS NO GENERADORAS }
	{BorrarNodo borra tanto el nodo como todos sus arcos (aristas)}
	PROCEDURE BorrarNodo (VAR grafo: TipoGrafo; auxNodo: TipoNodo); 
	VAR
		i: TipoNodo;

	BEGIN
		{Se elimina el Nodo de la diagonal y además se eliminan todos los arcos de su misma columna}
		FOR i:= Nodo.MIN TO auxNodo DO
		BEGIN
			grafo[i, auxNodo]:= FALSE;
		END;
		{En su misma fila}
		FOR i:= SUCC(auxNodo) TO Nodo.MAX DO
		BEGIN
			grafo[auxNodo, i]:= FALSE;
		END;	
	END;

	{BorrarArco borra solo el arco ente dos nodos (la arista)}
	PROCEDURE BorrarArco (VAR grafo: TipoGrafo; auxArco: TipoArco);
	VAR
		auxExtremo1, auxExtremo2: TipoNodo;

	BEGIN
		{Se extraen los nodos del arco}
		Arco.Extremo1(auxArco, auxExtremo1);
		Arco.Extremo2(auxArco, auxExtremo2);
		{Se comrueba el orden de los nodos y se elimina el arco}
		IF (Mayor(auxExtremo1, auxExtremo2)) THEN 
		BEGIN
			grafo[auxExtremo2, auxExtremo1]:= FALSE;
		END
		ELSE 
		BEGIN
			grafo[auxExtremo1, auxExtremo2]:= FALSE;
		END;
	END;
END.