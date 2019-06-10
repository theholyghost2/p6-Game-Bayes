use v6.c;
use Game::Stats::DistributionPopulation;

class Game::Bayes::DecisionRule is Game::Stats::DistributionPopulation {

	### has $.decisions;

	method BUILD(:@decisiondistrib) {
		@.population = @decisiondistrib;
	}

	method gen {
		return @.population[(0..^@.population.elems).rand];
	}	

	method decide-on-risk($action) {
		my $p = self.gen;
			
		return $action.BayesianLoss($p); ### Risk on cond P or P
	}	

}

