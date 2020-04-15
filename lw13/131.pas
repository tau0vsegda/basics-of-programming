PROGRAM BubbleSort(INPUT, OUTPUT);
{��������� ������ ������ INPUT � OUTPUT}
VAR
  Sorted, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
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
BEGIN {BubbleSort}
  {�������� INPUT � F1}
  REWRITE(F1);
  Copying(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      {�������� F1 � F2, �������� ����������������� � ����������� ������ �������� ������� �� �������}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, Ch2);
              {������� �����������}
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END
            END;
          WRITELN(F2, Ch1)  
        END;
      {�������� F2 � F1}
      RESET(F2);
      REWRITE(F1);
      Copying(F2, F1)
    END;
  {�������� F1 � OUTPUT}
  RESET(F1);
  Copying(F1, OUTPUT)  
END.{BubbleSort}

