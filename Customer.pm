package Customer;
use strict;
use warnings;
no warnings 'uninitialized';

use Movie;

sub new {
	my ($class, $name) = @_;
	return bless {
		NAME => $name,
		RENTALS => [],
	}, $class;
}

sub AddRental {
	my ($self, $arg) = @_;
	push @{$self->{RENTALS}}, $arg;
}

sub GetName {
	my ($self) = @_;
	return $self->{NAME};
}

sub Statement {
	my ($self) = @_;
	my $totalamount = 0;
	my $frequentrenterpoints = 0;
	my @rentals = @{$self->{RENTALS}};
	my $result = "Rental Record for " . $self->GetName() . "\n";
	for my $each (@rentals) {
		my $thisamount = 0;

		# determine amounts for each line
		my $pricecode = $each->GetMovie()->GetPriceCode();
		if ($pricecode == Movie::REGULAR) {
			$thisamount += 2;
			if ($each->GetDaysRented() > 2) {
				$thisamount += ($each->GetDaysRented() - 2) * 1.5;
			}
		}
		elsif ($pricecode == Movie::NEWRELEASE) {
			$thisamount += $each->GetDaysRented() * 3;
		}
		elsif ($pricecode == Movie::CHILDRENS) {
			$thisamount += ($each->GetDaysRented() - 3) * 1.5;
		}

		# add frequent renter points
		$frequentrenterpoints ++;
		# add bonus for a two day new release rental
		if (
			($each->GetMovie()->GetPriceCode() == Movie::NEWRELEASE)
			&& $each->GetDaysRented() > 1
		) {
			$frequentrenterpoints ++;
		}

		# show figures for this rental
		$result .= "\t" . $each->GetMovie()->GetTitle() . "\t$thisamount\n";
		$totalamount += $thisamount;
	}
	# add footer lines
	$result .= "Amount owed is $totalamount\n";
	$result .= "You earned $frequentrenterpoints frequent renter points";
	return $result
}

1;
