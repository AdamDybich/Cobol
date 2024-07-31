       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS01EX01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 powitanie PIC X(32) DISPLAY VALUE "Ala ma 2 koty".
        01 str1 PIC X(7) VALUE "Ala ma ".
        01 str2 PIC X(6) VALUE " koty.".
        01 ilosc COMP-1.
           PROCEDURE DIVISION.
      *   *DISPLAY powitanie.
      *    MOVE 8.5 TO ilosc
           DISPLAY "Napisz ile ala ma kotow"
           ACCEPT ilosc
           IF ilosc = 1 THEN MOVE " kota" TO str2
                GO TO ABC
           END-IF

           IF ilosc > 1 AND ilosc < 5 THEN MOVE " koty" TO str2
           ELSE MOVE " kotow" TO str2
           END-IF
           .
       ABC.
           DISPLAY str1, ilosc, str2.
           STOP RUN.
