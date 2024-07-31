       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS13EX01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT infile ASSIGN TO "baza3.txt"
               ORGANIZATION SEQUENTIAL
               STATUS err.

       DATA DIVISION.
       FILE SECTION.
       FD infile  BLOCK CONTAINS 0
                  RECORDING MODE V
                  RECORD VARYING FROM 1 to 80 DEPENDING ON len.
        01  in-rec PIC X(80).
       WORKING-STORAGE SECTION.
        01 err        PIC 99.
        77 len        PIC 99.


       PROCEDURE DIVISION.

           OPEN OUTPUT INFILE

           MOVE 'litwo, oczyzno moja' TO IN-REC
               MOVE 12 TO len
               WRITE IN-REC
               IF err > 0 DISPLAY 'write error =' err.
               MOVE 'ty jestes jak zdrowie' TO IN-REC
               MOVE 43 TO len
               WRITE IN-REC
               MOVE 'nikt sie nie dowie' TO IN-REC
               MOVE 543 TO len
               WRITE IN-REC

           CLOSE INFILE


           STOP RUN.
