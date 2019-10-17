	B  main

born	DEFB "you were born in \0"
were	DEFB "you were \0"
in	DEFB " in \0"
are	DEFB "you are \0"
this	DEFB " this year\n\0"
	ALIGN

pres	DEFW 2005	; present = 2005 // Change this code
birth	DEFW 1959	; birth = 1959   // Change this code
age	DEFW 1 ; age = 1        // Change this code

main	LDR R4, pres
	LDR R5, birth
	MOV R6, R5
	ADD R6, R6, #1
	LDR R7, age



	ADR R0, born
	SVC 3
	MOV R0, R5 ; make sure this will work!
	SVC 4
	MOV R0, #10
	SVC 0

lStart	ADD R7, R7, #1
	ADD R6, R6, #1

	; this code does print "you were " + str(age) + " in " + str(year) // DO NOT change the instructions below (except for part 5)
	ADR R0, were
	SVC 3
	MOV R0, R7 ; make sure this will work!
	SVC 4
	ADR R0, in
	SVC 3
	MOV R0, R6 ; make sure this will work!
	SVC 4
	MOV R0, #10
	SVC 0
	
	CMP R4,R6
	BNE lStart
	
	ADR R0, are
	SVC 3
	MOV R0, R7 ;make sure this will work!
	SVC 4
	ADR R0, this
	SVC 3

	
	SVC 2
