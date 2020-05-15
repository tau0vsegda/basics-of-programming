PROGRAM GraphicPrinting2(INPUT, OUTPUT);
PROCEDURE ReadGraphicPrinting(VAR Letter: CHAR; VAR TotalPosition; VAR n: INTEGER);
VAR
  Positions: SET OF 1..25;
  Index: INTEGER; 
  
BEGIN
  Positions := [];
  CASE Letter OF
    'A', 'a': Positions := n * [3, 7, 9, 11, 15, 16, 17, 18, 19, 20, 21, 25];
    'B', 'b': Positions := n * [1, 2, 3, 4, 6, 9, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    'C', 'c': Positions := n * [1, 2, 3, 4, 5, 6, 10, 11, 16, 20, 21, 22, 23, 24, 25];
    'D', 'd': Positions := n * [1, 2, 3, 6, 9, 11, 15, 16, 20, 21, 22, 23, 24, 25];
    'E', 'e': Positions := n * [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21, 22, 23, 24, 25];
    'F', 'f': Positions := n * [1, 2, 3, 4, 5, 6, 11, 16, 17, 18, 21];
    'G', 'g': Positions := n * [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    'H', 'h': Positions := n * [1, 5, 6, 10, 11, 15, 16, 17, 18, 19, 20, 21, 25];
    'I', 'i': Positions := n * [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J', 'j': Positions := n * [2, 3, 4, 9, 14, 16, 19, 22, 23];
    'K', 'k': Positions := n * [1, 5, 6, 9, 11, 12, 13, 16, 19, 21, 25];
    'L', 'l': Positions := n * [1, 6, 11, 16, 20, 21, 22, 23, 24, 25];
    'M', 'm': Positions := n * [1, 2, 4, 5, 6, 8, 10, 11, 15, 16, 20, 21, 25];
    'N', 'n': Positions := n * [1, 2, 5, 6, 8, 10, 11, 14, 15, 16, 22, 21, 25];
    'O', 'o': Positions := n * [2, 3, 4, 6, 9, 11, 15, 16, 20, 22, 23, 24, 25];
    'P', 'p': Positions := n * [1, 2, 3, 4, 6, 10, 11, 15, 16, 17, 18, 19, 20, 21];
    'Q', 'q': Positions := n * [2, 3, 4, 6, 10, 11, 13, 15, 16, 19, 20, 22, 23, 24, 25];
    'R', 'r': Positions := n * [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 15, 16, 19, 21, 25];
    'S', 's': Positions := n * [3, 4, 5, 7, 13, 19, 21, 22, 23];
    'T', 't': Positions := n * [1, 2, 3, 4, 5, 6, 8, 10, 13, 18, 23];
    'U', 'u': Positions := n * [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V', 'v': Positions := n * [1, 5, 6, 10, 11, 15, 17, 19, 23];
    'W', 'w': Positions := n * [1, 5, 6, 10, 11, 15, 16, 18, 20, 22, 24];
    'X', 'x': Positions := n * [2, 4, 8, 12, 14, 16, 20, 21, 25];
    'Y', 'y': Positions := n * [1, 5, 6, 10, 12, 14, 18, 23];
    'Z', 'z': Positions := n * [2, 3, 4, 5, 9, 13, 17, 22, 23, 24, 25]
  END;
  
  TotalPosition := TotalPosition + Positions;
  n := n + 1;
END;

PROCEDURE WriteGraphicPrinting(VAR TotalPosition: SET OF 1..25);
NEGIN
  IF Positions <> []
  THEN
    BEGIN
      FOR Index := 1 TO 25 * n 
      DO
        BEGIN
          IF Index IN Positions
          THEN
            WRITE('@')
          ELSE
            WRITE(' ');
          IF Index MOD 5 = 0
          THEN
            WRITE(' ')
        END        
    END
  ELSE
    WRITE(' ') 
END;

