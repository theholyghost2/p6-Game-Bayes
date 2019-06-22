### See the LICENSE file for details
### use v6.0;

use Game::Stats::DistributionPopulation;

unit module HawkingBoltzmannModel;

### Stands for a Boltzmann distribution, use the add function of the superclass
### to add energy of states 

class HawkingBoltzmannModel::BoltzmannDistribution is Game::Stats::DistributionPopulation
{

	has $.kB is rw; ### Boltzmann constant
	has $.T is rw; ### temperature

	submethod BUILD(:$q = 0.5) { ### $q is energy state sum
		$!kB = 1.380649 * 10 ** -23;

		$!T = 1.227 * 10 *  -23; ### default hawking temperature
	}

	### probability of state $n
	method nth-energy-probability($n, $t = $!T) { ### $!T is constant Hawking temperature

		my $q = 0.0;

		if (@.population.elems == 0) { ### kludge
			return 0.0;
		}

		for @.population -> $e {
			$q += 1 / exp($e / ($!kB * $t)); 
		}	

		return (1 / ($q * exp(self.nth($n) / ($kB * $t))));	

	}

}
