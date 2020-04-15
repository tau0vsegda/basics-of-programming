UNIT Queue;
INTERFACE
PROCEDURE EmptyQ;
PROCEDURE AddQ(VAR Element: CHAR);
PROCEDURE DelQ;
PROCEDURE HeadQ(VAR Element: CHAR);
PROCEDURE WriteQ;
 
IMPLEMENTATION
VAR
  FileQueue: TEXT;
 
PROCEDURE CopyOpen(VAR From, Into: TEXT);
{копирует строку из From в Into без RESET или REWRITE;
таким образом From должен быть готов для чтения, а Into для записи,
но прошлые строки у этих файлов могут быть не пусты}
VAR
  Ch: CHAR;
BEGIN{CopyOpen}
  WHILE NOT EOLN(From)
  DO
    BEGIN
      READ(From, Ch);
      WRITE(Into, Ch)
    END
END;{CopyOpen}
 
PROCEDURE EmptyQ;
{FileQueue := <,/,R>}
BEGIN {EmptyQ}
  REWRITE(FileQueue);
  WRITELN(FileQueue);
  RESET(FileQueue)
END{EmptyQ};
 
PROCEDURE AddQ(VAR Element: CHAR);
{FileQueue = <,x/,R>, где x строка и Elt = a -->
FileQueue = <,xa/,R> }
VAR
  Temp: TEXT;
BEGIN {AddQ}
  REWRITE(Temp);
  CopyOpen(FileQueue, Temp);
  WRITELN(Temp, Element);
  RESET(Temp);
  REWRITE(FileQueue);
  CopyOpen(Temp, FileQueue);
  WRITELN(FileQueue);
  RESET(FileQueue)
END; {AddQ}
 
PROCEDURE DelQ;
{(FileQueue = <,/,R> -->)|
(FileQueue = <,ax/,R>, где a строка и x строка  -->
FileQueue:= <,x/,R> }
VAR
  Ch: CHAR;
  Temp: TEXT;
BEGIN {DelQ}
{удаляем первый элемент из FileQueue}; 
  READ(FileQueue, Ch);
  IF NOT EOF(FileQueue)
  THEN{не пустой}
    BEGIN
      REWRITE(Temp);
      CopyOpen(FileQueue, Temp);
      WRITELN(Temp);
      {копируем Temp в FileQueue}
      RESET(Temp);
      REWRITE(FileQueue);
      CopyOpen(Temp, FileQueue);
      WRITELN(FileQueue)
    END;
  RESET(FileQueue)
END{DelQ};
 
PROCEDURE HeadQ(VAR Element: CHAR);
{(FileQueue = <,/,R> --> Elt := '#')|
(FileQueue = <,ax/,R>, где a строка и x строка  -->
Elt:= 'a' }
BEGIN{HeadQ}
  IF NOT EOLN(FileQueue)
  THEN
    READ(FileQueue, Element)
  ELSE
    Element := '#';
  RESET(FileQueue)
END{HeadQ};
 
PROCEDURE WriteQ;
{ (FileQueue = <,x/,R> ? OUTPUT =<y,,W>, где y и x строки  -->
OUTPUT := <y&x/,,W> }
BEGIN {WriteQ}
  CopyOpen(FileQueue, OUTPUT);
  WRITELN(OUTPUT);
  RESET(FileQueue)
END{WriteQ};
 
BEGIN
END.
