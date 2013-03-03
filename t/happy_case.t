use strict;
use Test::More tests => 1;

use Movie;
use Rental;
use Customer;

my $johnsmith = Customer->new('John Smith');
$johnsmith->AddRental(Rental->new(Movie->new('Star Wars', Movie::REGULAR), 1));
$johnsmith->AddRental(Rental->new(Movie->new('Cars', Movie::CHILDRENS), 2));
$johnsmith->AddRental(Rental->new(Movie->new('Iron Man 3', Movie::NEWRELEASE), 3));

is($johnsmith->Statement, q{Rental Record for John Smith
	Star Wars	2
	Cars	1.5
	Iron Man 3	9
Amount owed is 12.5
You earned 4 frequent renter points});
