{DP1}
PROGRAM SarahRevere(INPUT, OUTPUT);
{������ ��������� � ��� ��� ���� ��������, � ����������� �� ����, ������ �� ����� ����������� 'land' ��� 'sea'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN
  {������������� W1, W2, W3, W4, Looking}{DP1.1}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y'; {DP1.1}
  WHILE Looking = 'Y'
  DO
    BEGIN
      {�������� ���� ��� 'land'}
      IF W1 = 'l'
      THEN
        IF W2 = 'a'
        THEN
          IF W3 = 'n'
          THEN
            IF W4 = 'd'
            THEN {'land' �������}
              Looking := 'L';
      {�������� ���� ��� 'sea'}
      IF W1 = 's'
      THEN
        IF W2 = 'e'
        THEN
          IF W3 = 'a'
          THEN {'sea' �������}
            Looking := 'S';
{������� ����, ��������� ����� ������}
      {DP1.1}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN {����� ������}
        Looking := 'N'
    END;
    {������� ��������� Sarah}
    IF Looking = 'L'
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF Looking = 'S'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        WRITELN('Sarah didn''t say')
END. {SarahRevere}

