UNIT WorkWithWord;
INTERFACE
CONST
  AlphabetEN = ['A'..'Z','a'..'z'];
  AlphabetRU = ['À'..'ß','à'..'ÿ','¨','¸']; 
  
  FUNCTION DoLowerCase(Letter: CHAR): CHAR;
  PROCEDURE GetWord(VAR FileIn: TEXT; VAR TempWord: STRING; VAR WordExist: BOOLEAN);
     
IMPLEMENTATION

  FUNCTION DoLowerCase(Letter: CHAR): CHAR;
  BEGIN
    
    IF (Letter = '¨') OR (Letter = '¸')
    THEN
      Letter := 'å';
    IF (Letter IN AlphabetRU) AND (Letter <= 'ß')
    THEN  
      Letter := CHR(ORD(Letter) + ORD('a') - ORD('A'));
    IF (Letter IN AlphabetEN) AND (Letter <= 'Z')
    THEN
      Letter := CHR(ORD(Letter) + ORD('a') - ORD('A'));
    DoLowerCase := Letter;
  END;
  
  PROCEDURE GetWord(VAR FileIn: TEXT; VAR TempWord: STRING; VAR WordExist: BOOLEAN);
  VAR
    Ch: CHAR;
  BEGIN
    TempWord := '';
    WordExist := FALSE;
    WHILE (NOT WordExist) AND (NOT EOLN(FileIn))
    DO
      BEGIN
        READ(FileIn, Ch);
        IF (Ch IN AlphabetEN) OR (Ch IN AlphabetRU)
        THEN
          WordExist := TRUE
      END;
    IF WordExist
    THEN
      BEGIN
        WHILE (NOT EOLN(FileIn)) AND ((Ch IN AlphabetEN) OR (Ch IN AlphabetRU))
        DO
          BEGIN
            Ch := DoLowerCase(Ch); 
            TempWord := TempWord + Ch;
            READ(FileIn, Ch)            
          END;
        IF (Ch IN AlphabetEN) OR (Ch IN AlphabetRU)
        THEN
          BEGIN
            Ch := DoLowerCase(Ch); 
            TempWord := TempWord + Ch
          END
      END            
  END;
  
BEGIN
END.
