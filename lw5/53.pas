PROGRAM IFSort3(INPUT, OUTPUT);
{��������� 3-������ �� INPUT � OUTPUT}
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITE('������� ������ (', Ch1, ',', Ch2, ',', Ch3, ')');
  WRITE(' ����������� � (');
  {��������� Ch1, Ch2, Ch3 � OUTPUT}
  IF Ch1 < Ch2
  THEN
    {Ch1 < Ch2:��������� Ch1, Ch2, Ch3 � OUTPUT} 
    IF Ch2 < Ch3
    THEN {Ch1 < Ch2 < Ch3:��������� Ch1, Ch2, Ch3 � OUTPUT}
      WRITE(Ch1, ',', Ch2, ',', Ch3)
    ELSE
      {Ch1 < Ch2, Ch3 <= Ch2:��������� Ch1, Ch2, Ch3 � OUTPUT}
      IF Ch1 < Ch3
      THEN {Ch1 < Ch3 <= Ch2:��������� Ch1, Ch2, Ch3 � OUTPUT}
        WRITE(Ch1, ',', Ch3, ',', Ch2)
      ELSE {Ch3 <= Ch1 < Ch2:��������� Ch1, Ch2, Ch3 � OUTPUT}
        WRITE(Ch3, ',', Ch1, ',', Ch2)
  ELSE
    {Ch2 <= Ch1:��������� Ch1, Ch2, Ch3 � OUTPUT}
    IF Ch1 < Ch3
    THEN {Ch2 <= Ch1 < Ch3:��������� Ch1, Ch2, Ch3 � OUTPUT}
      WRITE(Ch2, ',', Ch1, ',', Ch3)
    ELSE
      {Ch2 <= Ch1, Ch3 <= Ch1:��������� Ch1, Ch2, Ch3 � OUTPUT}
      IF Ch2 < Ch3
      THEN {Ch2 < Ch3 <= Ch1:��������� Ch1, Ch2, Ch3 � OUTPUT}
        WRITE(Ch2, ',', Ch3, ',', Ch1)
      ELSE {Ch3 <= Ch2 <= Ch1:��������� Ch1, Ch2, Ch3 � OUTPUT}
        WRITE(Ch3, ',', Ch2, ',', Ch1);
  WRITELN(')')                              
END. {IFsort3}
