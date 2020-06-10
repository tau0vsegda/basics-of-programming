PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
 
VAR
  WhichScore: 1 .. NumberOfScores + 1;
  Student: 1 .. ClassSize + 1;
  NextScore, Ave, TotalScore, ClassTotal: INTEGER;
  Correct: BOOLEAN;
  

PROCEDURE WriteName(VAR From, Into: TEXT);
VAR
  Ch, Flag: CHAR;

BEGIN {WriteName}
  Flag := '0';
  Ch := '#';
  WHILE (Flag <> 'N') AND (NOT EOLN(From))
  DO
    BEGIN
      READ(From, Ch);
      IF (Ch <> ' ') AND (Flag = '0')
      THEN
        Flag := 'Y';
      IF (Ch = ' ') AND (Flag = 'Y')
      THEN
        Flag := 'N';
      IF Flag = 'Y'
      THEN
        WRITE(Into, Ch)
    END;
  WRITE(Into, ' ')
END; {WriteName }
  
BEGIN {AverageScore}
  ClassTotal := 0;
  
  WRITELN('Student averages:');
  Correct := TRUE;
  Student := 1;
  WHILE (Student <= ClassSize) AND (NOT EOF) AND (Correct)
  DO 
    BEGIN
      WriteName(INPUT, OUTPUT);     
      TotalScore := 0;
      WhichScore := 1;
      
      WHILE (WhichScore <= NumberOfScores) AND (NOT EOLN) AND (Correct)
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
            WRITE('incorrect data')
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
        END;

      WRITELN;  
      Student := Student + 1;
      READLN  
    END;  
  
  IF Correct 
  THEN
    BEGIN
      WRITE('Class average: ');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITE(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END;
  WRITELN    
END.  {AverageScore}
