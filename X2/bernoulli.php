<?php
// Progp X2 Bernoulli
// Authors: Johan Callvik & Mauritz Zachrisson

$input = $argv[1];

function B($n) {
	$B = array();
	$B[0] = 1;

	for ($m = 1; $m <= $n; $m++) { 
		$B[$m] = 0;
		for ($k = 0; $k <= $m - 1; $k++) { 
			$B[$m] = $B[$m] - binom($m + 1, $k) * $B[$k];
		}
		$B[$m] = $B[$m] / ($m + 1);
	}

	return $B[$n];
}

function binom($n, $k) {
	$r = 1;
	for ($i = 1; $i <= $k; $i++) {
		$r = $r * ($n - $i + 1) / $i;
	}
	return $r;
}

echo B($input) . "\n";

?>