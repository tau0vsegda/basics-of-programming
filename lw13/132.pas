PROGRAM LexicoL(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  C: CHAR;
PROCEDURE Copying(VAR From, Into: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copying}
  WHILE NOT EOLN(From)
  DO
    BEGIN
      READ(From, Ch);
      WRITE(Into, Ch)
    END;
  WRITELN(Into)
END; {Copying}
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
 
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END;
  IF (NOT EOLN(F1)) AND (Result = '0')
  THEN
    Result := '1';
  IF (NOT EOLN(F2)) AND (Result = '0')
  THEN
    Result := '2'
END;
BEGIN
  REWRITE(F1);
  REWRITE(F2);
  Copying(INPUT, F1);
  READLN(INPUT);
  Copying(INPUT, F2); 
  Lexico(F1, F2, C);
  WRITELN(OUTPUT, C)
END.
 
