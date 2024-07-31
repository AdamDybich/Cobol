       IDENTIFICATION DIVISION.

      *    READER - PROGRAM DO czytania DANYCH Z BAZY DANYCH

       PROGRAM-ID. CLS16EX01.

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


       PROCEDURE DIVISION.


           OPEN I-O INFILE.
           DISPLAY 'open error =' err.

      *     READ INFILE
      *     PERFORM UNTIL ERR > 0
      *         DISPLAY 'rekord=' IN-REC
      *         READ INFILE
      *     END-PERFORM
      *     DISPLAY 'Ostatni status=' ERR

           MOVE "Chleb zakopianski" to TOWAR

           READ INFILE.

           MOVE "Chleb mleczny" to TOWAR
           READ INFILE KEY IS TOWAR
           DISPLAY 'Rekord=' IN-REC.
           CLOSE INFILE

           STOP RUN.
