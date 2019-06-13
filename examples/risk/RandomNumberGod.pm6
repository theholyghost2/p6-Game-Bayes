### See the LICENSE file for details
### use v6.0;

unit module RiskGame;

class RiskGame::RandomNumberGod
{

	submethod BUILD() {

	}

	method roll-d2 {
		return 1..2.rand.Int;
	}

	method roll-d4 {
		return 1..4.rand.Int;
	}

	method roll-d6 {
		return 1..6.rand.Int;
	}


}
