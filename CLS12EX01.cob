       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS12EX01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "zbior_test.txt"
               ORGANIZATION is LINE SEQUENTIAL
               STATUS err.

       DATA DIVISION.
       FILE SECTION.
       FD infile  BLOCK CONTAINS 0.
        01 in-rec.
        05 termin PIC X(5).
        05 znacznik PIC X(1).
        05 opis PIC X(29).
        05 suma PIC +99.99.
        05 komentarz PIC X(100).

       WORKING-STORAGE SECTION.
        01 err        PIC 99.
        

       PROCEDURE DIVISION.

           OPEN INPUT INFILE.
           IF err > 0 DISPLAY 'open error =' err.

           READ INFILE
           PERFORM UNTIL ERR > 0
               DISPLAY 'rekord=' TERMIN "," ZNACZNIK "," OPIS ","
               SUMA "," KOMENTARZ
               READ INFILE
           END-PERFORM
           DISPLAY 'Ostatni status=' ERR


           CLOSE INFILE


           STOP RUN.
