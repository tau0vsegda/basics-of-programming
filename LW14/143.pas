PROGRAM RecursiveSort(INPUT, OUTPUT);
VAR
  F: TEXT;
PROCEDURE Copying(VAR From, Into: TEXT);
VAR
  C: CHAR;
BEGIN {Copying}
  WHILE NOT EOLN(From)
  DO
    BEGIN
      READ(From, C);
      WRITE(Into, C)
    END;
  WRITELN(Into)
END; {Copying}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR
  F2, F3: TEXT;
  Ch: CHAR;
  
{PROCEDURE Split(VAR F1, F2, F3: TEXT) Разбивает F1 на F2 и F3}
PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2'
        END
    END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split}

{PROCEDURE Merge(VAR F1, F2, F3: TEXT) Сливает F2 и F3 в F1}
PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2, F3 в F1  в сортированном порядке}
VAR
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE NOT(EOLN(F2) OR EOLN(F3))
  DO
    BEGIN
      IF Ch2 < CH3
      THEN
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3)
        END
    END;
    {выводим последний минимальный символ}
    IF Ch2 < Ch3
    THEN
      WRITE(F1, Ch2)
    ELSE
      WRITE(F1, Ch3);  
  {Копировать остаток F2 в F1}
  IF EOLN(F3)
  THEN
    BEGIN
      IF Ch2 > Ch3
      THEN
        Ch3 := Ch2;
      WHILE NOT (EOLN(F2))
      DO
        BEGIN
          READ(F2, Ch2);
          IF Ch2 < Ch3
          THEN
            WRITE(F1, Ch2)
          ELSE
            BEGIN
              WRITE(F1, Ch3);
              Ch3 := Ch2
            END
        END;
      Ch := Ch3
    END;
  {Копировать остаток F3 в F1}
  IF EOLN(F2)
  THEN
    BEGIN
      IF Ch3 > Ch2
      THEN
        Ch2 := Ch3;
      WHILE NOT (EOLN(F3))
      DO
        BEGIN
          READ(F3, Ch3);
          IF Ch3 < Ch2
          THEN
            WRITE(F1, Ch3)
          ELSE
            BEGIN
              WRITE(F1, Ch2);
              Ch2 := Ch3
            END
        END;
      Ch := Ch2
    END
END; {Merge}

BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch);            
      IF NOT (EOLN(F1))
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END;
      WRITE(F1, Ch)  
    END
END;{RecursiveSort}
BEGIN
  REWRITE(F);
  Copying(INPUT, F);        
  RecursiveSort(F);
  RESET(F);
  Copying(F, OUTPUT);
  WRITELN(OUTPUT)
END.
