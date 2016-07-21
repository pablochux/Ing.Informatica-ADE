UNIT TADGrafo;
INTERFACE
	USES TADNodo, TADArco, TADCoste, TADConjuntoArcos, TADConjuntoNodos;
	TYPE
		{En la implementación dinámica del TAD Grafo se necesitan dos tipos de listas, una para los nodos y otra para los arcos (aristas)}
		{TipoListaAdyacencia será el tipo para la lista de los arcos, se trata de una implementación de una lista dinámica simplemente enlazada}
		{Cada nodo de la Lista de Adyacencia está compuesto por el nodo, el coste y el sig. No se utiliza el TipoArco ya que no se necesita el origen y el destino del arco.}
		TipoListaAdyacencia = ^TipoNodoListaAdyacencia;
		TipoNodoListaAdyacencia = RECORD
			destino: TipoNodo;
			coste: TipoCoste;
			sig: TipoListaAdyacencia;
		END;
		{La matriz de adyacencia es una lista dinámica simplemente enlazada. Su tipo nodo es un registro de tres campos, origen: es el nodo; listaAdyacencia: es el puntero hacia la listaAdyacencia (que será la lista con todas las aristas) y sig: es el puntero al siguiente nodo.}
		TipoMatrizAdyacencia = ^TipoNodoMatrizAdyacencia;
		TipoNodoMatrizAdyacencia = RECORD
			origen: TipoNodo;
			listaAdyacencia: TipoListaAdyacencia;
			sig: TipoMatrizAdyacencia;
		END;
		TipoGrafo = TipoMatrizAdyacencia;

	{Cabeceras Subprogramas}

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearGrafoVacio (VAR grafo: TipoGrafo);
	(* POST: "Construye un grafo inicial sin nodos ni arcos" *)	
	PROCEDURE InsertarNodo (VAR grafo: TipoGrafo; nodo: TipoNodo); 
	(* POST: Inserta el nodo n *)	
	PROCEDURE InsertarArco (VAR grafo: TipoGrafo; arco: TipoArco); 
	(* POST: Inserta el arco a *)
	
	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsGrafoVacio (grafo: TipoGrafo): Boolean; 
	(* POST: resultado = "grafo es o no vacio" *)	
	PROCEDURE Adyacentes (grafo: TipoGrafo; VAR conjuntoNodos: TipoConjuntoNodos; nodo: TipoNodo);
	{ POST: Devuelve los nodos adyacentes a uno dado }
	
	{OBSERVADORAS SELECTORAS}
	PROCEDURE DameNodos (grafo: TipoGrafo; VAR conjuntoNodos: TipoConjuntoNodos);
	{POST: Devuelve el conjunto de los nodos actuales de un grafo}
	PROCEDURE DameArcos(grafo: TipoGrafo; VAR conjuntoArcos: TipoConjuntoArcos); 
	{POST: Devuelve el conjunto de los arcos actuales de un grafo}

	{CONSTRUCTORAS NO GENERADORAS}
	PROCEDURE BorrarNodo (VAR grafo: TipoGrafo; VAR nodo: TipoNodo); 
	{POST: Elimina un nodo y sus arcos incidentes }
	PROCEDURE BorrarArco (VAR grafo: TipoGrafo; VAR arco: TipoArco);
	{POST: Elimina un arco}

