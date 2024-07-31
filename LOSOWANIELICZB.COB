       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOSOWANIELICZB.
        DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  X PIC 9(4).
       77  N PIC 9(9).
       77  K PIC 9(9).
       77  POZYCJA PIC 9(3).

       01  LICZBY PIC 9(3) OCCURS 1000. *> tablica 1000 elementów
       01  LICZNIK PIC 9(2) VALUE 0.
       01  SUMA PIC 9(7) VALUE 0.

       01  LICZBY-WORK PIC 9(3).


       PROCEDURE DIVISION.



           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 1000
               COMPUTE X = FUNCTION RANDOM * 1000

               DISPLAY X

               MOVE X TO LICZBY(N)

           END-PERFORM

           MOVE LICZBY(1) TO LICZBY-WORK
           MOVE 1 TO POZYCJA
           MOVE 0 TO SUMA

           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 1000

              IF LICZBY(N) > LICZBY-WORK
               MOVE LICZBY(N) TO LICZBY-WORK
               MOVE N TO POZYCJA
              END-IF
           ADD LICZBY(N) TO SUMA
           END-PERFORM

               DISPLAY 'NAJWIEKSZA LICZBA TO ' LICZBY-WORK
               DISPLAY 'POZYCJA LICZBY W TABLICY TO ' POZYCJA

           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 1000
           MOVE 0 TO LICZNIK

               PERFORM VARYING K FROM 1 BY 1 UNTIL K > 1000
                   IF LICZBY(K) = N
                   ADD 1 TO LICZNIK
                   END-IF

               END-PERFORM
               IF LICZNIK NOT = 1
               DISPLAY 'ZMIENNA ' N ' WYSTAPILA ' LICZNIK
               END-IF

           END-PERFORM

           DISPLAY 'SUMA WSZYSTKICH LICZB TO ' SUMA


           STOP RUN.
