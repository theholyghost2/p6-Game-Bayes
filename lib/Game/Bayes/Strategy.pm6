use v6.c; 
use Game::Stats::Population;
 
class Game::Bayes::Strategy is Game::Stats::DistributionPopulation {

	has @.strategypopulation;

	method BUILD(:@lossfuncs) {
		@.population = @lossfuncs; ### LossFunction instances
		@.strategypopulation = Game::Stats::Population.new;
	}

	method addStrategy($s) {
		@.strategypopulation.add($s);
	}
	
	method minimax(@condps) { ### This is a minimax value, 
				  ### to be used in the infimum, for minimum 
				  ### probability of strategies

		my $sup = 0.0.	

		for @!population -> $f {
			my $loss = $f.BayesianLoss(@condps);
			if ($loss > $sup) {
				$sup = $loss;
			}		
		}

		return $sup;
	}

	method randomstrategyminimax(@condps) { ### This has to be run several
						### times with infimum of this
						### function to have a smallest
						### probability
		my $sup = 0.0.	

		loop (my $i = 0; $i < @.strategypopulation.population.elems.rand; )
		 {
			my $loss = self.minimax(@condps);
			if ($loss > $sup) {
				$sup = $loss;
			}		
		}
		
		return $sup;
	}

}
