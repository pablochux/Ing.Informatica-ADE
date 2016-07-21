{Ejercicio de lista con enlace a siguiente y puntero a post_siguiente, se pide implementar la operación Copiar}
{Se proporciona el subprograma Construir
FUNCTION CrearNodo (elem: TipoElemento; post_sig:^TipoNodo; sig: ^TipoNodo): ^TipoNodo;}

{Algoritmo:
	1. Se copia toda la lista sin el enlace a post_siguiente
	2. Se van enlazando los post_siguiente}

{Para la operación Construir, se le pasa la información que contendra, a donde apuntará siguiente y a donde apuntará post_siguiente}
PROCEDURE Copy (VAR destiny: TypeSpecialList: origin: TypeSpecialList);
VAR
	auxPointer, auxList, auxListPointer: TypeList;
	counter: Integer;

BEGIN
	{Si la lista es vacia, se devuelve la lista destino vacia}
	IF (origin = NIL) THEN
	BEGIN
		destiny:= NIL;
	END
	ELSE 
	BEGIN	
		{PRIMERA PARTE - COPIAR TODOS LOS ELEMENTOS SIN post_next}
		{Algoritmo:
				1. Se van insertando los elementos por el final
				2. Para ello, se pone un puntero que siempre apunte al último elemento
				3. Los elementos se insertan como el siguiente del puntero al último elemento
				4. Una vez insertado se mueve el puntero que apunta al siguiente para que siga apuntando al siguiente y se pasa el puntero de la lista origen para ir copiando todos los elementos
		}
		auxOrigin:= origin; {auxOrigin será el puntero con el que se irá recorriendo la lista origin para ir cogiendo sus elementos}
		auxList:= CreateNode(auxOrigin^.info, NIL, NIL); {Se crea el primer nodo, al que apunta auxList. Este será el puntero cabecera, y no se mueve, se deja apuntando al primer elemento.}
		auxListPointer:= auxList; {auxListPointer será el puntero con el que vayamos rellenando la lista auxiliar. Apuntará al último elemento para que la insercción sea más fácil}
		auxOrigin:= auxOrigin^next; {Como el primer elemento ya ha sido agregado, se avanza una posición}
		WHILE (auxOrigin <> NIL) DO  {Cuando auxOrigin = NIL es que la lista se ha acabado}
		BEGIN
			{Se crea un nuevo nodo con la información a la que este apuntando auxOrigin y se conecta con la lista}
			auxListPointer^next:= CreateNode(auxOrigin^.info, NIL, NIL);
			{Se pasa el puntero que apunta al último elemento}
			auxListPointer:= auxListPointer^next; 
			{Se avanza el puntero a Origin para que vaya recorriendo la lista}
			auxOrigin:= auxOrigin^next;
		END;
		{Ya se ha copiado toda la lista, con todos los punteros post_siguiente a NIL}

		{SEGUNDA PARTE - Colocar los punteros post_sig}
		{Algoritmo:
			1. Se tienen dos punteros auxiliares
				- auxPointer: será el puntero explorador, será la referencia a la que hay que apuntar
				- auxPrevPointer: será el puntero cuyo post_siguiente haya que apuntar a auxPointer (por lo que irá dos posiciones por detrás de auxPointer)
			2. En las primeras dos iteraciones

				auxpointer empezará = auxList
				auxPrevPointer empezará siendo NIL por dos iteraciones, pero a la tercera será el primer elemento y tendrá que conectar el primero con auxPointer.
				De ahí en adelante cada vez que avance auxPointer y auxPrevPointer, se irán asignando}

		auxPointer:= auxList;
		auxPrevPointer:= auxList;
		counter:= 0;
		WHILE (auxPointer <> NIL) DO
		BEGIN
			counter:= counter + 1;
			{Cuando el puntero sea mayor que dos, se empieza a conectar}
			IF (counter <= 2) THEN 
			BEGIN
				{Se conecta post_siguiente con su respectivo}
				auxPrevPointer^.post_next:= auxPointer;
				{Se pasa el puntero}
				auxPrevPointer:= auxPrevPointer^.next;
			END;
			{Se va avanzando el puntero explorador}
			auxPointer:= auxPointer^.next;
		END;
		{FIN COLOCACION}
		destiny:= auxList;
	END;
END;