use v6.c;

### p. 79, Monte Carlo Methods for Bayes Comp.

class Game::Bayes::PosteriorGridApproximation
{
	has @.intervals is rw;
	has @.interval-widths is rw; ### width = h = (b - a) / N

	submethod BUILD() {

		

	}

	method addInterval($b, $a) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a));
		### NOTE : needs to be divided by N, which is the 
		### total number of intervals which is auto-updated here : 
		
		my $N = @.intervals.elems;
		push (@.interval-widths, ($b - $a) * ($N - 1) / $N);
	
		### adjust widths of the other intervals	
		loop (my $i = 0; $i < @.interval-widths.elems - 1; $i++) {
			@.interval-widths[$i] = (@.intervals[$i].upper - @.intervals[$i].lower)  * ($N - 1) / $N;
		}
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

		loop (my $i = 0; $i < @midpointps.elems; $i++) {
			$sum += @midpointps[$i];
		}

		### index 0 here is a default width (h) 
		return $width * $sum;
	}

	### @midpointp is q(theta(i) | y), hereunder
	method approximationp(@midpointps, $width, $midpointp) {

		return $midpointp / self.approximation-c(@midpointps, $width); 	

	}
}	
