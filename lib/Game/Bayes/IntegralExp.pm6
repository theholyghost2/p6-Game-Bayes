use v6.c;

class Game::Bayes::IntegralExp
{
	method BUILD() {

	}


	### calculation of e.g. Gauss curve probability 
	### the exp function power, the probability which is the integral of exp
	### with high bound $b and lower bound $a

	method GaussPprobability($b, $a, $mu, $sigma) {

		return self.GaussIntegralFunctionality($mu, $sigma, $b) -  self.GaussIntegralFunctionality($mu, $sigma, $a);
	}

	method Integral($high, $low) {

		return self.IntegralFunctionality($high) - self.IntegralFunctionality($low);
	}	

	method IntegralFunctionality($expvalue) {

		return exp($expvalue) / $expvalue;

	}	

	method GaussIntegralFunctionality($mu, $sigma, $expvalue) {

		return exp(-1 * ($expvalue - $mu) / $sigma) / (* -1 ($expvalue - $mu) / $sigma);

	}	

}	
