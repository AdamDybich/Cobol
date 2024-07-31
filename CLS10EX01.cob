       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS10EX01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 Tekst        PIC X(80).
        01 NowyTekst        PIC X(80).
        01 I            PIC 9(3).
        01 J            PIC 9(3).

       PROCEDURE DIVISION.
           MOVE "Ala    ma   kota" TO Tekst.
           MOVE SPACES TO NOWYTEKST
           MOVE 1 TO J.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 80
           IF Tekst(I:1) NOT = ' ' *> Sprawdzenie, czy bieżący znak nie jest spacją.
             MOVE Tekst(I:1) TO NOWYTEKST(J:1) *> Jeśli nie jest, przenieś go do NowyTekst.
             ADD 1 TO J *> Zwiększenie licznika dla NowyTekst.
           ELSE
           IF I > 1 AND Tekst(I - 1:1) NOT = ' ' *> Sprawdzenie, czy poprzedni znak nie jest spacją.
             MOVE ' ' TO NOWYTEKST(J:1) *> Jeśli poprzedni znak nie jest spacją, przenieś jedną spację do NowyTekst.
             ADD 1 TO J *> Zwiększenie licznika dla NowyTekst.
            END-IF
           END-IF
           END-PERFORM.

           DISPLAY "Oryginalny tekst: " Tekst.
           DISPLAY "Tekst po usunięciu nadmiarowych spacji: " NowyTekst.

           STOP RUN.
