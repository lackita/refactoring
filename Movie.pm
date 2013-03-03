package Movie;
use strict;
use warnings;
no warnings qw(uninitialized);

use constant {
	CHILDRENS => 2,
	REGULAR => 0,
	NEWRELEASE => 1,
};

sub new {
	my ($class, $title, $pricecode) = @_;
	return bless {
		TITLE => $title,
		PRICECODE => $pricecode,
	}, $class;
}

sub GetPriceCode {
	my ($self) = @_;
	return $self->{PRICECODE};
}

sub SetPriceCode {
	my ($self, $arg) = @_;
	$self->{PRICECODE} = $arg;
}

sub GetTitle {
	my ($self) = @_;
	return $self->{TITLE};
}

1;
