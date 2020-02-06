use v6.c;

class Game::Bayes::IntegralExp
{
	method BUILD() {

	}


	### calculation of e.g. Gauss curve probability 
	### the exp function power, the probability which is the integral of exp
	### with high bound $b and lower bound $a

	method Probability($b, $a, $mu = 0, $sigma = 1) {
		### FIXME Perl 6 Pi
		return 1 / ($sigma * sqrt(2 * 3.14152829)) * self.GaussIntegralFunctionality2($mu, $sigma, $b) -  
		 (1 / ($sigma * sqrt(2 * 3.14152829)) * self.GaussIntegralFunctionality2($mu, $sigma, $a);
	}

	method Integral($high, $low) {

		return self.IntegralFunctionality($high) - self.IntegralFunctionality($low);
	}	

	method IntegralFunctionality($expvalue) {

		return exp($expvalue) / $expvalue;

	}	

	### minimal integral, no Pi or square power, see Probability 
	### otherwise
	### using quotient rule for f(x) = -1 - $mu and g(x) = $sigma
	method GaussIntegralFunctionality($mu, $sigma, $expvalue) {

		return exp((-1 - $mu) / $sigma) * 
				((-1 * ($expvalue - $mu) / $sigma) / $sigma + 
				(-1 * ($expvalue - $mu) / $sigma));

	}	

	### full integral, squared function, no sqrt(2*Pi)
	method GaussIntegralFunctionality2($mu, $sigma, $expvalue) {

		return exp(- 1 / 2 * (-1 - $mu) / $sigma) * 2 * (-1 - $mu) / $sigma * 
				((-1 / 2 * ($expvalue - $mu) / $sigma) / $sigma + 
				(-1 / 2 * ($expvalue - $mu) / $sigma));

	}	


}	
