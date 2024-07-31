       IDENTIFICATION DIVISION.
       PROGRAM-ID. REKURENCJA.
        DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  N1 PIC 9(2).
       01  N2 PIC 9(2).
       01  SILNIA PIC 9(16).


       PROCEDURE DIVISION.


           MOVE 1 TO SILNIA

           PERFORM VARYING N1 FROM 2 BY 1 UNTIL N1 > 17
               COMPUTE SILNIA = SILNIA*N1
           END-PERFORM

           DISPLAY SILNIA

           STOP RUN.
