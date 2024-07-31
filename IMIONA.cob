       IDENTIFICATION DIVISION.
       PROGRAM-ID. IMIONA.
       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
            SELECT MYFILE *> NAZWA PLIKU W PROGRAMIE
            ASSIGN TO "F:\gnuCobol\LISTAOBECNOSCI.txt"
            ORGANIZATION IS LINE SEQUENTIAL
            ACCESS MODE IS SEQUENTIAL
            FILE STATUS IS ERR.

       DATA DIVISION.
       FILE SECTION.
       FD  MYFILE BLOCK CONTAINS 0.
       01  IMIE PIC X(80).

       WORKING-STORAGE SECTION.

       01  IMIE-WS PIC X(80).

       01  TABLICE.
           05 TABLICE-IMIONA OCCURS 100.
               10 TABLICE-NR       PIC 9(2).
               10 TABLICE-NAZWISKO PIC X(25).
               10 TABLICE-IMIE     PIC X(25).
       01  ERR PIC 9(2).
       01  END-OF-FILE PIC A(3) VALUE 'NO'.
       01  I PIC 9(2) VALUE 1.
       01  I1 PIC 9(2) VALUE 1.
       01  J PIC 9(2) VALUE 1.
       01  N PIC 9(2) VALUE 1.

       01  TABLICE-WORK PIC X(52).
       01  IMIE-WORK PIC X(25).
       01  LICZNIK PIC 9(4) COMP.
      * 01  IMIE-WORK PIC X(25).

       PROCEDURE DIVISION.
           OPEN I-O MYFILE.
           IF ERR > 0 THEN DISPLAY 'BLAD OTWARCIA = ' ERR.


           PERFORM UNTIL END-OF-FILE = 'YES'
           READ MYFILE INTO IMIE-WS


               AT END

                MOVE 'YES' TO END-OF-FILE
                DISPLAY 'KONIEC PLIKU, BLAD ' ERR


            NOT AT END
            DISPLAY IMIE-WS
                 UNSTRING IMIE-WS DELIMITED BY '. ' OR ' ' INTO
                 TABLICE-NR(I)
                 TABLICE-NAZWISKO(I)
                 TABLICE-IMIE(I)

            END-UNSTRING
                 MOVE FUNCTION UPPER-CASE(TABLICE-IMIE(I))
                TO TABLICE-IMIE(I)
              DISPLAY 'NR:  ' TABLICE-NR(I)
              DISPLAY 'NAZWISKO: '
              Function Upper-case(TABLICE-NAZWISKO(I))
              DISPLAY 'IMIE:  '
              TABLICE-IMIE(I)
              ADD 1 TO I
            END-READ
           END-PERFORM
      *----------------------- TUTAJ NA DOLE SORTUJEMY PO IMIENIU
           COMPUTE N = I - 2
           DISPLAY "TUTAJ ZMIENNA N: " N
           PERFORM VARYING J FROM N BY -1 UNTIL J = 0

            PERFORM VARYING I FROM 1 BY 1 UNTIL I > J
             ADD 1 TO I GIVING I1
             IF TABLICE-IMIE(I) > TABLICE-IMIE (I1)
             MOVE TABLICE-IMIONA(I) TO TABLICE-WORK
             MOVE TABLICE-IMIONA(I1) TO TABLICE-IMIONA(I)
             MOVE TABLICE-WORK TO TABLICE-IMIONA(I1)
            END-PERFORM
           END-PERFORM

      *    PONIZEJ PETLA ZLICZAJACA IMIONA W TABLICY

           MOVE TABLICE-IMIE(1) TO IMIE-WORK
           MOVE 1 TO LICZNIK
         
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > N + 1
               IF TABLICE-IMIE(I) = IMIE-WORK
               ADD 1 TO LICZNIK
               ELSE
               DISPLAY IMIE-WORK ' ' LICZNIK
               MOVE TABLICE-IMIE(I) TO IMIE-WORK
               MOVE 1 TO LICZNIK
               END-IF
               END-PERFORM
               DISPLAY IMIE-WORK ' ' LICZNIK


           CLOSE MYFILE

                  STOP RUN.