IMPLEMENTATION
	{Subprogramas}
	{Operaciones auxiliares}
	{subprograma auxiliar que indica si el nodo pertenece al grafo o no}
	FUNCTION PerteneceNodoMatrizAdyacencia (grafo: TipoGrafo; nodo: TipoNodo): Boolean;
	VAR
		auxConjuntoNodos: TipoConjuntoNodos;
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		IF (NOT EsGrafoVacio(grafo)) THEN 
		BEGIN
			DameNodos(grafo, auxConjuntoNodos);
			encontrado:= TADConjuntoNodos.Pertenece(auxConjuntoNodos, nodo);
		END;	
		PerteneceNodoMatrizAdyacencia:= encontrado;
	END;

	{Subprograma auxiliar que busca si el arco ya pertenece al nodo o no}
	FUNCTION PerteneceNodoListaAdyacencia (grafo: TipoGrafo; auxOrigen, auxDestino: TipoNodo): Boolean;
	VAR
		encontrado: Boolean;

	BEGIN 
		encontrado:= FALSE;
		WHILE (NOT encontrado) AND (grafo <> NIL) DO 
		BEGIN
			IF (auxOrigen = grafo^.origen) THEN 
			BEGIN
				WHILE (grafo^.listaAdyacencia <> NIL) AND (NOT encontrado) DO
				BEGIN
					encontrado:= TADNodo.Iguales(auxDestino, grafo^.listaAdyacencia^.destino);
					IF (NOT encontrado) THEN 
					BEGIN
						grafo^.listaAdyacencia:= grafo^.listaAdyacencia^.sig;
					END;
				END;
			END;
			grafo:= grafo^.sig;
		END;
		PerteneceNodoListaAdyacencia:= encontrado;
	END;

	{CONSTRUCTORAS GENERADORAS}
	PROCEDURE CrearGrafoVacio (VAR grafo: TipoGrafo);
	BEGIN
		grafo:= NIL;
	END;

	PROCEDURE InsertarNodo (VAR grafo: TipoGrafo; nodo: TipoNodo); 
	VAR
		auxNodoAd: TipoMatrizAdyacencia;

	BEGIN
		IF (NOT PerteneceNodoMatrizAdyacencia(grafo, nodo)) THEN 
		BEGIN
			NEW(auxNodoAd);
			TADNodo.Asignar(nodo, auxNodoAd^.origen);
			auxNodoAd^.sig:= grafo;
			grafo:= auxNodoAd;
		END;
	END;

	PROCEDURE InsertarArco (VAR grafo: TipoGrafo; arco: TipoArco); 
	VAR
		auxOrigen, auxDestino: TipoNodo;
		auxCoste: Integer;
		auxNodoListaAd: TipoListaAdyacencia;

	BEGIN
		{Se saca el origen y el destino del arco}
		TADArco.Origen(arco, auxOrigen);
		TADArco.Destino(arco, auxDestino);
		TADArco.Coste(arco, auxCoste);
		{Se insertan en la matriz de adyacencia, InsertarNodo se encarga de no insertarlos si ya están insertados}
		InsertarNodo(grafo, auxOrigen);
		InsertarNodo(grafo, auxDestino);
		auxGrafo:= grafo;
		WHILE (auxgrafo^.origen <> auxOrigen) DO
		BEGIN
			auxGrafo:= auxGrafo^.sig;
		END;
		IF (NOT PerteneceNodoListaAdyacencia(auxGrafo^.listaAdyacencia, auxOrigen, auxDestino)) THEN 
		BEGIN
			NEW(auxNodoListaAd);
			TADNodo.Asignar(auxDestino, auxNodoListaAd^.destino);
			auxNodoListaAd^.coste:= auxCoste;
			auxNodoListaAd^.sig:= auxGrafo^.listaAdyacencia;
			auxGrafo^.listaAdyacencia:= auxNodoListaAd;
		END;
	END;
	
	{OBSERVADORAS NO SELECTORAS}
	FUNCTION EsGrafoVacio (grafo: TipoGrafo): Boolean; 
	BEGIN
		EsGrafoVacio:= (grafo = NIL);
	END;
	
	{Busca el nodo y recorre toda su lista en busca de adyacentes, si los encuentra los pone en el conjunto}
	PROCEDURE Adyacentes (grafo: TipoGrafo; VAR conjuntoNodos: TipoConjuntoNodos; nodo: TipoNodo);
	VAR
		encontradoNodo: Boolean;


	BEGIN
		TADConjuntoNodos.CrearConjuntoVacio(conjuntoNodos);
		{Búsqueda nodo}
		encontradoNodo:= FALSE;
		WHILE (grafo <> NIL) AND (NOT encontradoNodo) DO
		BEGIN
			encontradoNodo:= TADNodo.Iguales(nodo, grafo^.origen);
			IF (NOT encontradoNodo) THEN 
			BEGIN
				grafo:= grafo^.sig;
			END;
		END;
		{Poner adyacentes}
		IF (encontradoNodo) THEN 
		BEGIN
			WHILE (grafo^.listaAdyacencia <> NIL) DO
			BEGIN
				TADConjuntoNodos.Poner(conjuntoNodos, grafo^.listaAdyacencia^.destino);
				grafo^.listaAdyacencia:= grafo^.listaAdyacencia^.sig;
			END;
		END;
	END;
	
	{OBSERVADORAS SELECTORAS}
	{Se busca en la lista principal, y se van poniendo los nodos en el conjunto}
	PROCEDURE DameNodos (grafo: TipoGrafo; VAR conjuntoNodos: TipoConjuntoNodos);
	BEGIN
		TADConjuntoNodos.CrearConjuntoVacio(conjuntoNodos);
		WHILE (grafo <> NIL) DO
		BEGIN
			TADConjuntoNodos.Poner(conjuntoNodos, grafo^.origen);
			grafo:= grafo^.sig;
		END;
	END;

	{Se va avanzando los nodos y poniendo todos los arcos de los nodos}
	PROCEDURE DameArcos(grafo: TipoGrafo; VAR conjuntoArcos: TipoConjuntoArcos); 
	VAR
		auxArco: TipoArco;

	BEGIN
		TADConjuntoArcos.CrearConjuntoVacio(conjuntoArcos);
		{Avance nodos}
		WHILE (grafo <> NIL) DO
		BEGIN
			{avance arcos}
			WHILE (grafo^.listaAdyacencia <> NIL) DO
			BEGIN
				TADArco.CrearArco(grafo^.origen, grafo^.listaAdyacencia^.destino, grafo^.listaAdyacencia^.coste, auxArco);
				TADConjuntoArcos.Poner(conjuntoArcos, auxArco);
				grafo^.listaAdyacencia:=grafo^.listaAdyacencia^.sig;	
			END;
			grafo:= grafo^.sig;
		END;
	END;

	{CONSTRUCTORAS NO GENERADORAS}
	{Borra el nodo y todos los arcos que esten afectados}
	PROCEDURE BorrarNodo (VAR grafo: TipoGrafo; VAR nodo: TipoNodo); 
	VAR
		encontradoNodo: Boolean;
		auxGrafo, auxGrafoAnt: TipoGrafo;
		auxListaAdyacencia: TipoListaAdyacencia;

	BEGIN
		{Encontrar nodo}
		encontradoNodo:= FALSE;
		auxGrafo:= grafo;
		auxGrafoAnt:= NIL;
		WHILE (auxGrafo <> NIL) AND (NOT encontradoNodo) DO
		BEGIN
			encontradoNodo:= TADNodo.Iguales(auxGrafo^.origen, nodo);
			IF (NOT encontradoNodo) THEN 
			BEGIN
				auxGrafoAnt:= auxGrafo;
				auxGrafo:= auxGrafo^.sig;
			END;
		END;
		IF (encontradoNodo) THEN 
		BEGIN
			WHILE (auxgrafo^.listaAdyacencia <> NIL) DO
			BEGIN
				auxListaAdyacencia:= auxgrafo^.listaAdyacencia;
				auxGrafo:= auxGrafo^.sig;
				DISPOSE(auxListaAdyacencia);	
			END;
			IF (auxGrafoAnt = NIL) THEN 
			BEGIN
				grafo:= grafo^.sig;
			END
			ELSE 
			BEGIN
				auxGrafoAnt^.sig:= auxGrafo^.sig;
			END;
			DISPOSE(auxGrafo);
		END;
		{BorrarListaAdyacentes}
		{BorrarNodo}
	END;

	{Borra el arco}
	PROCEDURE BorrarArco (VAR grafo: TipoGrafo; VAR arco: TipoArco);
	VAR
		auxOrigen, auxDestino: TipoNodo;
		auxGrafo: TipoGrafo;
		encontradoNodo: Boolean;
		auxListaAdyacencia, auxListaAdyacenciaAnt: TipoListaAdyacencia;

	BEGIN
		TADArco.Origen(arco, auxOrigen);
		TADArco.Destino(arco, auxDestino);
		encontradoNodo:= FALSE;
		auxGrafo:= grafo;
		{Búsqueda nodo}
		WHILE (auxGrafo <> NIL) AND (NOT encontradoNodo) DO
		BEGIN
			encontradoNodo:= TADNodo.Iguales(auxGrafo^.origen, auxOrigen);
			IF (NOT encontradoNodo) THEN 
			BEGIN
				auxGrafo:= auxGrafo^.sig;
			END;
		END;
		{Búsqueda arista}
		IF (encontradoNodo) THEN 
		BEGIN
			encontradoNodo:= FALSE;
			auxListaAdyacencia:= auxGrafo^.listaAdyacencia;
			auxListaAdyacenciaAnt:= NIL;
			WHILE (auxListaAdyacencia <> NIL) AND (NOT encontradoNodo) DO
			BEGIN
				encontradoNodo:= TADNodo.Iguales(auxListaAdyacencia^.Destino, auxOrigen);
				IF (NOT encontradoNodo) THEN 
				BEGIN
					auxListaAdyacenciaAnt:= auxListaAdyacencia;
					auxListaAdyacencia:= auxListaAdyacencia^.sig;
				END;
			END;
		END;
		{Si se ha encontrado el nodo y la arista}
		IF (encontradoNodo) THEN 
		BEGIN
			IF (auxListaAdyacenciaAnt = NIL) THEN 
			BEGIN
				auxListaAdyacencia:= auxListaAdyacencia^.sig;
			END
			ELSE 
			BEGIN
				auxListaAdyacenciaAnt^.sig:= auxListaAdyacencia^.sig;
			END;
			DISPOSE(auxListaAdyacencia);
		END;
	END;
END.