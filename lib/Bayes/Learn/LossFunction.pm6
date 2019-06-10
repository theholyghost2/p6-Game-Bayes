use v6.c;

use Game::Bayes::Hypothesis;
use Game::Stats:Probability;

class Game::Bayes::LossFunction {

	has $.hypothesis;

	method BUILD(:@ddistribution) {
		
		$.hypothesis = Game::Bayes::Hypothesis.new(@ddistribution);

	}

	method loss(@condps) { ### The integral inside loss is a Riemann sum

		my $prob = new Game::Stats::Probability($.hypothesis.population);
		my $sum = 0.0;

		loop (my $i = 0.0; $i < $.hypothesis.population.elems; $i++) {
			$sum += $prob.CondP($i, @condps[$i]);
		}	
		return $sum;
	}

	method BayesisanLoss(@condps) {

		my $prob = new Probability($.hypothesis.population);
		my $sum = 0.0;

		my @array = 0..^$.hypothesis.population.elems;

		loop (my $i = 0.0; $i < $.hypothesis.population.elems; $i++) {
			$sum += $prob.Bayes(@array, @condps, $i);
		}	
		return $sum;
	}

}
