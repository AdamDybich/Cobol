       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS04EX04.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 DZIEN-TYG-INIT PIC X(70) VALUE "Poniedzi  Wtorek    Sroda
      -    " Czwartek  Piatek    Sobota    Niedziela".


        01 DZIEN-TYG REDEFINES DZIEN-TYG-INIT OCCURS 7 PIC X(10).
        77 I                  PIC 9(4) COMP.

       PROCEDURE DIVISION.


           PERFORM VARYING i FROM 1 BY 1 UNTIL I>7
                DISPLAY DZIEN-TYG (i)
           END-PERFORM

           STOP RUN.