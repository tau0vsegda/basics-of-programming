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
      {������� ����, ��������� ����� ������}
      {DP1.1}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN {����� ������}
        Looking := 'N';
      WRITELN(W1, W2, W3, W4)
      {�������� ���� ��� 'land'}
      {�������� ���� ��� 'sea'}
    END;
    {������� ��������� Sarah}
END. {SarahRevere}

