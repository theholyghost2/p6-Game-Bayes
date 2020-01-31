use v6.c;
use Game::Stats::DistributionPopulation;

class Game::Bayes::Interval {

	has $.lower is rw;
	has $.upper is rw;

	method BUILD(:$low, :$high) {
		$.lower = $low;
		$.upper = $high;
	}

}	
