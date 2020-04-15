PROGRAM TestRemove(INPUT,OUTPUT);
{читает строку из входа, пропускает ее через RemoveExtraBlanks}
USES
Queue;
VAR
  Ch: CHAR;

PROCEDURE RemoveExtraBlanks;
{удаляет лишние пробелы между словами на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '$';
  AddQ(LineEnd); {помечаем конец текста в очереди}
  HeadQ(Ch);
  {удаляем пробелы}
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {читаем слово}
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN
          AddQ(Ch);
          DelQ;
          HeadQ(Ch)
        END;
      {удаляем пробелы}
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END; 
      {вставляем пробел между словами}
      IF Ch <> LineEnd
      THEN
        AddQ(Blank)
    END;
  DelQ {удаляем LineEnd из очереди}
END; {RemoveExtraBlanks}
 
BEGIN {TestRemove}
  EmptyQ;
  WRITE('Вход:');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQ(Ch)
    END;
  WRITELN;
  RemoveExtraBlanks;
  WRITE('Выход:');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN
END. {TestRemove}
