### See the LICENSE file for details
### use v6.0;

### A Room contains the battlefield ready for printing on a terminal in ascii

unit module RiskGame;

class RiskGame::Room
{

	has $.battle-field-ascii is rw;

	submethod BUILD() {
		self.generate-random-room;	
	}

	multi method generate-random-room {

	}
}
