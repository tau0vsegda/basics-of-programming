PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  SetOfDigit: SET OF 2 .. Max;
  FirstElement, Element: INTEGER;

BEGIN{Prime}
  SetOfDigit := [2 .. Max];
  FirstElement := 2;
  WRITE('Primes ranging from 2 to 100 is ');
  WHILE NOT (SetOfDigit = [])
  DO
    BEGIN
      IF (FirstElement IN SetOfDigit)
      THEN
        BEGIN
          IF FirstElement <> 2
          THEN
            WRITE(', ');
          WRITE(FirstElement);
          Element := FirstElement;
          WHILE Element <= Max
          DO
            BEGIN
              IF (Element IN SetOfDigit) AND (Element MOD FirstElement = 0)
              THEN
                SetOfDigit := SetOfDigit - [Element];
              Element := Element + 1
            END
        END;
      FirstElement := FirstElement + 1
    END;
  WRITELN
END.{Prime}