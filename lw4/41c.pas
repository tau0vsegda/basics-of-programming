PROGRAM PaulRevere(INPUT, OUTPUT);
{Печать соответствующего сообщения, зависящего от велечинына входе: '...by land' для 1; '...by sea' для 2;
иначе печать сообщения об ошибке}
VAR
  Lanterns: CHAR;
BEGIN {PaulRevere}
  {Read Lanterns}
  READ(Lanterns);
  {Issue Paul Revere's message}
  IF Lanterns = 'L'
  THEN
    BEGIN {SeaOrLand}
      READ(Lanterns);
      IF Lanterns = 'L'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        WRITELN('The British are coming by land.')
    END {SeaOrLand}
  ELSE
    WRITELN('The North church shows only''', Lanterns, '''.')
END. {PaulRevere}
