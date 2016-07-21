{Implementación de lista estática simulando dinámica}
UNIT Lista;
INTERFACE
	USES Elemento;
	CONST 
		{El 0 se va a utilizar como si fuese NIL}
		CERO = 0;
		MIN = 1; 
		MAX = 100;

	TYPE
		TRangoLista = MIN..MAX;
		TRango = CERO..MAX;
		TRegistroLista = RECORD
			info: TipoElemento; {Acceso -> l.accesoLista[].info}
			sig: TRango; {Acceso -> l.accesoLista[].sig}  
			{Indica el campo siguiente, es cómo la flecha que apunta al siguiente nodo. Para simular que la lista es = NIL el campo sig debe ser igual a 0. En otros casos, al acceder al campo siguiente de un nodo, te devuelve la posición en el array en la que se encuentra el proximo nodo}
		END;
		TArrayLista = ARRAY [TRangoLista] OF TRegistroLista;
		TLista = RECORD
			libres: TRango; {Acceso -> l.libres}
			{Indica la posición en la que se tiene que insertar el nuevo elemento}
			{Si l.libres = 0 -> No hay posiciones libres para insertar, es decir, la lista está llena (como estamos en memoria estática)}

			cabecera: TRango; {Acceso -> l.cabecera}
			{Indice la posición de inicio de la Lista. Si l.cabecera = 0 -> la lista está apuntando a NIL (listaVacia)}
			{l.cabecera es la lista, como si fuese el puntero}

			accesoLista: TArrayLista; {Acceso -> l.accesoLista}
			{accesoLista es el acceso a los nodos de la lista}
		END;

	{Cabeceras Subprogramas}

	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearListaVacia(VAR l: TLista);{O(?)}
	{Pre = TRUE}
	{Post = devuelve la lista vacía}
	PROCEDURE Construir(VAR l: TLista; e: TipoElemento);{O(?)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve la lista con el elemento e en la primera posición}

	{ OBSERVADORAS SELECTORAS }
	PROCEDURE Primero(l: TLista; VAR e: TipoElemento);{O(?)}
	{Pre = Recibe la lista no vacía}
	{Post = devuelve el primer elemento de la lista}
	PROCEDURE Resto(l: TLista; VAR l2: TLista);{O(?)}
	{Pre = recibe una lista no vacía}
	{Post = devuelve una lista sin el primer elemento de la original}

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsListaVacia(l: TLista): BOOLEAN;{O(?)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve TRUE si la lista es vacía, FALSE en caso contrario}
	FUNCTION Longitud(l: TLista): integer;{O(?)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve el número de elementos de la lista}
	PROCEDURE Ultimo(l: TLista; VAR e: TipoElemento);{O(?)}
	{Pre = recibe una lista no vacía}
	{Post = en e devuelve la información del último elemento de la lista}
	FUNCTION Pertenece(l: TLista; e: TipoElemento): BOOLEAN;{O(?)}
	{Pre = recibe una lista que puede ser vacía o no, y un elemento}
	{Post = si el elemento está en la lista devuelve TRUE, en caso contrario FALSE}

	{ CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE Concatenar(l1,l2: TLista; VAR l3: TLista);{O(?)}
	{Pre = recibimos dos listas, l1 y l2, que pueden ser vacías o no}
	{Post = devolvemos una nueva lista que primero tiene los elementos de l1 y luego los de l2}
	PROCEDURE BorrarElemento(VAR l: TLista; e: TipoElemento);{O(?)}
	{Pre = recibe una lista que puede ser o no vacía, y un elemento}
	{Post = si el elemento pertenece a la lista, devolvemos la lista sin la primera aparición del elemento. En caso contrario, devolvemos la lista original}
	PROCEDURE InsertarFinal(VAR l: TLista; e: TipoElemento);{O(?)}
	{Pre = recibe una lista que puede ser vacía o no}
	{Post = devuelve la lista con el elemento en la última posición}

	{ OPERACIONES AUXILIARES }
	PROCEDURE Copiar (VAR l1: TLista; l2: TLista);
	{Pre = recibe una lista que puede ser o no vacía}
	{Post = en l1 devolvemos una copia de l2}
	FUNCTION Iguales(l1, l2: TLista): Boolean;
	{Pre = recibe dos listas que pueden ser o no vacías}
	{Post = si son iguales, es decir, contienen los mismos elementos en el mismo orden, devuelve cierto}
	FUNCTION EsListaLlena(l: TLista): BOOLEAN;{O(?)}
	{Pre = TRUE}
	{Post = devuelve TRUE si no queda memoria disponible}


IMPLEMENTATION
	{ CONSTRUCTORAS GENERADORAS }

	{Se inicializa la lista a NIL (l.cabecera = 0) y además se colocan las posiciones siguiente del array}
	PROCEDURE CrearListaVacia(VAR l: TLista); {O(n)} 
	VAR
		i: TRangoLista;

	BEGIN
		l.cabecera:= CERO; {Se pone la lista a NIL. Simulando que la lista es vacia}
		l.libres:= MIN; {La posición en la que se tiene que insertar el siguiente elemento es la 1}

		{Ahora se inicializan los siguientes de todos los elementos de la lista}
		{Inicializa los elementos menos el último, que no tendrá que ir al siguiente de su posición, sino a 0}
		FOR i:=MIN TO (MAX - 1) DO 
		BEGIN
			l.accesoLista[i].sig:= i + 1;
		END;
		{El último elemento se inicializa a NIL (0), para que una vez se ocupe esa posición, la lista se declare como llena}
		l.accesoLista[MAX].sig:= CERO;
	END;

	PROCEDURE Construir(VAR l: TLista; e: TipoElemento); {O(1)}
	VAR
		auxLista: TRangoLista;

	BEGIN
		IF (NOT EsListaLlena(l)) THEN 
		BEGIN
			{NEW(auxLista);}
			auxLista:= l.libres;
			l.libres:= l.accesoLista[l.libres].sig;
			{Elem.Asignar(e, auxLista^.info);} 
			Elem.Asignar(e, l.accesoLista[auxLista].info);
			{auxLista^.sig:= l;} 
			l.accesoLista[auxLista].sig:= l.cabecera;
			{l:= auxLista;} 
			l.cabecera:= auxLista;
		END;
	END;

	{OBSERVADORAS SELECTORAS}
	PROCEDURE Primero(l: TLista; VAR e: TipoElemento);{O(?)}
	BEGIN
		IF (NOT EsListaVacia(l)) THEN {No confundir con NOT EsListaLlena, si la lista está llena se puede sacar el primero, pero si es vacía no}
		BEGIN
			Elem.Asignar(l.accesoLista[l.cabecera].info , e)
		END;
	END;

	PROCEDURE Resto(l: TLista; VAR l2: TLista); {O(?)}
	BEGIN
		Copiar(l2, l);
		BorrarElemento(l2, l.accesoLista[l.cabecera].info);
	END;

	{ OBSERVDORAS NO SELECTORAS }
	FUNCTION EsListaVacia(l: TLista): BOOLEAN; {O(?)}
	BEGIN
		EsListaVacia:= (l.cabecera = CERO);
	END;

	FUNCTION Longitud(l: TLista): integer; {O(?)}
	VAR
		{Como el array tiene unas posiciones limitadas, la longitud tendrá una longitud máxima, que estará determinada por TRango}
		contador: TRango; 
		auxLista: TRango; 

	BEGIN
		contador:= 0;
		auxLista:= l.cabecera;
		{Mientras el puntero no apunte a NIL}
		WHILE (auxLista <> CERO) DO
		BEGIN
			contador:= contador + 1;
			auxLista:= l.accesoLista[auxLista].sig;
		END;
		Longitud:= contador;
	END;

	PROCEDURE Ultimo (l: TLista; VAR e: TipoElemento); {O(n)}
	{Forma de hacerlo: llevar un puntero hasta que l.sig sea = 0, que significará que es el último}
	VAR
		contador: Integer;

	BEGIN
		contador:= l.cabecera;
		WHILE (l.accesoLista[contador].sig <> 0) DO
		BEGIN
			contador:= l.accesoLista[contador].sig;
		END;
		Elem.Asignar(l.accesoLista[contador].info, e)
	END;

	FUNCTION Pertenece(l: TLista; e: TipoElemento): BOOLEAN; {O(?)} 
	VAR 
		encontrado: Boolean;
		contador: Integer;

	BEGIN
		encontrado:= FALSE;
		contador:= l.cabecera;
		WHILE (NOT encontrado) AND (contador <> CERO) DO
		BEGIN
			encontrado:= Elem.Iguales(l.accesoLista[contador].info, e);
			IF (NOT encontrado) THEN 
			BEGIN
				contador:= l.accesoLista[contador].sig;
			END;
		END;
		Pertenece:= encontrado;
	END;

	{ CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE Concatenar(l1, l2: TLista; VAR l3: TLista);{O(?)}
	VAR
		contador: Integer;

	BEGIN	
		CrearListaVacia(l3);
		contador:= l1.cabecera;
		WHILE (contador <> CERO) DO
		BEGIN
			InsertarFinal(l3, l1.accesoLista[contador].info);
			contador:= l1.accesoLista[contador].sig;
		END;
		contador:= l2.cabecera;
		WHILE (contador <> CERO) DO
		BEGIN
			InsertarFinal(l3, l2.accesoLista[contador].info);
			contador:= l2.accesoLista[contador].sig;
		END;
	END;

	PROCEDURE BorrarElemento(VAR l: TLista; e: TipoElemento);{O(?)}
	VAR 
		encontrado: Boolean;
		contador, contadorAnt: Integer;

	BEGIN
		encontrado:= FALSE;
		contador:= l.cabecera;
		contadorAnt:= CERO;
		{Búsqueda del nodo}
		WHILE (NOT encontrado) AND (contador <> 0) DO
		BEGIN
			encontrado:= Elem.Iguales(l.accesoLista[contador].info, e);
			IF (NOT encontrado) THEN 
			BEGIN
				contadorAnt:= contador;
				contador:= l.accesoLista[contador].sig;
			END;
		END;
		{Eliminación del nodo}
		IF (encontrado) THEN 
		BEGIN
			{Es el primer elemento}
			IF (contadorAnt = 0) THEN 
			BEGIN
				l.cabecera:= l.accesoLista[contador].sig;
			END
			ELSE 
			BEGIN
				l.accesoLista[contadorAnt].sig:= l.accesoLista[contador].sig;
			END;
		END;
		l.accesoLista[contador].sig:= l.libres;
		l.libres:= contador;
		{Falta Eliminar el nodo}
	END;

	PROCEDURE InsertarFinal(VAR l: TLista; e: TipoElemento);{O(?)}
	VAR
		auxLista, auxPuntero: TRangoLista;

	BEGIN
		IF (EsListaVacia(l)) THEN 
		BEGIN
			Construir(l, e);
		END
		ELSE 
		BEGIN
			{NEW(auxLista)}
			auxLista:= l.libres;
			l.libres:= l.accesoLista[l.libres].sig;
			{Asignar}
			Elem.Asignar(e, l.accesoLista[auxLista].info);		
			{Como se inserta el último, su siguiente es NIL}
			l.accesoLista[auxLista].sig:= 0;
			{Se recorre la lista hasta que se encuentre el elemento que es el último}
			auxPuntero:= l.cabecera;
			WHILE (l.accesoLista[auxPuntero].sig <> 0) DO
			BEGIN
				auxPuntero:= l.accesoLista[auxPuntero].sig;
			END;
			{Se apunta el siguiente del último puntero (auxPuntero), al nuevo nodo que antes se ha "creado"}
			l.accesoLista[auxPuntero].sig:= auxLista;
		END;
	END;

	{ OPERACIONES AUXILIARES }
	PROCEDURE Copiar (VAR l1: TLista; l2: TLista);
	VAR
		contador: Integer;

	BEGIN
		CrearListaVacia(l1);
		contador:= l2.cabecera;
		WHILE (contador <> 0) DO
		BEGIN
			InsertarFinal(l1, l2.accesoLista[contador].info);
			contador:= l2.accesoLista[contador].sig;
		END;
	END;

	FUNCTION Iguales(l1, l2: TLista): Boolean;
	VAR
		contadorL1, contadorL2: Integer;
		igual: Boolean;

	BEGIN
		contadorL1:= l1.cabecera;
		contadorL2:= l2.cabecera;
		igual:= TRUE;
		WHILE (igual) AND (contadorL1 <> 0) AND (contadorL2 <> 0) DO
		BEGIN
			igual:= Elem.Iguales(l1.accesoLista[contadorL1].info, l2.accesoLista[contadorL2].info);
			IF (igual) THEN 
			BEGIN
				contadorL1:= l1.accesoLista[contadorL1].sig;
				contadorL2:= l2.accesoLista[contadorL2].sig;
			END;
		END;
		IF ((contadorL1 <> 0) OR (contadorL2 <> 0)) THEN
		BEGIN
			igual:= FALSE;
		END;
		Iguales:= igual;
	END;

	FUNCTION EsListaLlena(l: TLista): BOOLEAN;{O(1)}
	BEGIN
		EsListaLlena:= (l.libres = CERO);	
	END;
END.