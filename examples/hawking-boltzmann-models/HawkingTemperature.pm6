### See the LICENSE file for details
### use v6.0;

unit module HawkingBoltzmannModel;

class HawkingBoltzmannModel::HawkingTemperature
{

	has $.h is rw; ### Planck's constant
	has $.c is rw; ### speed of light
	has $.G is rw; ### Gravitational constant
	has $.kB is rw; ### Boltzmann constant
	has $.M is rw; ### Mass of the black hole

	has $.PI is rw;

	has $.T is rw;

	submethod BUILD(:$m = 1.98847 * 10 ** 30) {
		$!h = 6.62607015 * 10 ** -34;
		$!c = 3000000000;
		$!G = 6.67430 * 10 ** -11;
		$!kB = 1.380649 * 10 ** -23;

		$!PI = 3.141528;

	       	$!M = $m;	

		$!T = 1.227 * 10,*  -23;
	}

	method Temperature($m = $!M) {
		return ($!h * $.c ** 3) / 
			(8 * $!PI * $.G * $!kB * $m);
	}

	method constant-temperature {
		return $!T;
	}

}
