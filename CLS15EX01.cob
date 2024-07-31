       IDENTIFICATION DIVISION.

      *    lOADER - PROGRAM DO WPISUYWANIA DANYCH DO PLIKU Z BAZY DANYCH

       PROGRAM-ID. CLS15EX01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "Baza4"
               ORGANIZATION is INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY TOWAR
               STATUS err.

       DATA DIVISION.

       FILE SECTION.

       FD infile  BLOCK CONTAINS 0.
        01 in-rec.
        05 towar PIC X(20).
        05 waga pic 9(10).
        05 cena pic 9(10).

       WORKING-STORAGE SECTION.
        01 err        PIC 99.
        01 SAMOLOT   PIC x(20).



       PROCEDURE DIVISION.

           OPEN I-O INFILE

           DISPLAY "stat otwar: " ERR

           PERFORM UNTIL IN-REC(1:1) = "@"
           ACCEPT IN-REC
           DISPLAY " Towar " TOWAR " Waga " WAGA " cena " CENA
           WRITE IN-REC
           if err > 0
               DISPLAY ERR
           END-IF
           END-PERFORM

           READ INFILE
           DISPLAY ERR
           DISPLAY TOWAR

           CLOSE INFILE

           STOP RUN.
