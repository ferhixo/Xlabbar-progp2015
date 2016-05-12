;; Author: Johan Callvik & Mauritz Zachrisson
(ns bernoulli)
 

;; This function calculates the desired binominalcoefficent given two arguments.
(defn binom [n k]
    (loop [i 1 r 1.0]
      (if (>= i (+ k 1))
        r
        (recur (+ i 1) (* r (/ (+ (- n i) 1) i))))))



(defn bern [m]
	(if (= m 0)
		1
		(- 0 	
			(/ (apply + (for [k (range m)] (* (binom (+ m 1) k) (bern k))))		;; for loops through values of k up to m and calculates that bernoulli number.
			(+ m 1)																;; apply sums all the bernoulli numbers which are then divided by m + 1.
		)
	)))

;; Prints the first 20 bernoulli numbers.
(println (map (fn [y] (bern y)) (range 20)))



