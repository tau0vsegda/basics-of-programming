PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores + 1;
  Student: 1 .. ClassSize + 1;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;

BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE (Student <= ClassSize) AND (NOT EOF)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WHILE (WhichScore <= NumberOfScores) AND (NOT EOLN)
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1          
        END;  
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITE(Ave DIV 10 + 1)
      ELSE
        WRITE(Ave DIV 10);
      WRITELN;  
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
      READLN
    END;
  WRITELN ('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
