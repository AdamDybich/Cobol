       IDENTIFICATION DIVISION.

       PROGRAM-ID. MAGAZYN.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN TO "Baza5"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY TOWAR
               STATUS ERR.

       DATA DIVISION.

       FILE SECTION.

       FD INFILE  BLOCK CONTAINS 0.
       01 IN-REC.
          05 TOWAR  PIC X(20).
          05 WAGA   PIC ZZZZZZZ9.99.
          05 CENA   PIC ZZZZZZZ9.99.
          05 ILOSC  PIC ZZZZZZZ9.99.

       WORKING-STORAGE SECTION.
       01 WYBOR     PIC X(1).
          88 A                VALUE "A".
          88 B                VALUE "B".
          88 C                VALUE "C".
          88 D                VALUE "D".
          88 E                VALUE "E".
          88 Z                VALUE "Z".
       01 ERR       PIC 99.
       01 KASUJ     PIC X(1).
          88 T                VALUE "T".
          88 N                VALUE "N".
       01 ZMIANA    PIC S9(9).
       01 ILOSC-ZMIANA PIC S9(9).
       01 KLUCZ PIC X(10).
       01 WORK PIC X(50).
       01 NN PIC 9(9).
       01 II PIC 9(9) VALUE 1.
       01 II1 PIC 9(9) VALUE 1.
       01 JJ PIC 9(9) VALUE 1.

       01 TABLICA-TOW OCCURS 100.
          05 TOWAR-TOW  PIC X(20).
          05 WAGA-TOW   PIC ZZZZZZZ9.99.
          05 CENA-TOW   PIC ZZZZZZZ9.99.
          05 ILOSC-TOW  PIC ZZZZZZZ9.99.


       PROCEDURE DIVISION.

           PERFORM UNTIL Z

                   DISPLAY "MENU"
                   DISPLAY "A. POKAZ STANY MAGAZYNOWE"
                   DISPLAY "B. DODAJ STANY MAGAZYNOWE"
                   DISPLAY "C. USUN STANY MAGAZYNOWE"
                   DISPLAY "D. ZMIEN ILOSCI NA STANIE"
                   DISPLAY "E. SORTUJ STANY PO CENIE"
                   DISPLAY "Z. WYJDZ"

                   ACCEPT WYBOR

                   IF A
                      PERFORM 100-STANY
                   END-IF

                   IF B
                      PERFORM 200-DODAJ

                   END-IF

                   IF C
                      PERFORM 300-USUN

                   END-IF

                   IF D
                      PERFORM 400-ZMIEN

                   END-IF

                   IF E
                      PERFORM 500-SORTUJCENA

                   END-IF

                   IF Z
                      CLOSE INFILE
                      STOP RUN
                   END-IF

           END-PERFORM
           .


       100-STANY.

           OPEN I-O INFILE.
           IF ERR NOT = 0
              DISPLAY 'open error =' ERR
           END-IF

           DISPLAY "STANY MAGAZYNOWE NA DZIS:"
           DISPLAY " "

           DISPLAY "                    MASA      CENA      ILOSC"


           READ INFILE
           PERFORM UNTIL ERR > 0
                   DISPLAY IN-REC
                   READ INFILE
           END-PERFORM
           DISPLAY "---------------------"
      *     DISPLAY 'Ostatni status=' ERR
           CLOSE INFILE

           .
       200-DODAJ.

           OPEN EXTEND INFILE.
           IF ERR NOT = 0
              DISPLAY 'open error =' ERR
           END-IF
           DISPLAY "PODAJ NAZWE TOWARU"
           ACCEPT TOWAR
           DISPLAY "PODAJ WAGE TOWARU"
           ACCEPT WAGA
           DISPLAY "PODAJ CENE TOWARU"
           ACCEPT CENA
           DISPLAY "PODAJ ILOSC TOWARU"
           ACCEPT ILOSC
           WRITE IN-REC
           IF ERR NOT = 0
              DISPLAY "WRITE ERROR" ERR
           END-IF
           CLOSE INFILE
           .
       300-USUN.

           OPEN I-O INFILE.
           IF ERR NOT = 0
              DISPLAY 'open error =' ERR
           END-IF

           ACCEPT TOWAR
           START INFILE KEY >= TOWAR
           IF ERR NOT = 0
              DISPLAY 'start error =' ERR
           END-IF
           READ INFILE


           IF ERR NOT = 0
              DISPLAY 'open error =' ERR
           END-IF
           DISPLAY "CZY NAPEWNO CHCESZ SKASOAC TEN REKORD T/N"
           ACCEPT KASUJ
           IF T
              DELETE INFILE

              IF ERR = 0
                 DISPLAY "SKASOWALES"
              ELSE
                 DISPLAY " delete error = " ERR
              END-IF
           END-IF

           CLOSE INFILE
           .

       400-ZMIEN.

           OPEN I-O INFILE.
           IF ERR NOT = 0
              DISPLAY 'open error =' ERR
           END-IF

           DISPLAY "KTÓRY TOWAR CHCESZ ZMIENIC?"

           ACCEPT TOWAR
           START INFILE KEY >= TOWAR
           IF ERR NOT = 0
              DISPLAY 'start error =' ERR
           END-IF
           READ INFILE

           DISPLAY "JAKA ILOSC TOWARU CHCESZ DODAC LUB ODJAC"

           ACCEPT ZMIANA

           MOVE ILOSC OF IN-REC TO ILOSC-ZMIANA

           ADD ZMIANA TO ILOSC-ZMIANA

           MOVE ILOSC-ZMIANA TO ILOSC OF IN-REC

           REWRITE IN-REC

           IF ERR NOT = 0
              DISPLAY 'REWRITE error =' ERR
           END-IF

           CLOSE INFILE
           .

       500-SORTUJCENA.

           OPEN I-O INFILE.
           IF ERR NOT = 0
              DISPLAY 'open error =' ERR
           END-IF

           DISPLAY "SORTUJE PO CENIE"

      *     IF ERR NOT = 0
      *        DISPLAY 'start error =' ERR
      *     END-IF
      *     READ INFILE

           READ INFILE
           MOVE IN-REC TO TABLICA-TOW(1)
           PERFORM VARYING NN FROM 2 BY 1 UNTIL ERR > 0 OR NN > 100
            READ INFILE
            MOVE IN-REC TO TABLICA-TOW(NN)
           END-PERFORM

           SUBTRACT 2 FROM NN

           PERFORM VARYING II FROM 1 BY 1 UNTIL II > NN
            DISPLAY CENA-TOW(II)

           END-PERFORM
           DISPLAY 'NIEPOSORTOWANE U GORY'

           PERFORM VARYING JJ FROM NN BY -1 UNTIL JJ = 0
            PERFORM VARYING II FROM 1 BY 1 UNTIL II > JJ
             ADD 1 TO II GIVING II1
             IF CENA-TOW OF TABLICA-TOW(II) > CENA-TOW
             OF TABLICA-TOW(II1)
             MOVE TABLICA-TOW(II) TO WORK
             MOVE TABLICA-TOW(II1) TO TABLICA-TOW(II)
             MOVE WORK TO TABLICA-TOW(II1)
            END-PERFORM
           END-PERFORM

           PERFORM VARYING II FROM 1 BY 1 UNTIL II > (NN + 1)
            DISPLAY TOWAR-TOW(II) CENA-TOW(II)

           END-PERFORM

           DISPLAY 'POSORTOWANE U GORY'


           CLOSE INFILE
           .

