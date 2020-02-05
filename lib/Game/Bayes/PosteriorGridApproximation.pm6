use v6.c;

### p. 79, Monte Carlo Methods for Bayes Comp.

class Game::Bayes::PosteriorGridApproximation
{
	has @.intervals is rw;
	has @.interval-widths is rw;

	method BUILD() {

		

	}

	method addInterval($b, $a, $N) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a));
		push (@.interval-widths, ($b - $a) / $N); ### NOTE : needs to be divided by N, which is the total number of intervals 
	}

	multi method generateIntervals($a) {

		### FIXME						

	}	

	### q(theta(i) | y) / Sigma( q(theta(j) | y)
	### theta(i) is the midpoint of (a,b)
	### theta(i) = a + (i - 1/2)width
	#
	### This is c(y) in f(theta | y) = 1/c(y) * q(theta | y)
	### @midpointps are q(theta(i) | y), hereunder
	method approximation-c(@midpointps, $width) {

		my $sum = 0.0;

		loop (my $i = 0; $i < @midpointsp.elems; $i++) {
			$sum += @midpointps[$i];
		}

		return 1 / $width * ( @midpointsp[0] / $sum );
	}
}	
