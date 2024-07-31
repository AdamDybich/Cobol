       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS07EX02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        77 x PIC 9(4).
       PROCEDURE DIVISION.
      * Mainline
           MOVE 10 TO X
           PERFORM 2-PAR
               
           DISPLAY "wrocil do proc div"

           STOP RUN.
    
           1-Sekcja SECTION.
           1-Par.
               DISPLAY X
               DISPLAY 'Sekcja 1, paragraf 1'.
        
           2-Par.
               IF x > 3 THEN DISPLAY "tutaj konczymy"
                        EXIT PARAGRAPH
               END-IF
               DISPLAY 'Sekcja 1, paragraf 2'.
        
           2-Sekcja SECTION.
           3-Par.
               DISPLAY 'Sekcja 2, paragraf 3'.
           4-Par.
               DISPLAY 'Sekcja 2, paragraf 4'.
           5-Par.
               DISPLAY 'Sekcja 2, paragraf 5'.
