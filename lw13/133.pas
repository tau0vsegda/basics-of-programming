PROGRAM Split(INPUT, OUTPUT);
{�������� INPUT � OUTPUT,������� ��������,� ����� ������
��������}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
{PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);}
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  {�������� F1 � OUTPUT}
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1);
      WRITELN(OUTPUT)
    END
END;
 
BEGIN
  {��������� INPUT � Odds � Evens}
  ASSIGN(Odds, 'Odds.dat');
  ASSIGN(Evens, 'Evens.dat');
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          {��������� Ch, �������� � ����, ��������� �����
          Next,����������� Next}
          READ(INPUT, Ch);
          IF Next = 'O'
          THEN
            BEGIN
              WRITE(Odds, Ch);
              Next := 'E'
            END
          ELSE
            BEGIN
              WRITE(Evens, Ch);
              Next := 'O'
            END
        END;
      READLN(INPUT);
      WRITELN(Odds);
      WRITELN(Evens)
    END;
{  WRITELN(Odds);
  WRITELN(Evens)}
  
  RESET(Odds);
  RESET(Evens);
  CopyOut(Odds, Ch);
  CopyOut(Evens, Ch);
  WRITELN(OUTPUT)
END.
