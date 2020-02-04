use v6.c;

### p. 79, Monte Carlo Methods for Bayes Comp.

class Game::Bayes::PosteriorApproximation
{
	has @.intervals is rw;
	has @.interval-widths is rw;

	method BUILD() {

		

	}

	method addInterval($b, $a, $N) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a));
		push (@.interval-widths, ($b - $a) / $N); ### NOTE : needs to be divided by N
	}

	method generateIntervals($a) {

		### FIXME						

	}	

	### q(theta(i) | y) / Sigma( q(theta(j) | y)
	### theta(i) is the midpoint of (a,b)
	### theta(i) = a + (i - 1/2)width
	method approximation(@midpoints, $width) {

		my $sum = 0.0;

		loop (my $i = 0; $i < @midpoints.elems; $i++) {
			$sum += @midpoints[$i];
		}

		return 1 / $width * ( @midpoints[0] / $sum );
	}
}	
