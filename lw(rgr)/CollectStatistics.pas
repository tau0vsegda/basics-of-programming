UNIT CollectStatistics;
INTERFACE 
USES
  WorkWithWord, WorkWithTree;
  PROCEDURE GetSratistic(VAR FileIn: TEXT; VAR FileOut: TEXT);
IMPLEMENTATION

  PROCEDURE GetSratistic(VAR FileIn: TEXT; VAR FileOut: TEXT);
  VAR
    Root: Tree;
    NewWord: STRING;
    WordFound: BOOLEAN;  
  
  BEGIN{GetSratistic}
    Root := NIL;
    WHILE NOT EOF(FileIn)
    DO
      BEGIN
        WHILE NOT EOLN(FileIn)
        DO
          BEGIN
            GetWord(FileIn, NewWord, WordFound);
            IF WordFound
            THEN
              InsertWord(Root, NewWord)
          END;
        READLN(FileIn)
      END;
    PrintTree(FileOut, Root);
    DelTree(Root)
  END;{GetSratistic}
  
BEGIN
END.
