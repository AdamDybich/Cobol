       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS11EX01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "Baza1.txt"
               ORGANIZATION is LINE SEQUENTIAL
               STATUS err.

       DATA DIVISION.
       FILE SECTION.
       FD infile  BLOCK CONTAINS 0.
        01 in-rec PIC X(80).
       WORKING-STORAGE SECTION.
        01 err        PIC 99.


       PROCEDURE DIVISION.

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
