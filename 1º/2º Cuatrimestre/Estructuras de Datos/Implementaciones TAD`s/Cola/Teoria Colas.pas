TEORIA COLAS

	La cola es una estructura de datos lineal. Es una estructura de tipo FIFO (First-In First-Out), el primero que entra es el primero en salir
	Su característica es que los elementos se insertan por el final mientras que la seleccion de elementos se hace por el principio.

	Operaciones características:
	Insertar -> Inserta por el final de la cola.
	Eliminar -> Elimina el primer elemento de la cola.
	Primero -> Devuelve el primer elemento
	Copiar -> No necesita insertar final ya que el insertar inserta por el final.

	Hay tres implementaciones básicas del TAD Cola:
	- Cola circular: el último elemento está conectado al primero.
		Esto hace que tanto la eliminación de datos (Eliminar) como la selección (Primero), tengan complejidad O(1). El problema que tiene es que al recorrer la lista para operaciones como iguales o copiar no tiene un fin claro (NIL).

	- Cola con puntero al principio y al final: existe un registro con un puntero al primer elemento y otro al último. Esta implementación tiene una parte estática y una parte dinámica, ya que el registro con los dos punteros es totalmente estático.
		Está implementación hace que la complejidad de las operaciones Eliminar y Primero sea O(1). Además, no tiene el problema de la cola circular con NIL.

	- Cola estática: implementación mediante un Array.
		La cola se implementa mediante registro que incluye, un marcador que indica la posición del inicio, la del final, la longitud y el acceso al array que contiene los elementos.