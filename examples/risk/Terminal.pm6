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

	method read-answer {

		### my $asnwer = get;
		my $answer = prompt "What do you want to do ?";

		return $answer;
	}

	### print the room/battle-field in ascii
	method paint-room($room) {
		say $room.battle-field-ascii;
	}

	method repaint-room($room) {
		self.paint-room($room);
	}

}
