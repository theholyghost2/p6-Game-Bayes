### See the LICENSE file for details
### use v6.0;

unit module RiskGame;

class RiskGame::Army
{

	has $.count is rw;

	submethod BUILD(:$c) {
		$!count = $c;
	}

	method attack($player) {

	}

	method add-to-count($n) {
		$!count += $n;
	}

}
