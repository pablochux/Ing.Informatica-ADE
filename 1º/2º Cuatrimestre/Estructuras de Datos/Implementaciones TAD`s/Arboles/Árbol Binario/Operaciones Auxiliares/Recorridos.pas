{
Tipos de recorridos:
	Anchura -> de forma Iterativa (mediante una cola)
	Profundidad -> de forma Iterativa (meduiante una pila)
				-> de forma Recursiva
					- InOrden
					- PostOrden
					- PreOrden


	En grafos, el recorrido en anchura es igual que el recorrigo en progundidad, pero se cambia la estructura auxiliar de una pila por una cola 
Recorridos de arboles binarios en PROFUNDIDAD}

{Algoritmo:
1. Se destripa el árbol (HijoDer, hijoIzq y raiz)
2. Se llama a la función en el orden establecido por el tipo del recorrido (en el caso de la raiz, se escribe).}

{Recorrido PreOrden: Raiz-HijoIzq-HijoDer}
PROCEDURE PreOrder (binaryThree: TypeBinaryThree);
VAR
	leftSon, rightSon, root: TypeBinaryThree;

BEGIN
	IF (NOT IsEmpty(binaryThree)) THEN 
	BEGIN
		GiveRightSon(rightSon);
		GiveLeftSon(leftSon);
		GiveRoot(root);
		Write(root);
		PreOrder(leftSon);
		PreOrder(rightSon);
	END;
END;

{Recorrido InOrden: HijoIzq-Raiz-HijoDer}
PROCEDURE InOrder (binaryThree: TypeBinaryThree);
VAR
	leftSon, rightSon, root: TypeBinaryThree;

BEGIN
	IF (NOT IsEmpty(binaryThree)) THEN 
	BEGIN
		GiveRightSon(rightSon);
		GiveLeftSon(leftSon);
		GiveRoot(root);
		InOrder(leftSon);
		Write(root);
		InOrder(rightSon);
	END;
END;

{Recorrido PostOrden: HijoIzq-HijoDer-Raiz}
PROCEDURE PostOrder (binaryThree: TypeBinaryThree);
VAR
	leftSon, rightSon, root: TypeBinaryThree;

BEGIN
	IF (NOT IsEmpty(binaryThree)) THEN 
	BEGIN
		GiveRightSon(rightSon);
		GiveLeftSon(leftSon);
		GiveRoot(root);
		InOrder(leftSon);
		InOrder(rightSon);
		Write(root);
	END;
END;

{Recorrido en anchura para grafos}
PROCEDURE Anchura (arbol: TipoArbolBin; VAR lista: TipoLista);
VAR
	cola: TipoCola;
	auxArbol: TipoArbolBin;
BEGIN
	{Se crea la cola vacia}
	CrearColaVacia(cola);
	{En la lista se deja el recorrido}
	CrearListaVacia(lista);
	IF (NOT EsArbolBinVacio(arbol)) THEN 
	BEGIN
		{Se inserta en la cola, el puntero que apunta al arbol}
		Insertar(arbol, cola);
		WHILE (NOT EsColaVacia(cola)) DO
		BEGIN
			{Se saca el arbol}
			Primero(cola, auxArbol);
			{Se elimina el arbol}
			Eliminar(cola);
			Raiz(auxArbol, auxRaiz);
			HijoDer(auxArbol, auxHd);
			HijoIzq(auxArbol, auxHi);
			{Se inserta la raiz del arbol}
			InsertarFinal(r, lista);
			{Si los hijos no son vacios, se insertan los punteros a la cola}
			IF (NOT EsArbolBinVacio(auxHi)) THEN 
			BEGIN
				Insertar(auxHi, cola);
			END;
			IF (NOT EsArbolBinVacio(auxHd)) THEN 
			BEGIN
				Insertar(auxHd, cola);
			END;
		END;
	END;
END;


{Recorrido en profundidad}
PROCEDURE Profundidad (arbol: TipoArbolBin; VAR lista: TipoLista);
VAR
	pila: TipoCola;
	auxArbol: TipoArbolBin;
BEGIN
	{Se crea la pila vacia}
	CrearpilaVacia(pila);
	{En la lista se deja el recorrido}
	CrearListaVacia(lista);
	IF (NOT EsArbolBinVacio(arbol)) THEN 
	BEGIN
		{Se inserta el puntero al arbol, a la pila}
		Apilar(arbol, pila);
		WHILE (NOT EspilaVacia(pila)) DO
		BEGIN
			{Se saca el arbol}
			Cima(pila, auxArbol);
			{Se elimina el arbol}
			Eliminar(pila);
			Raiz(auxArbol, auxRaiz);
			HijoDer(auxArbol, auxHd);
			HijoIzq(auxArbol, auxHi);
			{Se inserta la raiz del arbol}
			InsertarFinal(r, lista);
			{Si los hijos no son vacios, se insertan los punteros a la pila}
			IF (NOT EsArbolBinVacio(auxHi)) THEN 
			BEGIN
				Insertar(auxHi, pila);
			END;
			IF (NOT EsArbolBinVacio(auxHd)) THEN 
			BEGIN
				Insertar(auxHd, pila);
			END;
		END;
	END;
END;