-module(bernoulli).
-export([binom/2, berno/1]).

berno(0) -> 1;
berno(M) ->
	0 - lists:sum( [binom(M + 1, K) * berno(K) || K <- lists:seq(0, M - 1)] ) / (M + 1).

binom(N, K) ->
	binom(N, K, 1, 1).

binom(_, K, R, X) when X == K + 1 -> R;
binom(N, K, R, I) -> 
	binom(N, K, R * (N - I + 1) / I, I + 1).