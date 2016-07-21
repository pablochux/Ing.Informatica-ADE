Implementación PostFija - Infija mediante Árboles Binarios
{Ejercicio de repaso pilas-listas-arboles}
{Se pretende utilizar el TAD Arbol, el TAD Pila y el TAD Lista. El tipoElemento es char (9, 10 *, -)}
{Como en la pila se van a guardar arboles, el TElemento de la pila Es un TArbolBinario}
{Se te da una lista con elementos en postfija y se te pide que se vaya almacenando en una pila como nodos de arbolBinario y que posteriormente se construya el árbol binario
1. Si se encuentra números se van insertando en la pila los números como hojas (con los dos hijos vacios)
2. Si se encunetra un operador, se buscan los dos números anteriores que estén en la pila y se construye un arbol con raiz el operador y coom hijos los nodos que estaban en la pila que son los operandos
}
{Operacion auxiliar}
{Determinar si lo que se le pasa es un numero o un operador. TRUE -> Numero; FALSE -> OPERANDO}
FUNCTION Determinar (auxChar: Char): Boolean;
BEGIN
	IF (auxChar =  '1') OR (auxChar = '2')  OR (auxChar = '3')  OR (auxChar = '4')  OR (auxChar = '5')  OR (auxChar = '6')  OR (auxChar = '7')  OR (auxChar = '8')  OR (auxChar = '9') THEN 
	BEGIN
		Determinar:= TRUE;
	END
	ELSE 
	BEGIN
		Determinar:= FALSE;
	END;
END;

{Se le pasa la lista y ´tiene que construir un árbol}
PROCEDURE ConstruirArbol (lista: TLista; VAR arbol: TArbolBin);
VAR
	pila: TPila;
	auxLista: TLista;
	{Es la variable que se utiliza para guardar el elemnento de la lista que se ha salido}
	e: Char;
	arbolVacio, auxArbol: TArbolBin;
	operando1, operando2: TArbolBin;

BEGIN
	{Se crea la pila vacia que se va a utilizar para ir poniendo los elementos de la lista. Como no nos la dan en la cabecera del subprograma es una variable local al mismo}
	CrearPîlaVacia(pila);
	{Como no podemos tocar los punteros de las estructuras de datos, solo nos dan el TAD. La única forma de ir sacando los elementos es ir borrando los que ya sacamos, por eso necesitamos una lista auxiliar, en la que copiamos todos los elementos y no importa si los borramos o no}
	Copiar(lista, auxLista);
	{Mientras la lista que nos han pasado no sea vacia haremos algo}
	WHILE (NOT EsListaVacia(auxLista)) DO
	BEGIN
		{Se saca el primer elemento de la lista y se borra. Para ir avanzando}
		Primero(auxLista, e);
		BorrarElemento(e, auxLista);
		{Se llama al subprograma Determinar que dice si lo que se le introduce un número o un operador}
		IF (Determinar(e)) THEN
		BEGIN
			{Si se le ha introducido un número}
			{Se crea un arbol vacio. OJO. Lo normal sería simplemente poner NIL en la llamada a la función ConstruirArbol pero no podemnos hacer eso ya que solo podemos utilizar los TAD dados y no punteros}
			CrearArbolBinVacio(aVacio);
			{Se construye un arbol (hoja) con la raiz que es el número que se ha extraido de la lista, sus dos hijos son vacios}
			ConstruirArbolBin(arbolVacio, e, arbolVacio, auxArbol);
			{Se apila el arbol que se ha creado en la piloa}
			Apilar(a, pila);
		END
		ELSE 
		BEGIN
			{Si el elemento que se extrae de la lista es un operador: Se sacan los últimos dos elementos apilados y se crea un árbol con ellos}
			{Se sacan los dos últimos elementos que han sido insertados en la pila. Para ir avanzando, a la vez que se extrae la cima se desapila para poder ver el siguiente elemento}
			Cima(pila, operando2);
			Desapilar(pila);
			Cima(pila, operando1);
			Desapilar(pila);
			{Se construye un arbol con el elemento que se ha extraido de la lista como raiz y los dos elementos extraidos de la pila como hijos}
			ConstruirArbolBin(operando1, e, operando2, auxArbol);
			{El arbol que tendrá el operador y los operandos como hijos se apila en la pila}
			Apilar(a, pila)
		END;
		{Cuando todo el procedimiento se haya realizado, el árbol estará completo y la pila solo tendrá un elemento, que será el árbol. Por lo cual se saca la Cima y se le pone el valor arbol de la cabecera}
		Cima(pila, arbol);
	END;
END;

{Evalua el resultado de las operaciones que hay en el árbol}
FUNCTION Evaluar (arbol: TArbolBin): Real;
VAR
	e: Char;
	r1, r2: Real;

BEGIN
	{Si el árbol no es vacio}
	IF (NOT EsArbolVacio(arbol)) THEN 
	BEGIN
		{Se destripa}
		Raiz(arbol, e);
		HijoIzq(arbol, hi);
		HijoDer(arbol, hd);
		{Si es una hoja será un operando (número) }
		IF (EsArbolVacio(hi) AND (EsArbolVacio(hd))) THEN 
		BEGIN
			{Como es un número pero está codificado en CHAR, se llama al subprograma Valor para que devuelva su valor como un Real. El valor que devuelve es el que se le asigna al subprograma}
			Evaluar:= Valor(e);
		END
		ELSE 
		BEGIN
			{Operando 1}
			{Se van haciendo llamadas recurisvas por todos los nodos del árbol}
			r1:= Evaluar(hi);
			{Operando 2}
			r2:= Evaluar(hd);
			{Operar saca el valor del char (operador) y opera los dos operandos que se le pasan mediante la operación que hay en e}
			{En el caso que el árbol sea muy grande, se baja hasta el final y se empiezan a ir haciendo las operaciones}
			Evaluar:= Operar(e, R1, R2);
		END;
	END;
END;