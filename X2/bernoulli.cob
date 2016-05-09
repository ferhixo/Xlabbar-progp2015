IDENTIFICATION DIVISION.
PROGRAM-ID. Bernoulli.
AUTHOR. Johan Callvik. Mauritz Zachrisson.

DATA DIVISION.

WORKING-STORAGE SECTION.
01 i 		PIC 99.
01 n        PIC 99.
01 m        PIC 99.
01 m1 		PIC 99.
01 k        PIC 99.
01 r 		FLOAT-LONG.
01 WS-TABLE.
	05 Ber FLOAT-LONG VALUE ZEROS OCCURS 10 TIMES.

PROCEDURE DIVISION.
	
	DISPLAY "Mata in sökt Bermoullital (N): "
	ACCEPT n

	PERFORM VARYING m FROM 1 BY 1 UNTIL m > n
		ADD 1 TO m GIVING m1

		PERFORM VARYING k FROM 0 BY 1 UNTIL k >= m

			PERFORM BINOM

			*> Hoppa över multiplikation med Ber(0)
			IF k > 0
				MULTIPLY Ber(k) BY r
			END-IF

			SUBTRACT r FROM Ber(m)

		END-PERFORM

		DIVIDE m1 INTO Ber(m)
		
	END-PERFORM
	DISPLAY Ber(n)
	STOP RUN.

    BINOM.
    	MOVE 1 TO r
		PERFORM VARYING i from 1 by 1 until i > k
			COMPUTE r = r * (m1 - i + 1) / i END-COMPUTE
		END-PERFORM.
