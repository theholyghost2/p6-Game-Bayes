### See the LICENSE file for details
### use v6.0;

unit module RiskGame;

class RiskGame::RandomNumberGod
{

	submethod BUILD() {

	}

	method roll-d2 {
		return 2.rand.Int;
	}

	method roll-d4 {
		return 4.rand.Int;
	}

	method roll-d6 {
		return 6.rand.Int;
	}


}
