PROGRAM Stat(INPUT, OUTPUT);
USES
  ReadN;
VAR
  Number, Min, Max, Average, Numerator, Denominator, RemainderN, Degree: INTEGER;
  
  BEGIN {Stat}
  ReadNumber(INPUT, Number);
  WHILE (Number = -1) AND (NOT EOF(INPUT))
  DO
    BEGIN
      READLN(INPUT);
      ReadNumber(INPUT, Number)
    END;
    
  IF Number <> -1
  THEN
    BEGIN
      Min := Number;
      Max := Number;
      Average := Number;
      Numerator := 0;
      Denominator := 2;      
    END
  ELSE
    BEGIN
      Min := -1;
      Max := -1;
      Average := -1
    END; 
  READLN(INPUT);
  
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF Number <> -1 
      THEN
        BEGIN
          
          IF Number < Min
          THEN
            Min := Number;  
          
          IF Number > Max
          THEN
            Max := Number;
            
          {среднее арефметическое}  
          RemainderN := Average MOD 2 + Number MOD 2;
          Average := Average DIV 2 + Number DIV 2;
          
          {ср. арефм.: дробная часть}
          IF Numerator <> 0
          THEN
            Denominator := Denominator * 2;
          IF RemainderN = 2
          THEN
            Average := Average + 1
          ELSE
            IF RemainderN = 1
            THEN
              Numerator := Numerator + Denominator DIV 2 ;   
        END;
      READLN(INPUT)  
    END;
  
  IF (Min <> -1) AND (Max <> -1) AND (Average <> -1)
  THEN
    BEGIN
      WRITELN(OUTPUT, ' Минимальное число: ', Min);
      WRITELN(OUTPUT, ' Максимальное число: ', Max);
      WRITE(OUTPUT, ' Среднее арефметическое: ', Average);
      IF Numerator <> 0
      THEN
        BEGIN
          WRITE(OUTPUT, '.');
          WHILE Denominator <> 1
          DO
            BEGIN
              Denominator := Denominator DIV 2;
              Numerator := Numerator *10 DIV 2
            END;
          WHILE Numerator >= 100
          DO
            Numerator := Numerator DIV 10;
          WRITELN(OUTPUT, Numerator)    
        END
    END
  ELSE
    WRITELN(OUTPUT, ' Не найдено ни одного числа')        
END.{Stat}
