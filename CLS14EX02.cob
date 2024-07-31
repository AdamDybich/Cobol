       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS14EX02.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "Baza4"
               ORGANIZATION is INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY lp
               STATUS err.

       DATA DIVISION.
       FILE SECTION.

       FD infile  BLOCK CONTAINS 0.
        01 in-rec.
        05 lp PIC 9(1).
        05 towar PIC X(50).
       WORKING-STORAGE SECTION.
        01 err        PIC 99.
        01 SAMOLOT   PIC x(20).



       PROCEDURE DIVISION.

           OPEN I-O INFILE

           PERFORM 9 TIMES
           ACCEPT IN-REC
           DISPLAY "LP. " lp " Towar " TOWAR
           WRITE IN-REC
           DISPLAY ERR
           END-PERFORM

           move 3 to LP
           READ INFILE
           DISPLAY ERR
           DISPLAY TOWAR

           CLOSE INFILE

           STOP RUN

           OPEN OUTPUT INFILE.
      *    OPEN INPUT INFILE.
           IF err > 0 DISPLAY 'open error =' err.

      *     READ INFILE
      *     PERFORM UNTIL ERR > 0
      *         DISPLAY 'rekord=' IN-REC
      *         READ INFILE
      *     END-PERFORM
      *     DISPLAY 'Ostatni status=' ERR

           MOVE 'litwo, oczyzno moja' TO IN-REC
           WRITE IN-REC
           IF err > 0 DISPLAY 'write error =' err.
           MOVE 'ty jesteś jak zdrowie' TO IN-REC
           WRITE IN-REC
           MOVE 'nikt sie nie dowie' TO IN-REC
           WRITE IN-REC

           CLOSE INFILE
           OPEN INPUT INFILE

           READ INFILE.
           DISPLAY 'Rekord=' IN-REC.
           CLOSE INFILE


           STOP RUN.
