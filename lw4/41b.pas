PROGRAM PaulRevere(INPUT, OUTPUT);
{Печать соответствующего сообщения, зависящего от велечинына входе: '...by land' для 1; '...by sea' для 2;
иначе печать сообщения об ошибке}
VAR
  Lanterns: CHAR;
BEGIN {PaulRevere}
  {Read Lanterns}
  READ(Lanterns);
  {Issue Paul Revere's message}
  IF Lanterns > '0'
  THEN
    IF Lanterns < '3'
    THEN
      WRITE('The British are coming');
  IF Lanterns = '1'
  THEN
    WRITELN(' by land.')
  ELSE
    IF Lanterns = '2'
    THEN
      WRITELN(' by sea.')
    ELSE
      WRITELN('The North church shows only ''', Lanterns, '''.')
END. {PaulRevere}
