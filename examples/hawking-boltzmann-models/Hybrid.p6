use BoltzmannDistribution; 
use BoltzmannFunction; 
use HawkingTemperature;

use Game::Bayes::Action;
use Game::Bayes::LossFunction;
use Game::Bayes::Strategy;

sub loss {
	my $hbd = BoltzmannDistribution.new;
	my $hbf = BoltzmannFunction.new;
	my $ht = HawkingTemperature.new;

	### add some energies of states to the (Boltzmann) distribution
	### using black hole masses as an argument
	
	$hbd.add($hbf.energy-probability($ht.Temperature(0.1 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.2 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.3 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.4 * 10 ** 30));
	$hbd.add($hbf.energy-probability($ht.Temperature(0.5 * 10 ** 30));

	my $action = Game::Bayes::Action.new(actiondistrib => @hbd.population);

	### constant (Hawking) temperature, in general it needs to be the above
	my $hbd-energies = BoltzmannDistribution.new;

	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(0));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(1));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(2));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(3));
	$hbd-energies.add($action.BayesianLoss($hbd.nth-energy-probability(4));

	### print the losses on the Boltzmann distribution elements
	say $action.Loss($hbd.nth(0), $hbd.nth(1));
	say $action.Loss($hbd.nth(1), $hbd.nth(2));
	say $action.Loss($hbd.nth(2), $hbd.nth(3));
	say $action.Loss($hbd.nth(3), $hbd.nth(4));

	my $lossf = Game::Bayes::LossFunction.new(ddistribution => @hbd.population);
	### print the loss on the Boltzmann function values
	say $lossf.BayesianLoss(@hbd.population);

	### print the strategy minimax value
	my @lossfuncs = <$lossf>;
	my $strategy = Game::Bayes::Strategy.new(lossfuncs => @lossfuncs);

	say $strategy.minimax(@hbd.population);
}

### loss();
