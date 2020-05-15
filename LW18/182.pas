PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  
{TYPE
  Score = 0 .. 100;}
  
VAR
  WhichScore: 1 .. NumberOfScores + 1;
  Student: 1 .. ClassSize + 1;
  
  {NextScore: Score;}
  
  NextScore, Ave, TotalScore, ClassTotal: INTEGER;
  Correct, TotalCorrect: BOOLEAN;
  Ch: CHAR;
  
BEGIN {AverageScore}
  ClassTotal := 0;
  TotalCorrect := TRUE;
  
  WRITELN('Student averages:');
  
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      READ(Ch);
      WHILE Ch <> ' '
      DO
        BEGIN
          WRITE(Ch);
          READ(Ch)
        END;
      WRITE(' ');  
      
      TotalScore := 0;
      WhichScore := 1;
      
      WHILE (WhichScore <= NumberOfScores)
      DO
        BEGIN
          READ(NextScore);
          Correct := (NextScore <= 100) AND (NextScore >= 0);
          IF Correct
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
          ELSE
            BEGIN
              WhichScore := 5;
              TotalCorrect := FALSE
            END
        END;
      IF Correct
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITE(Ave DIV 10 + 1)
          ELSE
            WRITE(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore
        END
      ELSE
        WRITE('incorrect data');
      WRITELN;  
      Student := Student + 1;
      READLN  
    END;  
  WRITE('Class average: ');
  IF TotalCorrect 
  THEN
    BEGIN
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITE(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
  ELSE
    WRITE('incorrect data');
  WRITELN    
END.  {AverageScore}
