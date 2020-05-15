PROGRAM SortDate(INPUT, OUTPUT);
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date = RECORD
           Mo: Month;
           Day: DayNum
         END;
  FileOfDate = FILE OF Date;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
  
PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN{ReadMonth}
  Mo := NoMonth;
  IF NOT EOLN(FIn)
  THEN
    BEGIN 
      READ(FIn, Ch1);
      IF NOT EOLN(FIn)
      THEN
        BEGIN
          READ(FIn, Ch2);
          IF NOT EOLN(FIn)
          THEN
            BEGIN
              READ(FIn, Ch3);
              IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
              IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
              IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
              IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
              IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
              IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
              IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
              IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
              IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
              IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
              IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
              IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
            END 
        END  
    END            
END;{ReadMonth}

PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
BEGIN {WriteMonth}
  IF Mo = Jan THEN WRITE('JAN') ELSE
  IF Mo = Feb THEN WRITE('FEB') ELSE
  IF Mo = Mar THEN WRITE('MAR') ELSE
  IF Mo = Apr THEN WRITE('APR') ELSE
  IF Mo = May THEN WRITE('MAY') ELSE
  IF Mo = Jun THEN WRITE('JUN') ELSE
  IF Mo = Jul THEN WRITE('JUL') ELSE
  IF Mo = Aug THEN WRITE('AUG') ELSE
  IF Mo = Sep THEN WRITE('SEP') ELSE
  IF Mo = Oct THEN WRITE('OCT') ELSE
  IF Mo = Nov THEN WRITE('NOV') ELSE
  IF Mo = Dec THEN WRITE('DEC') ELSE
  WRITE('NoMonth')
END; {WriteMonth}

PROCEDURE ReadDate (VAR FIn: TEXT; VAR Result: Date);
BEGIN{ReadDate}
  ReadMonth(FIn, Result.Mo);
  READ(FIn, Result.Day)
END;{ReadDate}

PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);
BEGIN{WriteDate}
  WriteMonth(FOut,Result.Mo);
  WRITE(FOut,Result.Day:3)
END;{WriteDate}


PROCEDURE CopyOut(VAR DateFile: FileOfDate);
VAR
  VarDate: Date;
BEGIN {CopyOut}
  WHILE NOT EOF(DateFile)
  DO
    BEGIN
      READ(DateFile, VarDate);
      WriteDate(OUTPUT, VarDate);
      WRITELN;
    END
END;{CopyOut}


FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  {Less:= D1 < D2}
BEGIN {Less}
  IF D1.Mo < D2.Mo
  THEN
    Less := TRUE
  ELSE
    IF D1.Mo > D2.Mo
      THEN
        Less := FALSE
      ELSE {D1.Mo = D2.Mo}
        Less := (D1.Day < D2.Day)
END; {Less}


 
BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    {��������� ����� ���� � DateFile � ��������������� �����}
    BEGIN
      ReadDate(FInput,D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {�������� �������� �������, ��� D �� DateFile � TFile}
          {�������� D � TFile}
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate,D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END

          WRITE(TFile, D);           
          {�������� ������� DateFile � TFile}
          {�������� TFile � DateFile}

        END;
    END;

  {�������� DateFile � OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile);

END.{SortDate}

