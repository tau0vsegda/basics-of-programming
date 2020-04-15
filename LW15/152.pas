PROGRAM CountingOfReverses(INPUT, OUTPUT);
USES
  Count3;
VAR
  Ch1, Ch2, Ch3, D1, D10, D100: CHAR;
BEGIN
  WRITE('Вход:');
  IF NOT EOLN
  THEN
    READ(Ch1); 
  IF NOT EOLN
  THEN
    READ(Ch2);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch3);
      IF ((Ch1 > Ch2) AND (Ch2 < Ch3)) OR ((Ch1 < Ch2) AND (Ch2 > Ch3))
      THEN
        Bump;
      Ch1 := Ch2;
      Ch2 := Ch3
    END;  
  Value(D100, D10, D1);
  WRITELN('Колличество реверсов:', D100, D10, D1)  
END.
