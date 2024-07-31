       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS16EX04.

       DATA DIVISION.


       WORKING-STORAGE SECTION.
        01 tutu-1     PIC 9(4) VALUE 5.
        01 znaki-1    PIC X(10) value "ola ma psa".
        01 err        PIC 99.
        77 len        PIC 99.


       PROCEDURE DIVISION.
           CALL program-1 USING TUTU-1, znaki-1

           DISPLAY " Po callu: " TUTU-1, ZNAKI-1

           STOP RUN.
