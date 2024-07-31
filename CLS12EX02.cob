       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS12EX02.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN TO "zbior_test.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               STATUS ERR.

       DATA DIVISION.
       FILE SECTION.
       FD INFILE  BLOCK CONTAINS 0.
       01 IN-REC.
           COPY "baza2.txt".


       WORKING-STORAGE SECTION.
       01 ERR     PIC 99.


       PROCEDURE DIVISION.

           OPEN INPUT INFILE.
           IF ERR > 0
              DISPLAY 'open error =' ERR.

           READ INFILE
           PERFORM UNTIL ERR > 0
                   DISPLAY 'rekord='
                           TERMIN
                           ","
                           ZNACZNIK
                           ","
                           OPIS
                           ","
                           SUMA
                           ","
                           KOMENTARZ
                   READ INFILE
           END-PERFORM
           DISPLAY 'Ostatni status=' ERR


           CLOSE INFILE


           STOP RUN.