use v6.c;

### p. 79, Monte Carlo Methods for Bayes Comp.

class Game::Bayes::PosteriorGridApproximation
{
	has @.intervals is rw;
	has @.interval-widths is rw; ### width = h = (b - a) / N

	submethod BUILD() {

		

	}

	### interval-widths are the same over all intervals by using this method
	multi method addInterval($b, $a) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a, @.intervals.elems));
		### NOTE : needs to be divided by N, which is the 
		### total number of intervals which is auto-updated here : 
		
		my $N = @.intervals.elems;
		push (@.interval-widths, ($b - $a) * ($N - 1) / $N);
	
		### adjust widths of the other intervals	
		loop (my $i = 0; $i < @.interval-widths.elems - 1; $i++) {
			@.interval-widths[$i] = (@.intervals[$i].upper - @.intervals[$i].lower)  * ($N - 1) / $N;
			@.intervals[$i].set-midpoint($N)
		}

		
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

	### Use approximationp below to calculate the approximation of 
	### the posterior
	
	### approxmationp is q(theta(i) | y) / (h * Sigma( q(theta(j) | y))
	### @midpointp is q(theta(i) | y),
	### Again, the midpointps list contains q(theta(i))
	method approximationp(@midpointps, $width, $midpointp) {

		return $midpointp / self.approximation-c(@midpointps, $width); 	

	}
}	
