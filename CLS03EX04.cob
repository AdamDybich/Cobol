       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS03EX04.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 przlew.
           05 z-konta PIC 9(16).
           05 na-konto PIC 9(16).
           05 kwota PIC Z9(9).99.
           05 DATA-1.
             10 dzien  PIC 99.
             10 FILLER PIC X VALUE "\".
             10 mies   PIC 99.
             10 FILLER PIC X VALUE "\".
             10 rok    PIC 9(4). 

        01 trans.
           05 z-konta PIC 9(16).
           05 na-konto PIC 9(16).
           05 kwota PIC Z9(9).99.
           05 DATA-1.
             10 dzien  PIC 99.
             10 FILLER PIC X VALUE "\".
             10 mies   PIC 99.
             10 FILLER PIC X VALUE "\".
             10 rok    PIC 9(4). 
        
       PROCEDURE DIVISION.
           MOVE "23\01\2024" TO DATA-1 OF PRZLEW
           DISPLAY DATA-1 OF PRZLEW " dzien= " DZIEN OF PRZLEW
            " miesiac= " MIES OF PRZLEW.

           MOVE 100000 TO KWOTA IN TRANS. 
           DISPLAY "kwota= " KWOTA IN TRANS.

           STOP RUN.
