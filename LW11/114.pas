PROGRAM Reverse(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Ch: CHAR;
BEGIN
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch)
    END;
  WRITELN;
  RESET(F1);  
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      REWRITE(F2);
      READ(F1, Ch);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          WRITE(F2, Ch);
          READ(F1, Ch)
        END;
      WRITELN(F2);  
      WRITE(OUTPUT, Ch);
      RESET(F2);
      REWRITE(F1);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1);
      RESET(F1)         
    END;
  WRITELN
END.
