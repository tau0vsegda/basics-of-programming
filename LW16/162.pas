PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Land, Sea: BOOLEAN;
BEGIN{SarahRevere}
{�������������}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Land := FALSE;
  Sea := FALSE;
  WHILE NOT (EOLN OR Land OR Sea)
  DO
    BEGIN
      {�������� ����}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      {�������� �� land}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      {�������� �� sea}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
    END;
  {�������� ��������� Sarah}  
  IF Land
  THEN
    WRITE('The British are comming by land')
  ELSE
    IF Sea
    THEN
      WRITE('The British are comming by sea')
      ELSE
        WRITE('Sarah didn''t say');
  WRITELN 
END.{SarahRevere}
