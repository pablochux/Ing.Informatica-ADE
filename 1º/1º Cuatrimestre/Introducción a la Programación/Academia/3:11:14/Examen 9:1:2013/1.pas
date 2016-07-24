{IMPORTANTE, los punteros no se pueden leer un tipo puntero}

{Definir las constantes y tipos de datos apropiados para}
{a) Almacenar en memoria principal un máximo de 140 facturas. Cada factura tiene información del CIF del cliente, su domicilio y el importe de la factura en euros.}
{Como dice máximo hay que hacer un array con tope}
CONST 
	MAX = 140;
	MIN = 1;
	MAX_CIF = 9;

TYPE
	TCif = String[MAX_CIF];
	{Si pusieramos el [9] en el string del registro directamente sería un tipo anónimo y no lo pudieramos usar si queremos declarar una variable de ese tipo. Es recomendable siempre declarar los tipos para que no sean anónimos}
	TipoFactura = RECORD
		cif: TCif;
		domicilio: String;
		importe: Real;
	END;
	TipoRangoFacturas:= MIN..MAX;
	TipoArrayFacturas = ARRAY [TipoRangoFacturas] of TipoFactura;
	TipoFacturaTope = RECORD
		libroCuentas: TipoFacturas;
		tope: Integer;
	END;
{b) Almacenar en memoria secundaria la información de todos los cicilistas del Tour. De cada corredor se guarda: su nombre completo, la edad, la nacionalidad y el nombre del equipo en el que corre.}
{Pista: Al hablar de memoria secundaria se refiere a ficheros} {Como no nos da el formato del fichero, se asume que es un binario}
{En un archivo binario se pueden escribir los tipos de pascal tal cual, se puede escribir un registro, un array o lo que sea directamente.}
PROGRAM ejercicioCiclista
TYPE
	TipoCiclista = RECORD
		nombre: String;
		edad: Integer;
		nacionalidad: String;
		nombreEquipo: String;
	END;
	TipoFicheroCiclista:= FILE OF TipoCiclista;

{c) Almacenar la información de un mensaje de correo electrónico. El mensaje consta de: remitente, destinatario, hora de envio(hora , minuto y segundo, asunto y cuerpo del mensaje)}
TYPE
	TipoRegistroHora = RECORD
		hora: Integer;
		minuto: Integer;
		segundo: Integer;
	END;
	TipoRegistroEmail = RECORD
		remitente: String;
		destinatario: String;
		hora: TipoRegistroHora;
		asunto: String;
		cuerpo: String;
	END;

{d) Almacenar la información de los 100 mejores jugadores de baloncesto. Lo único que nos interesa de los jugadores es su nombre.}
CONST
	MAX = 100;
	MIN = 1;
TYPE
	TipoRangoJugadores = MIN..MAX;
	TipoArrayJugadores = ARRAY [TipoRangoJugadores] of String;



