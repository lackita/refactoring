package Rental;
use strict;
use warnings;
no warnings qw(uninitialized);

sub new {
	my ($class, $movie, $daysrented) = @_;
	return bless {
		MOVIE => $movie,
		DAYSRENTED => $daysrented,
	}, $class;
}

sub GetDaysRented {
	my ($self) = @_;
	return $self->{DAYSRENTED};
}

sub GetMovie {
	my ($self) = @_;
	return $self->{MOVIE};
}

1;
