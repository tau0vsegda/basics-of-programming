PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN
  ReadMonth(INPUT, Mo1);
  ReadMonth(INPUT, Mo2);
  IF (Mo1 = NoMonth) AND (Mo1 = NoMonth)
  THEN
    WRITE('������� ������ �������� �������')
  ELSE
    IF Mo1 = Mo2
    THEN
      BEGIN
        WRITE('��� ������ ');
        WriteMonth(OUTPUT, Mo1)
      END
    ELSE   
      BEGIN
        WriteMonth(OUTPUT, Mo1);
        IF Mo1 < Mo2
        THEN
          WRITE(' ������������ ')
        ELSE
          WRITE(' ������� �� ');
        WriteMonth(OUTPUT, Mo2)  
      END;
  WRITELN
END.      

