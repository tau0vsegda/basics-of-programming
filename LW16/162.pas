PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Land, Sea: BOOLEAN;
BEGIN{SarahRevere}
{инициализация}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Land := FALSE;
  Sea := FALSE;
  WHILE NOT (EOLN OR Land OR Sea)
  DO
    BEGIN
      {движение окна}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      {проверка на land}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      {проверка на sea}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
    END;
  {создание сообщения Sarah}  
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
