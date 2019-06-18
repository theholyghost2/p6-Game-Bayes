use v6.c;

use Game::Bayes::Hypothesis;
use Game::Stats::Probability;

class Game::Bayes::LossFunction {

	has $.hypothesis;

	method BUILD(:@ddistribution) {
		
		$.hypothesis = Game::Bayes::Hypothesis.new(@ddistribution);

	}

	method Loss(@condps) { ### The integral inside loss is a Riemann sum

		my $prob = Game::Stats::Probability.new(xpop => $.hypothesis.population);
		my $sum = 0.0;

		loop (my $i = 0.0; $i < $.hypothesis.population.elems; $i++) {
			$sum += $prob.CondP($i, @condps[$i]);
		}	
		return $sum;
	}

	method BayesisanLoss(@condps) {

		my $prob = Game::Stats::Probability.new(xpop => $.hypothesis.population);
		my $sum = 0.0;

		my @array = 0..^$.hypothesis.population.elems;

		loop (my $i = 0.0; $i < $.hypothesis.population.elems; $i++) {
			$sum += $prob.Bayes(@array, @condps, $i);
		}	
		return $sum;
	}

}
