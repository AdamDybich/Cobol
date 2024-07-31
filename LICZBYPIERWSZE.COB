       IDENTIFICATION DIVISION.
       PROGRAM-ID. LICZBYPIERWSZE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  LICZBA          PIC 9(9).
       77  DZIELNIK        PIC 9(9).
       77  WYNIK           PIC 9(9).
       77  RESZTA          PIC 9(9).
       77  KONIEC          PIC 9(9).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY "PODAJ LICZBE"
            ACCEPT LICZBA

            COMPUTE KONIEC = 1 + FUNCTION SQRT(LICZBA)
            DISPLAY LICZBA ' ' KONIEC

           PERFORM VARYING DZIELNIK FROM 2 BY 1 UNTIL DZIELNIK >= KONIEC

               DIVIDE LICZBA BY DZIELNIK GIVING WYNIK REMAINDER RESZTA

           DISPLAY LICZBA '/' DZIELNIK '=' WYNIK

               IF RESZTA = 0 THEN DISPLAY LICZBA ' NIE JEST PIERWSZA'
                   STOP RUN
                END-IF
            END-PERFORM
           DISPLAY LICZBA ' JEST PIERWSZA!'


           STOP RUN.
