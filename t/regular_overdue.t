use strict;
use Test::More tests => 1;

use Movie;
use Rental;
use Customer;

my $johnsmith = Customer->new('John Smith');
$johnsmith->AddRental(Rental->new(Movie->new('Star Wars', Movie::REGULAR), 4));

is($johnsmith->Statement, q{Rental Record for John Smith
	Star Wars	5
Amount owed is 5
You earned 1 frequent renter points});
