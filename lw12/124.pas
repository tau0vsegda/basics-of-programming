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
        WRITE(W);
      IF W <> ' '
      THEN
        F := 'S'
      ELSE
        IF F <> 'N'
        THEN
          F := ' '
    END;
  WRITELN
END.
      
      
