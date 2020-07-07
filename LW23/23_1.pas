PROGRAM InsertSort2(INPUT, OUTPUT);
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Next: NodePtr;
           Key: CHAR
         END;
VAR
  FirstPtr, NewPtr, Currently, Previous: NodePtr;
  Found: BOOLEAN;
BEGIN {InsertSort2}
  FirstPtr := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      NEW(NewPtr);
      READ(NewPtr^.Key);
      Previous := NIL;
      Currently := FirstPtr;
      Found := FALSE;
      WHILE (Currently <> NIL) AND NOT Found
      DO
        IF NewPtr^.Key > Currently^.Key
        THEN
          BEGIN
            Previous := Currently;
            Currently := Currently^.Next
          END
        ELSE
          Found := TRUE;
      NewPtr^.Next := Currently;
      IF Previous = NIL 
      THEN
        FirstPtr := NewPtr
      ELSE
        Previous^.Next := NewPtr;
    END;
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITE(NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END;
  WRITELN
END.  {InsertSort2}
