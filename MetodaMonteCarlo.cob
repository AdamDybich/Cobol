      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. METODAMONTECARLO.
        DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  X COMP-1.
       77  Y COMP-1.
       77  N PIC 9(9).
       77  K PIC 9(9).
       77  P COMP-1.


       PROCEDURE DIVISION.

           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10000
               MOVE FUNCTION RANDOM TO Y
               COMPUTE X = FUNCTION RANDOM * 3.141

               DISPLAY X ' ' Y

               IF Y <= FUNCTION SIN(X)
                      ADD 1 TO K
               END-IF
           END-PERFORM

           COMPUTE P = 3.141*K/(N - 1)
           DISPLAY 'POLE= ' P

           STOP RUN.
