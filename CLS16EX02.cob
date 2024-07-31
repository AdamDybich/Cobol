       IDENTIFICATION DIVISION.

      *    READER - PROGRAM DO czytania DANYCH Z BAZY DANYCH

       PROGRAM-ID. CLS16EX02.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "Baza4"
               ORGANIZATION is INDEXED
               ACCESS MODE IS SEQUENTIAL
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

           MOVE "Piwo" TO TOWAR
           START INFILE KEY > TOWAR
           DISPLAY " start error = " ERR

           READ INFILE

           PERFORM UNTIL ERR > 0 OR TOWAR(1:4) NOT EQUAL "Piwo"
               DISPLAY 'rekord=' IN-REC
               DELETE INFILE
               DISPLAY " delete error = " ERR
               READ INFILE
           END-PERFORM
           DISPLAY 'Ostatni status=' ERR

           CLOSE INFILE

           STOP RUN.
