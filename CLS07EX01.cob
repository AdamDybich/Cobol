       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS07EX01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        77 x PIC 9.
       PROCEDURE DIVISION.
      * Mainline
           PERFORM 1-SEKCJA VARYING x FROM 1 BY 3 UNTIL x>5.            
           DISPLAY "wrocil do prod. div"
           STOP RUN.
    
           1-Sekcja SECTION.
           1-Par.
               DISPLAY X
               DISPLAY 'Sekcja 1, paragraf 1'.
        
           2-Par.
               DISPLAY 'Sekcja 1, paragraf 2'.
        
           2-Sekcja SECTION.
           3-Par.
               DISPLAY 'Sekcja 2, paragraf 3'.
           4-Par.
               DISPLAY 'Sekcja 2, paragraf 4'.
           5-Par.
               DISPLAY 'Sekcja 2, paragraf 5'.
