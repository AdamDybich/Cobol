       IDENTIFICATION DIVISION.
       PROGRAM-ID. RYDBERG.
        DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  R COMP-1.
       01  N1 PIC 9(2).
       01  N2 PIC 9(2).
       01  DLUGOSC COMP-1.
       01  ZAKRES PIC X(9).




       PROCEDURE DIVISION.

           MOVE 0.0109677 TO R

           MOVE 1 TO N1
           MOVE 2 TO N2

           DISPLAY "R ROWNE " R

           PERFORM VARYING N1 FROM 1 BY 1 UNTIL N1 > 9

               PERFORM VARYING N2 FROM 2 BY 1 UNTIL N2 > 10
               
                   COMPUTE DLUGOSC = R * (( 1/(N1*N1)) - (1/(N2*N2)))
                   COMPUTE DLUGOSC = 1 / DLUGOSC
                       MOVE ' ' TO ZAKRES
                      if DLUGOSC < 410 then move 'UV' TO zakres
                       END-IF
                       if DLUGOSC> 780 then move 'IR' to zakres
                       END-IF

                   DISPLAY 'DLUGOSC DLA N1 ROWNEGO ' N1 ' I N2 ' N2
                   DISPLAY 'DLUGOSC ROWNA SIE ' DLUGOSC
                   DISPLAY 'ZAKRES SWIATLA TO ' ZAKRES

               END-PERFORM

           END-PERFORM

           STOP RUN.
