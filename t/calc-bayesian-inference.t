use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

use Game::Bayes::Action;
use Game::Bayes::Hypothesis;
use Game::Bayes::LossFunction;
use Game::Bayes::Strategy;

my $num-tests = 7;

plan $num-tests;
 
# .... tests 
#  

my $p = 0.1;

my @plist;
my @indices;

loop (my $i = $p, my $j = 0; $p <= 1.0; $i+=0.1, $j++) {
	push(@plist, $i);
	push(@indices, $j);
}


my $actionl = Game::Bayes::Action.new(actiondistrib => @plist);

is-deeply $actionl.Loss(0.1, 0.2), $actionl.Loss(0.1, 0.2);
is-deeply $actionl.BayesianLoss(0.3), $actionl.BayesianLoss(0.3);

my $lossf = Game::Bayes::LossFunction.new(ddistribution => @plist);

is-deeply $lossf.Loss(@plist), $lossf.Loss(@plist);
is-deeply $lossf.BayesianLoss(@plist), $lossf.BayesianLoss(@plist);

my @lossfuncs = <$lossf>;
my $strategy = Game::Bayes::Strategy.new(lossfuncs => @lossfuncs);

is-deeply $strategy.minimax(@plist), $strategy.minimax(@plist);

my $s = 0.1;
$strategy.addStrategy($s);
$s = 0.1;
$strategy.addStrategy($s);
$s = 0.1;
$strategy.addStrategy($s);
$s = 0.1;
$strategy.addStrategy($s);

###FIXME is-deeply $strategy.randomstrategyminimax(@plist), $strategy.randomstrategyminimax(@plist);

my $bayesl = Game::Bayes::Hypothesis.new( distribution => @plist);

is-deeply $bayesl.hMAP(@plist), $bayesl.hMAP(@plist);
is-deeply $bayesl.hML(@plist), $bayesl.hML(@plist);
  
done-testing;  # optional with 'plan' 

