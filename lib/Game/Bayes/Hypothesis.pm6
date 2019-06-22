use v6.c;
use Game::Stats::DistributionPopulation;

class Game::Bayes::Hypothesis is Game::Stats::DistributionPopulation {

	has @.hs is rw; ### hypotheses != population of the base class

	method BUILD(:@distribution) { ### The 
		@.population = @distribution; ### posterior

	}

	method addh($h) { ### add a new hypothesis, which helps Bayesian learning
		push(@.hs, $h);
	}

	method hMAPindex(@condps, $hidx) { ### Maximum a posteriori, 1 hypothesis
		my $prob = Game::Stats::Probability.new(xpop => @.population);		
		my $condprob = Game::Stats::Probability.new( xpop => @condps); 

		my @indices = 0..^@.population.elems; ### FIXME

		return $prob.Bayes(@indices, $condprob.population, $hidx);
	}

	method hMAP(@condps) { ### Brute Force MAP learner

		my $max = 0.0;
		my $h = 0.0;
		loop (my $i = 0; $i < @.hs.elems; $i++) {
			if (my $p = self.hMAPindex(@condps, $i) > $max) {
				$max = $p;
				$h = @.hs.nth($i);
			}
		}
		return $h;
	}

	method hML(@condps) { ### Learning a real valued function 
			      ### hML = argmax (D|h) 
			      ### = argmax Product(p(d_i,h))
			 
		my $max = 0.0;
		my $hh = 0.0;

		for @.hs -> $h {
			my $sum = 0.0;
			loop (my $i = 0; $i < @.hs.elems; $i++) {
				$sum += - (self.nth($i) - $h) * (self.nth($i) - $h);
			}	
			if ($sum > $max) {
				$max = $sum;
				$hh = $h;
			}
		}

		return $hh;
	}
		

}	
