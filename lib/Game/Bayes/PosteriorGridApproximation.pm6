use v6.c;

### p. 79, Monte Carlo Methods for Bayes Comp.

class Game::Bayes::PosteriorGridApproximation
{
	has @.intervals is rw;
	has @.interval-widths is rw; ### width = h = (b - a) / N

	submethod BUILD() {

	}

	### interval-widths are made the same over all intervals by using this 
	### method based on numberof intervals
	multi method addIntervalWithUpdate($b, $a) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a, @.intervals.elems));
		### NOTE : needs to be divided by N, which is the 
		### total number of intervals which is auto-updated here : 
		
		my $N = @.intervals.elems;
		push (@.interval-widths, ($b - $a) * ($N - 1) / $N);
	
		### adjust widths and midpoint of the other intervals	
		loop (my $i = 0; $i < @.interval-widths.elems - 1; $i++) {
			@.interval-widths[$i] = (@.intervals[$i].upper - @.intervals[$i].lower)  * ($N - 1) / $N;
			@.intervals[$i].set-midpoint(($b - $a) / $N)
		}

		
	}

	multi method addIntervalNoUpdate($b, $a, $N = @.intervals.elems) {

		push (@.intervals, Game::Bayes::Interval.new($b, $a, $N));
		@.intervals[@.intervals.elems - 1].set-midpoint(($b - $a) / $N);
		push (@.interval-widths, ($b - $a) / $N);

	}

	### method with specific interval width, $N gets changed in the
	### above addIntervalWithUpdate method
	multi method addInterval($b, $a, $N) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a, $N));
		@.intervals[@.intervals.elems - 1].set-midpoint(($b - $a) / $N);
		push (@.interval-widths,  ($b - $a) / $N);

	}

	multi method generateIntervals($a) {

		### FIXME						

	}	

	### approxmation-c is h * Sigma q(theta(i) | y)
	### where h is a interval width
	### theta(i) is the midpoint of (a,b)
	### theta(i) = a + (i - 1/2)* width where i is the ith interval
	#
	### This is c(y) in f(theta(i) | y) = 1/c(y) * q(theta(i) | y)
	### ~== 1 / h * q(theta(i) | y) / Sigma q(theta(j) | y)
	### @midpointps are q(theta(i) | y) probabilities, hereunder
	method approximation-c(@midpointps, $width) {

		my $sum = 0.0;

		loop (my $i = 0; $i < @midpointps.elems; $i++) {
			$sum += @midpointps[$i];
		}

		### index 0 here is a default width (h) 
		return $width * $sum;
	}

	### Gauss Integral method of approximation-c for Bayesian Learning
	### Gauss Integral is a uniformly distributed probability (IntegralExp)
	### standard normal as a default case $mu = mean = 0, $sigma = 1
	method approximation-c2($midpointp, $N = @.intervals.elems, $mu = 0, $sigma = 1) {
		my $p = Game::Bayes::IntegralExp.new;
		
		return $midpointp / $p.Probability($N, 1);	
	}

	### Use approximationp below to calculate the approximation of 
	### the posterior
	
	### approxmationp is q(theta(i) | y) / (h * Sigma( q(theta(j) | y))
	### @midpointp is q(theta(i) | y),
	### Again, the midpointps list contains q(theta(i))
	method approximationp(@midpointps, $width, $midpointp) {

		return $midpointp / self.approximation-c(@midpointps, $width); 	

	}

	### Bayesian Learning method
	method BayesLearn($midpointp, $N = @.intervals.elems, $mu = 0, $sigma = 1) {

		return self.approximation-c2($midpointp, $N, $mu, $sigma); 	

	}
}	
