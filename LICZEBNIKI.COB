       IDENTIFICATION DIVISION.
       PROGRAM-ID. LICZEBNIKI.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  KWOTA                  PIC 9(9) COMP-3.
       01  CYFRA                  PIC 9.
       01  DZIELNIK               PIC 9(9).
       01  RESZTA                 PIC 9(9).
       01  I                      PIC 9(4) COMP.
       77  LICZEBNIK              PIC X(200).
       01  J                      PIC 9(4).
       01  LICZBA-MILONOW         PIC 9(3).
       01  LICZBA-TYSIECY         PIC 9(3).
       01  M-T                    PIC X(20).

       01  JEDNOSTKI-SLOWA.

          05 JEDNOSTKA-ELEMENT.
             10 JEDNOSTKA1       PIC X(10)  VALUE 'jeden'.
             10 JEDNOSTKA2       PIC X(10)  VALUE 'dwa'.
             10 JEDNOSTKA3       PIC X(10)  VALUE 'trzy'.
             10 JEDNOSTKA4       PIC X(10)  VALUE 'cztery'.
             10 JEDNOSTKA5       PIC X(10)  VALUE 'piec'.
             10 JEDNOSTKA6       PIC X(10)  VALUE 'szesc'.
             10 JEDNOSTKA7       PIC X(10)  VALUE 'siedem'.
             10 JEDNOSTKA8       PIC X(10)  VALUE 'osiem'.
             10 JEDNOSTKA9       PIC X(10)  VALUE 'dziewiec'.
          05 JEDNOSTKI-TABLICA REDEFINES JEDNOSTKA-ELEMENT
                OCCURS 9 TIMES   PIC X(10).

       01 DZIESIATKI-SLOWA.

          05 DZIESIATKI-ELEMENT.
             10 DZIESIATKA1      PIC X(16)  VALUE 'dziesiec'.
             10 DZIESIATKA2      PIC X(16)  VALUE 'dwadziescia'.
             10 DZIESIATKA3      PIC X(16)  VALUE 'trzydziesci'.
             10 DZIESIATKA4      PIC X(16)  VALUE 'czterdziesci'.
             10 DZIESIATKA5      PIC X(16)  VALUE 'piedziesiat'.
             10 DZIESIATKA6      PIC X(16)  VALUE 'szescdziesiat'.
             10 DZIESIATKA7      PIC X(16)  VALUE 'siedemdziesiat'.
             10 DZIESIATKA8      PIC X(16)  VALUE 'osiemdziesiat'.
             10 DZIESIATKA9      PIC X(16)  VALUE 'dziewieciesiat'.
          05 DZIESIATKI-TABLICA REDEFINES DZIESIATKI-ELEMENT
                OCCURS 9 TIMES   PIC X(16).

       01  NASTKI-SLOWA.

          05 NASTKI-ELEMENT.

             10 NASTKA0          PIC X(16)  VALUE 'dziesiec'.
             10 NASTKA1          PIC X(16)  VALUE 'jedenascie'.
             10 NASTKA2          PIC X(16)  VALUE 'dwanascie'.
             10 NASTKA3          PIC X(16)  VALUE 'trzynascie'.
             10 NASTKA4          PIC X(16)  VALUE 'czternascie'.
             10 NASTKA5          PIC X(16)  VALUE 'pietnascie'.
             10 NASTKA6          PIC X(16)  VALUE 'szesnascie'.
             10 NASTKA7          PIC X(16)  VALUE 'siedemnascie'.
             10 NASTKA8          PIC X(16)  VALUE 'osiemnascie'.
             10 NASTKA9          PIC X(16)  VALUE 'dziewetnascie'.
          05 NASTKI-TABLICA REDEFINES NASTKI-ELEMENT
                OCCURS 9 TIMES   PIC X(16).

       01  SETKI-SLOWA.

          05 SETKI-ELEMENT.
             10 SETKA1           PIC X(16)  VALUE 'sto'.
             10 SETKA2           PIC X(16)  VALUE 'dwiescie'.
             10 SETKA3           PIC X(16)  VALUE 'trzysta'.
             10 SETKA4           PIC X(16)  VALUE 'czterysta'.
             10 SETKA5           PIC X(16)  VALUE 'piecset'.
             10 SETKA6           PIC X(16)  VALUE 'szescset'.
             10 SETKA7           PIC X(16)  VALUE 'siedemset'.
             10 SETKA8           PIC X(16)  VALUE 'osiemset'.
             10 SETKA9           PIC X(16)  VALUE 'dziewiecset'.
          05 SETKI-TABLICA REDEFINES SETKI-ELEMENT
                OCCURS 9 TIMES   PIC X(16).

       PROCEDURE DIVISION.

           DISPLAY 'Podaj liczbę (maksymalnie 9 cyfr): '.
           ACCEPT KWOTA
           DISPLAY KWOTA

           MOVE 100000000 TO DZIELNIK

           MOVE 1 TO J

           DIVIDE KWOTA BY 1000000 GIVING
           LICZBA-MILONOW REMAINDER RESZTA

           DIVIDE RESZTA BY 1000 GIVING RESZTA LICZBA-TYSIECY

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 9 OR KWOTA = 0
                   DIVIDE KWOTA BY DZIELNIK GIVING CYFRA REMAINDER
                      RESZTA


           IF CYFRA NOT = 0

              IF I = 3 OR 6 OR 9
                      DISPLAY CYFRA
                      DISPLAY JEDNOSTKI-TABLICA(CYFRA)
                      IF I = 3
                         STRING JEDNOSTKI-TABLICA(CYFRA) DELIMITED
                            BY SPACE INTO LICZEBNIK POINTER J
                            ADD 1 TO J

                         DISPLAY LICZEBNIK
                      END-IF
                      IF I = 6
                         STRING JEDNOSTKI-TABLICA(CYFRA) DELIMITED
                            BY SPACE INTO LICZEBNIK POINTER J
                            ADD 1 TO J

                         DISPLAY LICZEBNIK
                      END-IF
                      IF I = 9
                         STRING JEDNOSTKI-TABLICA(CYFRA) DELIMITED
                            BY SPACE INTO LICZEBNIK POINTER J
                            ADD 1 TO J
                         DISPLAY LICZEBNIK
                      END-IF
              END-IF

              IF I = 1 OR I = 4 OR I = 7

                         DISPLAY CYFRA
                         DISPLAY SETKI-TABLICA(CYFRA)


                            STRING SETKI-TABLICA(CYFRA) DELIMITED BY
                               SPACE INTO LICZEBNIK POINTER J
                               ADD 1 TO J
                            DISPLAY LICZEBNIK

              END-IF

              IF I = 2 OR 5 OR 8


                  IF CYFRA = 1

                               DISPLAY CYFRA
                               DIVIDE 10 INTO DZIELNIK
                               MOVE RESZTA TO KWOTA
                               DIVIDE KWOTA BY DZIELNIK GIVING CYFRA
                               REMAINDER RESZTA

                           STRING NASTKI-TABLICA(CYFRA + 1) DELIMITED BY
                                  SPACE INTO LICZEBNIK POINTER J
                                  ADD 1 TO J

                      ADD 1 TO I

                            ELSE
                             DISPLAY CYFRA
                             DISPLAY DZIESIATKI-TABLICA(CYFRA)
                             STRING DZIESIATKI-TABLICA(CYFRA)
                             DELIMITED BY SPACE INTO LICZEBNIK POINTER J
                             ADD 1 TO J
                            END-IF

              END-IF
           END-IF

           IF I = 3
               MOVE 'MILIONOW' TO M-T
               IF (LICZBA-MILONOW(3:1) = 2 OR 3 OR 4) AND
               (LICZBA-MILONOW(2:1) NOT = 1) THEN MOVE 'MILIONY' TO M-T
               END-IF

               IF LICZBA-MILONOW = 1 MOVE 'MILION' TO M-T
               END-IF

               IF LICZBA-MILONOW = 0 MOVE ' ' TO M-T
               END-IF

               STRING M-T DELIMITED BY SPACE INTO LICZEBNIK POINTER J

               ADD 1 TO J

           END-IF

           IF I = 6
               MOVE 'TYSIECY' TO M-T
               IF (LICZBA-TYSIECY(3:1) = 2 OR 3 OR 4) AND
               (LICZBA-TYSIECY(2:1) NOT = 1) THEN MOVE 'TYSIACE' TO M-T
               END-IF

               IF LICZBA-TYSIECY = 1 MOVE 'TYSIAC' TO M-T
               END-IF

               IF LICZBA-TYSIECY = 0 MOVE ' ' TO M-T
               END-IF

               STRING M-T DELIMITED BY SPACE INTO LICZEBNIK POINTER J

               ADD 1 TO J

           END-IF

                   MOVE RESZTA TO KWOTA
                   DIVIDE 10 INTO DZIELNIK
           END-PERFORM

           DISPLAY LICZEBNIK

           STOP RUN.
