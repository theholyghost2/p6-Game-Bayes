use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

use Game::Bayes::Action;
use Game::Bayes::Hypothesis;

my $num-tests = 4;

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

my $bayesl = Game::Bayes::Hypothesis.new( distribution => @plist);

is-deeply $bayesl.hMAP(@plist), $bayesl.hMAP(@plist);
is-deeply $bayesl.hML(@plist), $bayesl.hML(@plist);
  
done-testing;  # optional with 'plan' 

