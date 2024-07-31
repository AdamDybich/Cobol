       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS05EX01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        77 X PIC 9(4) COMP-1.
        77 Y PIC 9(4) COMP-1.
        77 Z PIC 9(4) COMP-1.
       PROCEDURE DIVISION.
           MOVE 81 TO X.
           MOVE 20 TO Y.
           MOVE 21 TO Z.

           ADD X TO Y GIVING Z.

           DISPLAY X " " Y " " Z.

           SUBTRACT X FROM Y GIVING Z.

           DISPLAY X " " Y " " Z.

           DIVIDE Y INTO X GIVING Z.

           DISPLAY X " " Y " " Z.

           MULTIPLY X BY Y GIVING Z
            ON SIZE ERROR DISPLAY "Mamy blad"
                            STOP RUN.

           DISPLAY X " " Y " " Z.
           STOP RUN.
