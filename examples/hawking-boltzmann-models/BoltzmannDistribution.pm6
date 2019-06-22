### See the LICENSE file for details
### use v6.0;

use Game::Stats::DistributionPopulation;

unit module HawkingBoltzmannModel;

### Stands for a Boltzmann distribution

class HawkingBoltzmannModel::BoltzmannDistribution is Game::Stats::DistributionPopulation
{

	has $.kB is rw; ### Boltzmann constant
	has $.T is rw; ### temperature

	submethod BUILD(:$q = 0.5) { ### $q is mean energy 
		$!kB = 1.380649 * 10 ** -23;

		$!T = 1.227 * 10,*  -23; ### default hawking temperature
	}

	method nth-energy-probability($n, $t = $!T) { ### nth state energy, $!T is constant Hawking temperature

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
