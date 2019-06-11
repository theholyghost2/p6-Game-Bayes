use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

use Game::Bayes::Action;
use Game::Bayes::DecisionRule;
use Game::Bayes::Hypothesis;
use Game::Bayes::LossFunction;
use Game::Bayes::RiskFunction;
use Game::Bayes::Strategy;

my $num-tests = 6;

plan $num-tests;
 
# .... tests 
#  

use-ok Game::Bayes::Action;
use-ok Game::Bayes::DecisionRule;
use-ok Game::Bayes::Hypothesis;
use-ok Game::Bayes::LossFunction;
use-ok Game::Bayes::RiskFunction;
use-ok Game::Bayes::Strategy;

done-testing;  # optional with 'plan' 
