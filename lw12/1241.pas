PROGRAM Deleted(INPUT, OUTPUT);
VAR
  W, F: CHAR;
BEGIN
  F := 'N';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(W);
      IF (W <> ' ') AND (F = ' ')
      THEN
        WRITE(' ');  
      IF W <> ' '
      THEN
        BEGIN
          F := 'S';
          WRITE(W)
        END;
      IF (W = ' ') AND (F <> 'N')
      THEN
        F := ' '
    END;
  WRITELN
END.
