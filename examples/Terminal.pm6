### See the LICENSE file for details
### use v6.0;

unit module RiskGame;

class RiskGame::Terminal
{
	submethod BUILD() {
	}

	method write-new-line($string) {

		say $string ~ "\n";
	
	}

}
