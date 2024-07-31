       IDENTIFICATION DIVISION.

      *    lOADER - PROGRAM DO WPISUYWANIA DANYCH DO PLIKU Z BAZY DANYCH

       PROGRAM-ID. WPIS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "Baza5"
               ORGANIZATION is INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY TOWAR
               STATUS err.

       DATA DIVISION.

       FILE SECTION.

       FD infile  BLOCK CONTAINS 0.
        01 in-rec.
        05 towar PIC X(20).
        05 waga pic ZZZZZZZ9.99.
        05 cena pic ZZZZZZZ9.99.
        05 ILOSC PIC ZZZZZZZ9.99.

       WORKING-STORAGE SECTION.
        01 err        PIC 99.

       PROCEDURE DIVISION.

           OPEN OUTPUT INFILE

           DISPLAY "stat otwar: " ERR

           ACCEPT IN-REC

           PERFORM UNTIL IN-REC(1:1) = "@"

           DISPLAY " Towar " TOWAR " Waga " WAGA " cena " CENA
           " ilosc " ILOSC
           WRITE IN-REC
           if err > 0
               DISPLAY ERR
           END-IF
           ACCEPT IN-REC
           END-PERFORM

           CLOSE INFILE

           STOP RUN.
