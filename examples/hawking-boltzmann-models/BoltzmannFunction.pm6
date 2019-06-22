### See the LICENSE file for details
### use v6.0;

unit module HawkingBoltzmannModel;

### Stands for a Boltzmann distribution

class HawkingBoltzmannModel::BoltzmannFunction
{

	has $.kB is rw; ### Boltzmann constant
	has $.T is rw; ### temperature
	has $.Q is rw; ### sum of energy of all states

	submethod BUILD(:$q = 0.5) { ### $q is mean energy 
		$!kB = 1.380649 * 10 ** -23;
	       	$!Q = $q;	

		$!T = 1.227 * 10,*  -23; ### default hawking temperature
	}

	method energy-probability($t, $epsilon = 0.5) { ### epsilon is energy of a state
		return (1 / ($!Q * exp($epsilon / ($!kB * $t))));	

	}

	### distribution with constant temperature for prediction
	method constant-energy-probability ($epsilon = 0.5) {

		return (1 / ($!Q * exp($epsilon / ($!kB * $!T))));	

	}

}
