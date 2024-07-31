       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLS06EX01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 Panstwo-init.
           05 FILLER PIC X(10) VALUE 'Rosja'.
           05 FILLER PIC X(10) VALUE 'Moskwa'.
           05 FILLER PIC 9(3).9 VALUE 17.1.
       
           05 FILLER PIC X(10) VALUE 'Kanada'.
           05 FILLER PIC X(10) VALUE 'Ottawa'.
           05 FILLER PIC 9(3).9 VALUE 10.
       
           05 FILLER PIC X(10) VALUE 'Chiny'.
           05 FILLER PIC X(10) VALUE 'Peking'.
           05 FILLER PIC 9(3).9 VALUE 9.6.
       
           05 FILLER PIC X(10) VALUE 'USA'.
           05 FILLER PIC X(10) VALUE 'Waszygton'.
           05 FILLER PIC 9(3).9 VALUE 9.5.
       
           05 FILLER PIC X(10) VALUE 'Hiszpania'.
           05 FILLER PIC X(10) VALUE 'Madryt'.
           05 FILLER PIC 9(3).9 VALUE 0.5.  
       
           05 FILLER PIC X(10) VALUE 'Polska'.
           05 FILLER PIC X(10) VALUE 'Warszawa'.
           05 FILLER PIC 9(3).9 VALUE 0.3. 
       
        01 FILLER REDEFINES panstwo-init.
           02 Panstwo  OCCURS 10 DESCENDING KEY pow INDEXED BY i.
           05 nazwa   PIC X(10).
           05 stolica PIC X(10).
           05 pow     PIC 9(3).9.

        01 ZM PIC 9(4) COMP.

       PROCEDURE DIVISION.
           
           PERFORM VARYING ZM FROM 1 by 1 UNTIL ZM>10
                   DISPLAY NAZWA (ZM) " " STOLICA (ZM) " " POW (ZM) 
           END-PERFORM.

           PERFORM VARYING ZM FROM 1 by 1 UNTIL ZM>10
               IF STOLICA (ZM) = "Madryt"               
                   DISPLAY NAZWA (ZM) " " STOLICA (ZM) " " POW (ZM) 
                   END-IF

           END-PERFORM.
           DISPLAY " ".
           PERFORM VARYING ZM FROM 1 by 1 UNTIL ZM>10
               IF POW (ZM) > 000.6               
                   DISPLAY NAZWA (ZM) " " STOLICA (ZM) " " POW (ZM) 
                   END-IF
                                      
           END-PERFORM.

           DISPLAY " ".
        
           SET i TO 1

           SEARCH PANSTWO
               AT END DISPLAY "nie ma czegos takiego"
               WHEN STOLICA(i) = "samlot"
                   DISPLAY NAZWA (i) " " STOLICA (i) " " POW (i) 
               END-SEARCH
           
           DISPLAY " ".
        
           SET i TO 1

           SEARCH ALL PANSTWO
               AT END DISPLAY "NIE"
               WHEN POW(i) = "009.5"
                   DISPLAY NAZWA (i) " " STOLICA (i) " " POW (i) 
               END-SEARCH

           STOP RUN.
