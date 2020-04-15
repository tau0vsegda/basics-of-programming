PROGRAM SummaOfDigit(INPUT, OUTPUT);
USES
  ReadD;
VAR
  Summa, Digit: INTEGER;

BEGIN
  Summa := 0;
  ReadDigit(INPUT, Digit);
  WHILE Digit <> -1
  DO
    BEGIN
      Summa := Summa + Digit;
      ReadDigit(INPUT, Digit)
    END;
  WRITELN(Summa)
END.
