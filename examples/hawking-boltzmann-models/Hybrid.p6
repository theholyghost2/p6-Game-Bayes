use BoltzmannDistribution; 
use BoltzmannFunction; 
use Temperature;

use Game::Bayes::Action;

sub loss {
	my $hbd = BoltzmannDistribution.new;
	my $hbf = BoltzmannFunction.new;
	my $ht = Temperature.new;

	### add some energies of states to the (Boltzmann) distribution
	$hbd.add($hbf.energy-probability($ht.Temperature(0.1 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.2 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.3 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.4 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.5 * 10 ** 30));

	my $action = Game::Bayes::Action.new(actiondistrib => $hbd.population);

	### constant (Hawking) temperature
	my $hbd-energies = BoltzmannDistribution.new;

	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(0));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(1));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(2));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(3));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(4));


}

### loss();
