PROCEDURE Delete (VAR tail: TypeTail);
VAR
	auxTail: TypeTail;

BEGIN
	IF (NOT(tail = NIL)) THEN
	BEGIN
		IF (tail = tail^.next) THEN {When there is only one node}
		BEGIN
			DISPOSE(tail);
			tail:= NIL;	
		END
		ELSE 
		BEGIN
			auxTail:= tail^.next;
			tail^.next:= auxTail^.next; {Can  it be tail^.next^.next }	
			DISPOSE(auxTail);	
		END;
	END;
END;