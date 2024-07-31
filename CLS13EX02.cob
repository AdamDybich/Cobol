       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS13EX02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  KWOTA                  PIC 9(9) COMP-3.
       01  CYFRA                  PIC 9.
       01  DZIELNIK               PIC 9(9).
       01  RESZTA                 PIC 9(9).
       01  I                      PIC 9(4) COMP.
       77  LICZEBNIK              PIC X(200).
       01  J                      PIC 9(4).

       01  JEDNOSTKI-SLOWA.

          05 JEDNOSTKA-ELEMENT.
             10 JEDNOSTKA1       PIC X(10)  VALUE 'jeden_'.
             10 JEDNOSTKA2       PIC X(10)  VALUE 'dwa_'.
             10 JEDNOSTKA3       PIC X(10)  VALUE 'trzy_'.
             10 JEDNOSTKA4       PIC X(10)  VALUE 'cztery_'.
             10 JEDNOSTKA5       PIC X(10)  VALUE 'piec_'.
             10 JEDNOSTKA6       PIC X(10)  VALUE 'szesc_'.
             10 JEDNOSTKA7       PIC X(10)  VALUE 'siedem_'.
             10 JEDNOSTKA8       PIC X(10)  VALUE 'osiem_'.
             10 JEDNOSTKA9       PIC X(10)  VALUE 'dziewiec_'.
          05 JEDNOSTKI-TABLICA REDEFINES JEDNOSTKA-ELEMENT
                OCCURS 9 TIMES   PIC X(10).

       01 DZIESIATKI-SLOWA.

          05 DZIESIATKI-ELEMENT.
             10 DZIESIATKA1      PIC X(16)  VALUE 'dziesiec_'.
             10 DZIESIATKA2      PIC X(16)  VALUE 'dwadziescia_'.
             10 DZIESIATKA3      PIC X(16)  VALUE 'trzydziesci_'.
             10 DZIESIATKA4      PIC X(16)  VALUE 'czterdziesci_'.
             10 DZIESIATKA5      PIC X(16)  VALUE 'piedziesiat_'.
             10 DZIESIATKA6      PIC X(16)  VALUE 'szescdziesiat_'.
             10 DZIESIATKA7      PIC X(16)  VALUE 'siedemdziesiat_'.
             10 DZIESIATKA8      PIC X(16)  VALUE 'osiemdziesiat_'.
             10 DZIESIATKA9      PIC X(16)  VALUE 'dziewieciesiat_'.
          05 DZIESIATKI-TABLICA REDEFINES DZIESIATKI-ELEMENT
                OCCURS 9 TIMES   PIC X(16).

       01  NASTKI-SLOWA.

          05 NASTKI-ELEMENT.

             10 NASTKA0          PIC X(16)  VALUE 'dziesiec_'.
             10 NASTKA1          PIC X(16)  VALUE 'jedenascie_'.
             10 NASTKA2          PIC X(16)  VALUE 'dwanascie_'.
             10 NASTKA3          PIC X(16)  VALUE 'trzynascie_'.
             10 NASTKA4          PIC X(16)  VALUE 'czternascie_'.
             10 NASTKA5          PIC X(16)  VALUE 'pietnascie_'.
             10 NASTKA6          PIC X(16)  VALUE 'szesnascie_'.
             10 NASTKA7          PIC X(16)  VALUE 'siedemnascie_'.
             10 NASTKA8          PIC X(16)  VALUE 'osiemnascie_'.
             10 NASTKA9          PIC X(16)  VALUE 'dziewetnascie_'.
          05 NASTKI-TABLICA REDEFINES NASTKI-ELEMENT
                OCCURS 9 TIMES   PIC X(16).

       01  SETKI-SLOWA.

          05 SETKI-ELEMENT.
             10 SETKA1           PIC X(16)  VALUE 'sto_'.
             10 SETKA2           PIC X(16)  VALUE 'dwiescie_'.
             10 SETKA3           PIC X(16)  VALUE 'trzysta_'.
             10 SETKA4           PIC X(16)  VALUE 'czterysta_'.
             10 SETKA5           PIC X(16)  VALUE 'piecset_'.
             10 SETKA6           PIC X(16)  VALUE 'szescset_'.
             10 SETKA7           PIC X(16)  VALUE 'siedemset_'.
             10 SETKA8           PIC X(16)  VALUE 'osiemset_'.
             10 SETKA9           PIC X(16)  VALUE 'dziewiecset_'.
          05 SETKI-TABLICA REDEFINES SETKI-ELEMENT
                OCCURS 9 TIMES   PIC X(16).

       PROCEDURE DIVISION.

           DISPLAY 'Podaj liczbę (maksymalnie 9 cyfr): '.
           ACCEPT KWOTA
           DISPLAY KWOTA

           MOVE 100000000 TO DZIELNIK

           MOVE 1 TO J

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 9 OR KWOTA = 0
                   DIVIDE KWOTA BY DZIELNIK GIVING CYFRA REMAINDER
                      RESZTA


           IF CYFRA NOT = 0

              IF I = 3 OR 6 OR 9
                      DISPLAY CYFRA
                      DISPLAY JEDNOSTKI-TABLICA(CYFRA)
                      IF I = 3
                         STRING JEDNOSTKI-TABLICA(CYFRA) DELIMITED
                            BY
                            SIZE INTO LICZEBNIK POINTER J
                         IF CYFRA = 0 OR 1 OR 5 OR 6 OR 7 OR 8 OR
                            9
                            STRING "milonow_" DELIMITED BY SIZE
                               INTO LICZEBNIK POINTER J
                         ELSE
                            STRING "milony_" DELIMITED BY SIZE
                               INTO LICZEBNIK POINTER J
                         END-IF
                         DISPLAY LICZEBNIK
                      END-IF
                      IF I = 6
                         STRING JEDNOSTKI-TABLICA(CYFRA) DELIMITED
                            BY
                            SIZE INTO LICZEBNIK POINTER J
                         IF CYFRA = 0 OR 1 OR 5 OR 6 OR 7 OR 8 OR
                            9
                            STRING "tysiecy_" DELIMITED BY SIZE
                               INTO LICZEBNIK POINTER J
                         ELSE
                            STRING "tysiace_" DELIMITED BY SIZE
                               INTO LICZEBNIK POINTER J
                         END-IF
                         DISPLAY LICZEBNIK
                      END-IF
                      IF I = 9
                         STRING JEDNOSTKI-TABLICA(CYFRA) DELIMITED
                            BY
                            SIZE INTO LICZEBNIK POINTER J
                         DISPLAY LICZEBNIK
                      END-IF
              END-IF

              IF I = 1 OR I = 4 OR I = 7

                         DISPLAY CYFRA
                         DISPLAY SETKI-TABLICA(CYFRA)


                            STRING SETKI-TABLICA(CYFRA) DELIMITED BY
                               SPACE INTO LICZEBNIK POINTER J
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
                                  SIZE INTO LICZEBNIK POINTER J


                                 IF I = 5
                                  STRING "tysiecy_" DELIMITED BY SIZE
                                  INTO LICZEBNIK POINTER J
                                   END-IF
                                 if i = 2
                                  STRING "milonow_" DELIMITED BY SIZE
                                  INTO LICZEBNIK POINTER J
                                 end-if

                      ADD 1 TO I

                            ELSE
                               DISPLAY CYFRA
                               DISPLAY DZIESIATKI-TABLICA(CYFRA)
                               STRING DZIESIATKI-TABLICA(CYFRA)
                                  DELIMITED BY
                                  SIZE INTO LICZEBNIK POINTER J
                            END-IF

              END-IF
           END-IF

                   MOVE RESZTA TO KWOTA
                   DIVIDE 10 INTO DZIELNIK
           END-PERFORM

           DISPLAY LICZEBNIK

           STOP RUN.
