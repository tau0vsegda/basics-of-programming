PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  PrSet, RemSet: SET OF 2 .. Max;
  FirstElement, Element: INTEGER;

BEGIN{Prime}
  PrSet := [2 .. Max];
  RemSet := [];
  FirstElement := 2;
  WRITE('Primes ranging from 2 to 100 is ');
  FirstElement := 2;
  
  WHILE NOT (PrSet = [])
  DO
    BEGIN
      IF FirstElement IN PrSet
      THEN
        BEGIN
          Element := FirstElement;
          WHILE Element <= Max
          DO
            BEGIN
              RemSet := RemSet + [Element];
              Element := Element + FirstElement
            END;  
        PrSet := PrSet - RemSet;
        IF FirstElement <> 2
        THEN
          WRITE(', ');
        WRITE(FirstElement)
      END;
      FirstElement := FirstElement + 1
    END;
  WRITELN  
END.{Prime}
