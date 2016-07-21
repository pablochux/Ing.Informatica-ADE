UNIT TADArbolBinario;
INTERFACE
	USES TADElemento;
	TYPE
		TipoArbolBinario = ^TipoNodo;
		TipoNodo = RECORD
			raiz: TipoElemento;
			hijoIzq: TipoArbolBinario;
			hijoDer: TipoArbolBinario;
		END;
	{Cabeceras Subprogramas}

	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearArbolBinarioVacio (VAR arbolBinario: TipoArbolBinario);
	{Crea un árbol binario vacio}
	PROCEDURE ConstruirArbolBinario (hijoIzq, hijoDer: TipoArbolBinario; raiz: TipoElemento; VAR arbolBinario: TipoArbolBinario);
	{Crea una raiz de un arbol vacio con la información y los hijosIzquierdo, y derecho que recibe}

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsArbolBinarioVacio (arbolBinario: TipoArbolBinario): Boolean;

	{ OBSERVADORAS SELECTORAS }
	PROCEDURE Raiz (arbolBinario: TipoArbolBinario; VAR elemento: TipoElemento);
	{Devuelve la raiz del arbol que recibe}
	PROCEDURE HijoIzquierdo (arbolBinario: TipoArbolBinario; VAR hijoIzq: TipoArbolBinario);
	{Devuelve el hijoIzquierdo del arbol que recibe}
	PROCEDURE HijoDerecho (arbolBinario: TipoArbolBinario; VAR hijoDer: TipoArbolBinario);
	{Devuelve el hijoDerecho del arbol que recibe}


IMPLEMENTATION
	{Subprogramas}
	
	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearArbolBinarioVacio (VAR arbolBinario: TipoArbolBinario);
	BEGIN
		arbolBinario:= NIL;
	END;
	
	PROCEDURE ConstruirArbolBinario (hijoIzq, hijoDer: TipoArbolBinario; raiz: TipoElemento; VAR arbolBinario: TipoArbolBinario);
	BEGIN
		NEW(arbolBinario);
		TADElemento.Asignar(raiz, arbolBinario^.raiz);
		arbolBinario^.hijoIzq:= hijoIzq;
		arbolBinario^.hijoDer:= hijoDer;
	END;

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsArbolBinarioVacio (arbolBinario: TipoArbolBinario): Boolean;
	BEGIN
		EsArbolBinarioVacio:= (arbolBinario = NIL);
	END;

	{ OBSERVADORAS SELECTORAS }
	PROCEDURE Raiz (arbolBinario: TipoArbolBinario; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsArbolBinarioVacio(arbolBinario)) THEN 
		BEGIN
			TADElemento.Asignar(elemento, arbolBinario^.raiz);
		END;
	END;

	PROCEDURE HijoIzquierdo (arbolBinario: TipoArbolBinario; VAR hijoIzq: TipoArbolBinario);
	BEGIN
		IF (NOT EsArbolBinarioVacio(arbolBinario)) THEN 
		BEGIN
			hijoIzq:= arbolBinario^.hijoIzq;
		END;
	END;

	PROCEDURE HijoDerecho (arbolBinario: TipoArbolBinario; VAR hijoDer: TipoArbolBinario);
	BEGIN
		IF (NOT EsArbolBinarioVacio(arbolBinario)) THEN 
		BEGIN
			hijoDer:= arbolBinario^.hijoDer;
		END;
	END;
END.