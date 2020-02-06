use v6.c;
use Game::Stats::DistributionPopulation;

class Game::Bayes::Interval {

	has $.lower is rw;
	has $.upper is rw;
	has $.midpoint is rw;
	has $.i is rw; ### ith interval

	method BUILD(:$low, :$high, :$ith) {
		$.lower = $low;
		$.upper = $high;

		$.i = $ith;

		$.midpoint = self.midpoint($b - $a / $ith);

	}


	### bring in a complex number over the upper boundary
	method complexify() {
		$.upper = Complex.new(0, $.upper);
	}	

	### The midpoint serves as a probability q(theta(i) | y) 
	### where theta(i) is a midpoint
	### theta(i) = a + (i - 1/2)* width where i is the ith interval
	method midpoint($width) {

		return $.lower + ($.i - 1/2) * $width;

	}	

	method set-midpoint($width) {

		$.midpoint = $.lower + ($.i - 1/2) * $width;

	}	

}	
