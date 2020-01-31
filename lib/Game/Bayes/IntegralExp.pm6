use v6.c;

class Game::Bayes::IntegralExp
{
	method BUILD() {

	}

	method Integral($expvalue) {

		return exp($expvalue) / $expvalue;

	}	

	### calculation of e.g. Gauss curve where $functionvalue is 
	### the exp function power, the probability which is the integral of exp
	
	method probability($functionvalue) {

		return self.Integral($functionvalue);

	}	


}	
