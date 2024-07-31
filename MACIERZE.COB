       IDENTIFICATION DIVISION.
       PROGRAM-ID. MACIERZE.
        DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MACIERZA.
           05 WIERSZA OCCURS 3.
               10 KOLUMNAA PIC S9(4) COMP OCCURS 3.

       01  MACIERZB.
           05 WIERSZB OCCURS 3.
               10 KOLUMNAB PIC S9(4) COMP OCCURS 3.
       01  MACIERZC.
           05 WIERSZC OCCURS 3.
               10 KOLUMNAC PIC S9(4) COMP OCCURS 3.

       01  MACIERZD.
           05 WIERSZD OCCURS 3.
               10 KOLUMNAD PIC S9(5) COMP OCCURS 3.

       01  X PIC 9(2).
       01  Y PIC 9(2).
       01  Z PIC 9(2).
       01  SUMA PIC S9(5).
      **********************************************
       PROCEDURE DIVISION.

           MOVE 3 TO KOLUMNAA (1,1)
           MOVE 5 TO KOLUMNAA (1,2)
           MOVE -1 TO KOLUMNAA (1,3)
           MOVE 4 TO KOLUMNAA (2,1)
           MOVE 0 TO KOLUMNAA (2,2)
           MOVE 2 TO KOLUMNAA (2,3)
           MOVE -7 TO KOLUMNAA (3,1)
           MOVE 1 TO KOLUMNAA (3,2)
           MOVE 6 TO KOLUMNAA (3,3)

           MOVE 2 TO KOLUMNAB (1,1)
           MOVE 3 TO KOLUMNAB (1,2)
           MOVE 8 TO KOLUMNAB (1,3)
           MOVE -9 TO KOLUMNAB (2,1)
           MOVE 11 TO KOLUMNAB (2,2)
           MOVE -8 TO KOLUMNAB (2,3)
           MOVE -6 TO KOLUMNAB (3,1)
           MOVE 14 TO KOLUMNAB (3,2)
           MOVE -9 TO KOLUMNAB (3,3)

           MOVE 1 TO X, Y, Z
           DISPLAY "***********************"
           DISPLAY "WYSWIETLANIE MACIERZY A"
           DISPLAY "***********************"
           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 3

               PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 3
                 DISPLAY 'MACIERZ A ' "X " X, " Y " Y, " " KOLUMNAA(X,Y)
                 WITH NO ADVANCING
               END-PERFORM

           END-PERFORM

           DISPLAY "***********************"
           DISPLAY "WYSWIETLANIE MACIERZY B"
           DISPLAY "***********************"
           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 3

               PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 3
                 DISPLAY 'MACIERZ B ' "X " X, " Y " Y, " " KOLUMNAB(X,Y)

               END-PERFORM

           END-PERFORM
           DISPLAY "***********************"
           DISPLAY "DODAWANIE MACIERZY A DO MACIERZY B"
           DISPLAY "***********************"
           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 3

               PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 3
                 COMPUTE KOLUMNAC(X,Y) = KOLUMNAA(X,Y)+KOLUMNAB(X,Y)

               END-PERFORM
           DISPLAY "***********************"
           DISPLAY "WYSWIETLANIE SUMY MACIERZY A I B CZYLI MACIERZY C"
           DISPLAY "***********************"
               PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 3
                 DISPLAY 'MACIERZ C ' "X " X, " Y " Y, " " KOLUMNAC(X,Y)

               END-PERFORM

           END-PERFORM
           DISPLAY "***********************"
           DISPLAY "MNOŻENIE MACIERZY A I B DAJE MACIERZ D"
           DISPLAY "***********************"

           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 3

               PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 3
               MOVE 0 TO SUMA
                   PERFORM VARYING Z FROM 1 BY 1 UNTIL Z > 3
                     COMPUTE SUMA = SUMA +
                     KOLUMNAA(X,Z)*KOLUMNAB(Z,Y)
                   END-PERFORM

                MOVE SUMA TO KOLUMNAD(X,Y)

               END-PERFORM
           END-PERFORM

           DISPLAY "***********************"
           DISPLAY "WYSWIETLANIE ILOCZYNU MACIERZY AIB CZYLI MACIERZY D"
           DISPLAY "***********************"

           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 3
               PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 3
                 DISPLAY 'MACIERZ D ' "X " X, " Y " Y, " " KOLUMNAD(X,Y)
               END-PERFORM

           END-PERFORM

           STOP RUN.
