PROGRAM MinSort3(INPUT, OUTPUT);
{��������� 3-������ �� INPUT � OUTPUT}
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {MinSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('������� ������ ', Ch1, Ch2, Ch3);
  WRITE('������������� ������ ');
  {�������� ������� � OUTPUT, ��������� ���������� � Ch1 and Ch2}
  IF Ch1 < Ch2
  THEN
    {�������� ������� �� Ch1, Ch3 � OUTPUT, ����������� Ch3 � Ch1, ���� ����������}
    IF Ch1 < Ch3
    THEN
      BEGIN
        WRITE(Ch1);
        Ch1 := Ch3
      END
    ELSE
      WRITE(Ch3)
  ELSE
    {�������� ������� �� Ch2, Ch3 � OUTPUT, ����������� Ch3 � Ch2, ���� ����������}
    IF Ch2 < Ch3
    THEN
      BEGIN
        WRITE(Ch2);
        Ch2 := Ch3
      END
    ELSE
      WRITE(Ch3);
  {����������� Ch1, Ch2 � OUTPUT}
  IF Ch1 < Ch2
  THEN
    WRITE(Ch1, Ch2)
  ELSE
    WRITE(Ch2, Ch1);
  WRITELN
END. {MinSort3}
