       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS01EX02.
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

           EVALUATE ilosc
               WHEN 1 MOVE "kota" TO str2
               WHEN 2
               WHEN 3
               WHEN 4 MOVE "koty" TO str2

               WHEN OTHER MOVE "kotow" TO str2

           END-EVALUATE

           DISPLAY str1, ilosc, str2.
           STOP RUN.
