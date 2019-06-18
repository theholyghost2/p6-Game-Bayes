use v6.c;

use Game::Bayes::Hypothesis;
use Game::Stats:Probability;

class Game::Bayes::RiskFunction {

	has $.hypothesis is rw;

	method BUILD(:@ddistribution) {
		
		$.hypothesis = Game::Bayes::Hypothesis.new(distribution => @ddistribution);

	}

}
