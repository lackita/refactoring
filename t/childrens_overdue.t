use strict;
use Test::More tests => 1;

use Movie;
use Rental;
use Customer;

my $johnsmith = Customer->new('John Smith');
$johnsmith->AddRental(Rental->new(Movie->new('Cars', Movie::CHILDRENS), 5));

is($johnsmith->Statement, q{Rental Record for John Smith
	Cars	4.5
Amount owed is 4.5
You earned 1 frequent renter points});
