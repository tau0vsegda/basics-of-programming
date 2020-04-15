PROGRAM ReverseFile(INPUT, OUTPUT);
PROCEDURE Reverse(VAR From, Into: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(From)
  THEN
    BEGIN
      READ(From, Ch);
      Reverse(From, Into);
      WRITE(Into, Ch)
    END
END;{Reverse}
BEGIN{ReverseFile}
  Reverse(INPUT, OUTPUT);
  WRITELN
END. {ReverseFile}
