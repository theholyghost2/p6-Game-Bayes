use v6.c;
use Game::Stats::DistributionPopulation;

class Game::Bayes::Interval {

	has $.lower is rw;
	has $.upper is rw;
	has $.i is rw; ### ith interval

	method BUILD(:$low, :$high, :$ith) {
		$.lower = $low;
		$.upper = $high;
		$.i = $ith;
	}


	### bring in a complex number over the upper boundary
	method complexify() {
		$.upper = Complex.new(0, $.upper);
	}	

	method midpoint($width) {

		return $.lower + ($.i - 1/2) * $width;

	}	

}	
