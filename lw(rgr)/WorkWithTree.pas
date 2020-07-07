UNIT WorkWithTree;

INTERFACE
  TYPE
    Tree = ^Node;
    Node = RECORD
             TreeWord: STRING;
             WordCount: INTEGER;
             LeftBranch, RightBranch: Tree
           END;
  PROCEDURE DelTree(TreeBranch: Tree);
  PROCEDURE InsertWord(VAR TreeBranch: Tree; NewWord: STRING);
  PROCEDURE PrintTree(VAR FileOut: TEXT; VAR TreeBranch: Tree);

IMPLEMENTATION
PROCEDURE InsertWord(VAR TreeBranch: Tree; NewWord: STRING);
BEGIN{InsertWord}
  IF TreeBranch = NIL
  THEN
    BEGIN
      NEW(TreeBranch);
      TreeBranch^.TreeWord := NewWord;
      TreeBranch^.WordCount := 1;
      TreeBranch^.LeftBranch := NIL;
      TreeBranch^.RightBranch := NIL
    END
  ELSE
    IF NewWord < TreeBranch^.TreeWord
    THEN
      InsertWord(TreeBranch^.LeftBranch, NewWord)
    ELSE
      IF NewWord > TreeBranch^.TreeWord
      THEN
        InsertWord(TreeBranch^.RightBranch, NewWord)
      ELSE
        TreeBranch^.WordCount := TreeBranch^.WordCount + 1
END; {InsertWord}

PROCEDURE PrintTree(VAR FileOut: TEXT; TreeBranch: Tree);
BEGIN{PrintTree}
  IF TreeBranch <> NIL
  THEN
    BEGIN
      PrintTree(FileOut, TreeBranch^.LeftBranch);
      WRITELN(FileOut, TreeBranch^.TreeWord, ': ', TreeBranch^.WordCount);
      PrintTree(FileOut, TreeBranch^.RightBranch)
    END;
END; {PrintTree}

PROCEDURE DelTree(VAR TreeBranch: Tree);
BEGIN{DelTree}
  IF TreeBranch^.LeftBranch <> NIL
  THEN
    DelTree(TreeBranch^.LeftBranch);
  IF TreeBranch^.RightBranch <> NIL
  THEN
    DelTree(TreeBranch^.RightBranch);
  DISPOSE(TreeBranch)
END; {DelTree}

BEGIN
END.
