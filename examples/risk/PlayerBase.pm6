### See the LICENSE file for details
### use v6.0;

use Terminal;

unit module RiskGame;

### This class can be used for a risk-o-matic, computer players and keyboard
### controlled players

class RiskGame::PlayerBase
{

	has $.terminal is rw;

	submethod BUILD() {
		
	}

	multi method before-attack-region($region) {
		return 0 if $region.controlling-player != self; ### FIXME

		$!terminal.write-new-line(
			"You cannot attack your own region in this game.");

		return 1;
	}

	multi method attack-region($region) {
		 return if self.before-attack-region($region);


	}

	multi method play-a-round($room) {

	}

}
