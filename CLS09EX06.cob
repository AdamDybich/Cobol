       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS09EX06.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
            
       77  plec PIC X.
       88  kobieta VALUE 'K', 'k'.
       88  mezczyzna VALUE 'M', 'm'.

       77  numer PIC 9(2).
       88  poprawne VALUE 10 THRU 19.
      
       PROCEDURE DIVISION.
           DISPLAY 'podaj swoja plec K lub M'
           ACCEPT PLEC

           IF KOBIETA
               DISPLAY 'Czesc babo'
           END-IF
           IF MEZCZYZNA
               DISPLAY 'czesc chlopie'
           END-IF.
           STOP RUN.
