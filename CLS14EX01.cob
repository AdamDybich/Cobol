       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS14EX01.

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

           OPEN INPUT INFILE
           READ INFILE

           PERFORM UNTIL ERR > 0

               DISPLAY 'rekord=' IN-REC ", leng" LEN "."
               READ INFILE


           END-PERFORM
           DISPLAY 'Ostatni status=' ERR


           CLOSE INFILE

           STOP RUN.
