PROGRAM PaulRevere(INPUT, OUTPUT);
{������ ���������������� ���������, ���������� �� ���������� �����: '...by land' ��� 1; '...by sea' ��� 2;
����� ������ ��������� �� ������}
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
