use v6.c;

class Game::Bayes::IntegralExp
{
	method BUILD() {

	}


	### calculation of e.g. Gauss curve 
	### the exp function power, the probability which is the integral of exp
	### with high bound $b and lower bound $a

	method probability($b, $a) {

		return self.Integral($b, $a);
	}

	method Integral($high, $low) {

		return self.IntegralFunctionality($high) - self.IntegralFunctionality($low);
	}	

	method IntegralFunctionality($expvalue) {

		return exp($expvalue) / $expvalue;

	}	

}	
