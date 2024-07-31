       IDENTIFICATION DIVISION.
       PROGRAM-ID. RAPORT. *> CZYTANIE PLIKU SEKWENCYJNEGO

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
            SELECT MYFILE *> NAZWA PLIKU W PROGRAMIE
            ASSIGN TO "F:\gnuCobol\IMDBlist.txt"
            ORGANIZATION IS LINE SEQUENTIAL
            ACCESS MODE IS SEQUENTIAL
            FILE STATUS IS ERR.

       DATA DIVISION.
       FILE SECTION.
       FD MYFILE.
       01 MYFILE-RECORDS PICTURE X(219).

       WORKING-STORAGE SECTION.
       01 WS-RECORD.
           05 TYTUL   PIC X(88).
           05 TYP     PIC X(14).
           05 AUTOR   PIC X(46).
           05 ROCZNIK PIC X(6).
           05 OCENA   PIC 9.99999999.
           05 COS     PIC X(3).
           05 TAGI    PIC X(44).
           05 DLUGOSC PIC X(5).
           05 Y       PIC X(3).

       01  END-OF-FILE PIC A(3) VALUE 'NO'.
       01  TERMIN     PIC 9(6).
       01  CZAS       PIC 9(8).

       01  SUMA       PIC 9(9).

       01  OCENA-LICZBA PIC S9(7)V99 COMP-3.

       01  ERR PICTURE X(2).

       PROCEDURE DIVISION.

           OPEN I-O MYFILE.
           DISPLAY 'OPEINGIN FILE STATUS IS ' ERR

           READ MYFILE INTO WS-RECORD
           ACCEPT TERMIN FROM DATE
           ACCEPT CZAS FROM TIME

           DISPLAY "RAPORT TESTOWY KINA "
           TERMIN (1:2) "/" TERMIN(3:2) "/" TERMIN(5:2) " "
           CZAS(1:2) ":" CZAS(3:2)

           MOVE 0 TO SUMA

           PERFORM UNTIL ERR > "00"
               DISPLAY TYTUL "*" ROCZNIK "*" OCENA "*" TAGI

               MOVE OCENA TO OCENA-LICZBA
      *         DISPLAY "OCENA LICZBA " OCENA-LICZBA

               ADD OCENA-LICZBA TO SUMA

      *         DISPLAY "SUMA "SUMA

               READ MYFILE INTO WS-RECORD
      *      AT ENDs
      *          MOVE 'YES' TO END-OF-FILE
      *          DISPLAY 'FILE ENDED HERE FILE STATUS ' ERR
      *      NOT AT END
               END-READ
           END-PERFORM.
      *     DISPLAY "KODY BLEDU ZA PETLA" ERR

           DISPLAY "WARTOSC PRZEDSTAWIENIA TO
      -    "                                    " SUMA

           CLOSE MYFILE.
      *    DISPLAY 'CLOASING FILE STATUS IS ' ERR.

           STOP RUN.
