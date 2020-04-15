UNIT ReadN;
INTERFACE
USES
  ReadD;
PROCEDURE ReadNumber(VAR Temp: TEXT; VAR N: INTEGER);

IMPLEMENTATION
PROCEDURE ReadNumber(VAR Temp: TEXT; VAR N: INTEGER);
VAR
  D: INTEGER;

BEGIN {ReadNumber}
  N := 0;
  ReadDigit(Temp, D);
  WHILE (D <> -1) AND (N <> -1)
  DO
    IF ((MAXINT DIV 10) > N) OR (((MAXINT DIV 10) = N ) AND ((MAXINT MOD 10) >= D))
    THEN
      BEGIN
        N := N * 10 + D;
        ReadDigit(Temp, D)
      END
    ELSE
       N := -1
END; {ReadNumber}

BEGIN
END.
