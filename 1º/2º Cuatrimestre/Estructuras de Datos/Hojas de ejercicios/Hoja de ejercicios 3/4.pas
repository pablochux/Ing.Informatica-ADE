FUNCTION  IsTailEmpty(tail: TypeTail): Boolean;
BEGIN
	IsTailEmpty:= (tail = NIL);
END;
{The last element in the tails is not NIL}