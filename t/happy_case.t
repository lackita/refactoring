use strict;
use Test::More tests => 1;

use Movie;
use Rental;
use Customer;

my $johnsmith = Customer->new('John Smith');
$johnsmith->AddRental(Rental->new(Movie->new('Star Wars', Movie::REGULAR), 1));
$johnsmith->AddRental(Rental->new(Movie->new('Cars', Movie::CHILDRENS), 2));
$johnsmith->AddRental(Rental->new(Movie->new('Iron Man 3', Movie::NEWRELEASE)));

is($johnsmith->Statement, 'foo');
