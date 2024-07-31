       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS03EX02.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 data-1.
           05 dzien PIC 99.
           05 mies  PIC 99.
           05 rok   PIC 9(4).  
        
      * 77 ilosc PIC S9(3).
       PROCEDURE DIVISION.
           MOVE "23012024" TO DATA-1
           DISPLAY DATA-1 " dzien= " DZIEN " miesiac= " MIES.

           DISPLAY FUNCTION CURRENT-DATE.
           STOP RUN.

