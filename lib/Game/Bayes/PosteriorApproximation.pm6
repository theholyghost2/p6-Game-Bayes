use v6.c;
use Game::Stats::DistributionPopulation;


### p. 79, Monte Carlo Methods for Bayes Comp.

class Game::Bayes::PosteriorApproximation
{
	has @.intervals is rw;
	has @.interval-widths is rw;

	method BUILD() {

		

	}

	method addInterval($b, $a) {
		push (@.intervals, Game::Bayes::Interval.new($b, $a));
		push (@.interval-widths, ($b - $a)); ### NOTE : needs to be divided by N
	}

	method generateIntervals($a) {

				

	}	
}	
