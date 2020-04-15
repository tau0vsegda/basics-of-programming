PROGRAM CopyFile(INPUT, OUTPUT);
PROCEDURE RCopy(VAR From, Into: TEXT);
VAR
  Ch: CHAR;
BEGIN {RCopy}
  IF NOT EOLN(From)
  THEN
    BEGIN
      READ(From, Ch);
      WRITE(Into, Ch);
      RCopy(From, Into)
    END
END;{RCopy}
BEGIN{CopyFile}
  RCopy(INPUT, OUTPUT);
  WRITELN
END. {CopyFile}
