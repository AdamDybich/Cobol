       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS05EX04.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 a        PIC S9(4) USAGE COMP VALUE 1.
        01 b        PIC S9(4) USAGE COMP VALUE 1.
        01 c        PIC S9(4) USAGE COMP VALUE 1.
        01 delta    PIC S9(4) USAGE COMP VALUE 1.
        01 ac-4     PIC S9(4) USAGE COMP VALUE 1.
        01 mnoznik-4  PIC 9(4) USAGE COMP VALUE 4.
        01 mnoznik-2 PIC 9(4) USAGE COMP VALUE 2.
        01 mnoznik--1 PIC S9(4) USAGE COMP VALUE -1.
        01 x-1      PIC S9(4) USAGE COMP VALUE 1.
        01 x-2      PIC S9(4) USAGE COMP VALUE 1.

       PROCEDURE DIVISION.
           DISPLAY "Podaj wartosc a, inna od zera"
           ACCEPT A.
           DISPLAY "Podaj wartosc b"
           ACCEPT B.
           DISPLAY "Podaj wartosc c"
           ACCEPT C.
           
           MULTIPLY A BY C GIVING AC-4.
           MULTIPLY AC-4 BY MNOZNIK-4 GIVING AC-4.
           MULTIPLY B BY B GIVING DELTA.
           
           DISPLAY "4AC wynosi " AC-4.

           SUBTRACT AC-4 FROM DELTA GIVING DELTA
           DISPLAY "Wg wzoru Delta = b^2 - 4ac twoja delta wynosi "DELTA.

           IF DELTA = 0 THEN
           MULTIPLY B BY MNOZNIK--1
           MULTIPLY A BY MNOZNIK-2
           DIVIDE B INTO A GIVING X-1
           DISPLAY "X wynosi " X-1

           ELSE IF DELTA > 0 THEN
           COMPUTE X-1 = (-B + (DELTA ** 0.5)) / (2 * A)
           COMPUTE X-2 = (-B - (DELTA ** 0.5)) / (2 * A)
           DISPLAY "X1 wynosi " X-1
           DISPLAY "X2 wynosi " X-2

           ELSE
           DISPLAY "Nie ma iksów tumanie"

           END-IF
           END-IF
                   
           STOP RUN.
