use v6.c;
use Game::Stats::DistributionPopulation;

class Game::Bayes::Action is Game::Stats::DistributionPopulation {

	has $.actionthreshold;

	method BUILD(:@actiondistrib) {
		$.actionthreshold = 0.0000001;
		@.population = @actiondistrib;
	}

	method Loss($theta, $a) {

		if ($theta - $a >= 0) {
			return $theta - $a; ### P - P'
		} 

		if ($theta - $a <= 0) {
			return 2 * ($a - $theta); ### some variance
		}
	}


	### Bayesian Expected Loss E[A] * Loss(p,a) of action a
	### The integral approximation in this function is a potential
	method BayesianLoss($believedp) { ### believedp is about an action between [0,1]

		my $sum = 0.0;

		### Int 0->a (2*(a-p)) where p is a distribution
		loop (my $a = 0; $a < $believedp; $a+=$.actionthreshold) {
			$sum += 2*($a -$believedp) * $believedp;
		}
		### +
		### Int a->1 (p-a) where p is a distribution
		loop (my $b = $believedp; $b < 1; $b+=$.actionthreshold) {
			$sum += ($believedp - $b) * $believedp;
		}

		return $sum;
	}

	method RiskCondP($m,$n) { ### P(B|A) in a conditional distribution 

		my $sum = 0.0;

		my $prob = Game::Stats::Probability.new(xpop => @.population);
		my $believedp = $prob.CalculatedCondP($m, $n);

		### Int 0->a (2*(a-p)) where p is a distribution
		loop (my $a = 0; $a < $believedp; $a+=$.actionthreshold) {
			$sum += 2*($a -$believedp) * $believedp;
		}
		### +
		### Int a->1 (p-a) where p is a distribution
		loop (my $b = $believedp; $b < 1; $b+=$.actionthreshold) {
			$sum += ($believedp - $b) * $believedp;
		}

		return $sum;
	}

}
