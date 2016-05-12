"Our class that will calculate the desired Bernoulli number."
Object subclass: Bernoulli [
		binom: n number: k [			"The first method calculates the binom taking arguments binon: n and number: k" 
			|r|
			r := 1.
			1 to: k do: [:i |
				r := r *(n - i + 1)/i.
			].
			^r 
		]

	bernoulli: n [
		|B|
		B := Array new: n+1. "We need to increase the length of the array by 1 because we start at index 1."
		B at: 1 put: 1.		 "Bernoulli number 0 is 1"
		2 to: n+1 do: [:m | 
			B at: m put: 0.
			1 to: (m-1) do: [:k | 
				B at: m put: ((B at: m) - ((self binom: (m) number: (k-1)) * (B at: k))).
				].
				B at: m put: ((B at: m)/(m)).	"m+1 behövs inte eftersom vi går från 2"
			].
			^(B at: n+1).
		]	
	
]

Eval [
	'Ange önskat Bernoulli number? ' display.
	n :=  stdin nextLine asInteger.			"Take our parameter n from the stdin."
	((Bernoulli new) bernoulli: n) printNl.  "Creates a new bernoulli object and runs the method bernoulli with the argument n."
]
