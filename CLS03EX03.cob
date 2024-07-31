       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS03EX03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 data-1.
           05 dzien  PIC 99.
           05 FILLER PIC X VALUE "\".
           05 mies   PIC 99.
           05 FILLER PIC X VALUE "\".
           05 rok    PIC 9(4).  
        
      * 77 ilosc PIC S9(3).
       PROCEDURE DIVISION.
           MOVE "23\01\2024" TO DATA-1
           DISPLAY DATA-1 " dzien= " DZIEN " miesiac= " MIES.

           STOP RUN.
