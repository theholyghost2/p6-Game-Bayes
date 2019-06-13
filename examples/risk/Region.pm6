### See the LICENSE file for details
### use v6.0;

unit module RiskGame;

class RiskGame::Region
{
	has $.name is rw;
	has $.army is rw;

	has $.controlling-player is rw;

	submethod BUILD(:$id-string) {
		$!name = $id-string;
		$!army = Nil;
	}

	multi method attack($player, $other-region) {
		
	}

	multi method add-to-army($army) {

	}
}
